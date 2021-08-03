package com.csuft.shiro.dao;

import com.csuft.shiro.entity.SysLog;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SysLogMapper {
    /**
     * 根据ID删除日志
     *
     * @param id 日志ID
     * @return 删除结果
     */
    int deleteByPrimaryKey(Long id);

    /**
     * 插入日志
     *
     * @param record 日志信息
     * @return 操作结果
     */
    int insert(SysLog record);

    /**
     * 插入日志（信息不全）
     *
     * @param record 日志信息
     * @return 操作结果
     */
    int insertSelective(SysLog record);

    /**
     * 根据主键查询日志
     *
     * @param id 主键
     * @return 日志
     */
    SysLog selectByPrimaryKey(Long id);

    /**
     * 根据主键更新日志（信息不全）
     *
     * @param record 日志信息
     * @return 操作结果
     */
    int updateByPrimaryKeySelective(SysLog record);

    /**
     * 根据主键更新日志
     *
     * @param record 日志信息
     * @return 操作结果
     */
    int updateByPrimaryKey(SysLog record);
}