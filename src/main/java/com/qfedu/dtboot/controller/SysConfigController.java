package com.qfedu.dtboot.controller;

import com.qfedu.dtboot.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统配置信息
 *
 */
@RestController
@RequestMapping("/sys/config")
public class SysConfigController {

    @Autowired
    private SysConfigService sysConfigService;

    /**
     * 配置信息
     */
    /*@RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        SysConfig config = sysConfigService.queryObject(id);

        return R.ok().put("config", config);
    }*/

    /**
     * 保存配置
     */
    /*@RequestMapping("/save")
    public R save(@RequestBody SysConfig config){
        sysConfigService.save(config);

        return R.ok();
    }*/

    /**
     * 修改配置
     */
    /*@RequestMapping("/update")
    public R update(@RequestBody SysConfig config){
        sysConfigService.update(config);

        return R.ok();
    }*/

    /**
     * 删除配置
     */
    /*@RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        sysConfigService.deleteBatch(ids);
        return R.ok();
    }*/
}
