package com.qfedu.dtboot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * Created by helen on 2018/3/5
 * 配置Spring监控
 */
@Configuration
@ImportResource(locations={"classpath:application-bean.xml"})
public class DruidStatInterceptor {
}
