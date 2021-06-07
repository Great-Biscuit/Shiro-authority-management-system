package com.qfedu.dtboot.quartz.task;

import org.springframework.stereotype.Component;

/**
 * Created by helen on 2018/3/12
 */
@Component("myTask2")
public class MyTask2 {

    public void fetch(){
        System.out.println("抓取新闻........");
    }
}
