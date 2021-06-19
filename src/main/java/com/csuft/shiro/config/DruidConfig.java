package com.csuft.shiro.config;

import com.alibaba.druid.filter.Filter;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.wall.WallConfig;
import com.alibaba.druid.wall.WallFilter;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;


/**
 * Druid连接池配置类
 * 自动读取 application.properties文件中以spring.datasource开头的信息
 * 将DataSource对象的实现类变为了DruidDataSource对象。
 */
@Configuration
public class DruidConfig {
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    @Qualifier("druidDataSource")
    public DataSource druidDataSource() {
        System.out.println("druid datasource");//重启查看数据源的加载
        DruidDataSource datasource = new DruidDataSource();

        List<Filter> filters = new ArrayList<Filter>();
        filters.add(wallFilter());
        datasource.setProxyFilters(filters);

        return datasource;
    }

    @Bean
    public WallFilter wallFilter() {
        WallFilter wallFilter = new WallFilter();

        //允许执行多条SQL
        WallConfig config = new WallConfig();
        config.setMultiStatementAllow(true);
        wallFilter.setConfig(config);

        return wallFilter;
    }
}