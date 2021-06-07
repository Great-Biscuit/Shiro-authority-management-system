package com.qfedu.dtboot.quartz;

import com.alibaba.fastjson.JSON;
import com.qfedu.dtboot.entity.ScheduleJob;
import com.qfedu.dtboot.entity.ScheduleJobLog;
import com.qfedu.dtboot.service.ScheduleJobLogService;
import com.qfedu.dtboot.utils.SpringContextUtils;
import org.apache.commons.lang.StringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;
import java.util.Date;

/**
 * Created by helen on 2018/3/12
 */
public class QuartzJob extends QuartzJobBean {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {

        System.out.println("执行任务。。。。。。");
        String json = context.getMergedJobDataMap().getString("JOB_PARAM_KEY");
        ScheduleJob scheduleJob = JSON.parseObject(json, ScheduleJob.class);
        Long jobId = scheduleJob.getJobId();

        String beanName = scheduleJob.getBeanName();
        String methodName = scheduleJob.getMethodName();
        String params = scheduleJob.getParams();

        ScheduleJobLogService scheduleJobLogService = (ScheduleJobLogService)SpringContextUtils.getBean("scheduleJobLogServiceImpl");
        ScheduleJobLog log = new ScheduleJobLog();
        log.setJobId(jobId);
        log.setBeanName(beanName);
        log.setMethodName(methodName);
        log.setParams(params);
        log.setCreateTime(new Date());

        Long startTime = System.currentTimeMillis();

        try {

            Object target = SpringContextUtils.getBean(beanName);
            Method method = null;
            if (StringUtils.isNotBlank(params)) {
                method = target.getClass().getDeclaredMethod(methodName, String.class);
            }else{
                method = target.getClass().getDeclaredMethod(methodName);
            }

            ReflectionUtils.makeAccessible(method);
            if(StringUtils.isNotBlank(params)){
                method.invoke(target, params);
            }else{
                method.invoke(target);
            }

            Long times = System.currentTimeMillis() - startTime;

            log.setStatus((byte)0);//成功
            log.setTimes(times);//耗时

            logger.info("任务执行成功，任务ID：" + jobId + "，总耗时：" + times + "毫秒");

        } catch (Exception e) {

            Long times = System.currentTimeMillis() - startTime;

            log.setError(StringUtils.substring(e.toString(), 2000));//错误信息
            log.setStatus((byte)1);//失败
            log.setTimes(times);//耗时

            e.printStackTrace();
            logger.error("任务执行失败，任务ID：" + jobId);

        } finally {
            scheduleJobLogService.save(log);
        }
        //调用BackupDB.backup()
    }
}
