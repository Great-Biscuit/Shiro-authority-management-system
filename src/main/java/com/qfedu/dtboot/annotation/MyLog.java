package com.qfedu.dtboot.annotation;

import java.lang.annotation.*;

/**
 * Created by helen on 2018/3/9
 */
@Target(ElementType.METHOD)//注解放置的目标位置
@Retention(RetentionPolicy.RUNTIME)//注解在哪个阶段执行
@Documented
//说明该注解将被包含在javadoc中
public @interface MyLog {
    String value() default "";
}
