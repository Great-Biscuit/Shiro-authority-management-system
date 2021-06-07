package com.qfedu.dtboot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan //配置druid必须加的注解。filter和servlet、listener需要单独进行注册才能使用，spring boot里面提供了该注解起到注册作用
//@EnableTransactionManagement //开启事务
@MapperScan("com.qfedu.dtboot.dao")//项目中对应的mapper类的路径
public class DtbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(DtbootApplication.class, args);
	}
}
