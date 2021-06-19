package com.csuft.shiro.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * 配置Spring监控
 */
@Configuration
@ImportResource(locations = {"classpath:application-bean.xml"})
public class DruidStatInterceptor {
}
