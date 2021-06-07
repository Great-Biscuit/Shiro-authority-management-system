package com.qfedu.dtboot.service;

import com.qfedu.dtboot.entity.SysConfig;

import java.util.List;

/**
 * Created by helen on 2018/3/8
 */
public interface SysConfigService {

    /**
     * 根据主键前缀查询配置列表
     * @param keyPrefix
     * @return
     */
    List<SysConfig> queryByKeyPrefix(String keyPrefix);
}
