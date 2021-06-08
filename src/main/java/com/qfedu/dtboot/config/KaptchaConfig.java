package com.qfedu.dtboot.config;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

/**
 * Created by helen on 2018/3/6
 * 生成验证码配置
 */
@Configuration
public class KaptchaConfig {

    @Bean
    public DefaultKaptcha producer() {
        Properties properties = new Properties();
        //去除验证码的边框(black)
        properties.put("kaptcha.border", "no");
        //验证码字体的颜色
        properties.put("kaptcha.textproducer.font.color", "black");
        //验证码生成的字母数量
        properties.put("kaptcha.textproducer.char.length", "1");
        Config config = new Config(properties);
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}