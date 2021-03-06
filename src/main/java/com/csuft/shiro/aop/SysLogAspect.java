package com.csuft.shiro.aop;

import com.alibaba.fastjson.JSON;
import com.csuft.shiro.entity.SysLog;
import com.csuft.shiro.service.SysLogService;
import com.csuft.shiro.utils.HttpContextUtils;
import com.csuft.shiro.utils.IPUtils;
import com.csuft.shiro.utils.ShiroUtils;
import com.csuft.shiro.annotation.MyLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * 系统日志：切面处理类
 * 给自定义注解提供支持
 */
@Aspect
@Component
public class SysLogAspect {

    @Autowired
    private SysLogService sysLogService;

    //定义@Pointcut
    //@annotation：表示注解出现的位置切入代码
    @Pointcut("@annotation(com.csuft.shiro.annotation.MyLog)")
    public void logPointCut() {

    }

    @AfterReturning("logPointCut()")
    public void saveSysLog(JoinPoint joinPoint) {

        //保存日志
        SysLog sysLog = new SysLog();

        //从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();

        //操作
        MyLog mylog = method.getAnnotation(MyLog.class);
        if (mylog != null) {
            String value = mylog.value();
            sysLog.setOperation(value);
        }

        //请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = method.getName();
        sysLog.setMethod(className + "." + methodName);

        //请求参数
        Object[] args = joinPoint.getArgs();
        String params = JSON.toJSONString(args);
        sysLog.setParams(params);


        sysLog.setCreateDate(new Date());
        sysLog.setUsername(ShiroUtils.getUserEntity().getUsername());
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        sysLog.setIp(IPUtils.getIpAddr(request));

        sysLogService.save(sysLog);
    }
}
