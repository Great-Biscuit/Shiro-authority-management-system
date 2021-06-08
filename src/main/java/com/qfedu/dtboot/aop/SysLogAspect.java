package com.qfedu.dtboot.aop;

import com.alibaba.fastjson.JSON;
import com.qfedu.dtboot.annotation.MyLog;
import com.qfedu.dtboot.entity.SysLog;
import com.qfedu.dtboot.service.SysLogService;
import com.qfedu.dtboot.utils.HttpContextUtils;
import com.qfedu.dtboot.utils.IPUtils;
import com.qfedu.dtboot.utils.ShiroUtils;
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
 * Created by helen on 2018/3/9
 * 系统日志：切面处理类
 * 备注：2021-06-08 增加了部分注释（lmz）
 */
@Aspect //定义切面类，把当前类标识为一个切面供容器读取
@Component  //声明组件
public class SysLogAspect {
    /*
    Component注解相当于配置了
    <bean class="com.qfedu.dtboot.aop.SysLogAspect“></bean>
    */
    @Autowired
    private SysLogService sysLogService;

    /*定义@Pointcut，指明切入点
     *@annotation：表示注解出现的位置切入代码
     *匹配com.qfedu.dtboot.annotation.MyLog包下所有类、方法的执行作为切入点
     */
    @Pointcut("@annotation(com.qfedu.dtboot.annotation.MyLog)")
    public void logPointCut(){

    }
    /*AfterReturning：后置增强
    相当于AfterReturningAdvice
    方法正常退出时执行
    */
    @AfterReturning("logPointCut()")
    public void saveSysLog(JoinPoint joinPoint){

        System.out.println("切面。");

        //保存日志
        SysLog sysLog = new SysLog();

        //从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature methodSignature = (MethodSignature)joinPoint.getSignature();
        Method method = methodSignature.getMethod();

        /*操作
         *返回该元素的指定类型的注释，如果是这样的注释，否则返回null。
         */
        MyLog mylog = method.getAnnotation(MyLog.class);
        if(mylog != null){
            String value = mylog.value();
            sysLog.setOperation(value);
        }

        //请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        System.out.println(className);
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
