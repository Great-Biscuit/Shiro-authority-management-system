package com.qfedu.dtboot.quartz.task;

import org.springframework.stereotype.Component;

/**
 * Created by helen on 2018/3/12
 */
@Component("backupDB")
public class BackupDB {

    public void backup(String projectName){
        System.out.println("备份数据库........" + projectName);
    }
}
