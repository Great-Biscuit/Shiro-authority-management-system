package com.csuft.shiro.annotation;

import java.lang.annotation.*;


/**
 * 自定义日志注解
 */
@Target(ElementType.METHOD)//注解放置的目标位置
@Retention(RetentionPolicy.RUNTIME)//注解在哪个阶段执行
@Documented
public @interface MyLog {
    String value() default "";
}
