-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: shiro
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET
character_set_client = utf8mb4 ;
CREATE TABLE `sys_log`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `username`    varchar(50)   DEFAULT NULL COMMENT '用户名',
    `operation`   varchar(50)   DEFAULT NULL COMMENT '用户操作',
    `method`      varchar(200)  DEFAULT NULL COMMENT '请求方法',
    `params`      varchar(5000) DEFAULT NULL COMMENT '请求参数',
    `ip`          varchar(64)   DEFAULT NULL COMMENT 'IP地址',
    `create_date` datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK
TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log`
VALUES (11, 'admin', '修改用户', 'name.yaohuan.dt.service.impl.SysUserServiceImpl.update()',
        '{\"createTime\":1508459924000,\"createUserId\":1,\"email\":\"2\",\"mobile\":\"2\",\"password\":\"\",\"roleIdList\":[5],\"status\":1,\"userId\":6,\"username\":\"2\"}',
        '0:0:0:0:0:0:0:1', '2017-10-21 05:54:57'),
       (12, 'admin', '修改用户', 'name.yaohuan.dt.service.impl.SysUserServiceImpl.update()',
        '{\"createTime\":1508459924000,\"createUserId\":1,\"email\":\"2\",\"mobile\":\"2\",\"password\":\"\",\"roleIdList\":[5],\"status\":1,\"userId\":6,\"username\":\"2\"}',
        '0:0:0:0:0:0:0:1', '2017-10-21 05:56:09'),
       (13, 'admin', '修改用户', 'name.yaohuan.dt.service.impl.SysUserServiceImpl.update()',
        '{\"createTime\":1508459924000,\"createUserId\":1,\"email\":\"2\",\"mobile\":\"2\",\"password\":\"\",\"roleIdList\":[5],\"status\":1,\"userId\":6,\"username\":\"2\"}',
        '0:0:0:0:0:0:0:1', '2017-10-21 10:30:56'),
       (14, 'admin', '删除菜单记录', '', '', '0:0:0:0:0:0:0:1', '2018-03-09 09:47:18'),
       (15, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[30]]', '0:0:0:0:0:0:0:1',
        '2018-03-09 09:55:35'),
       (16, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"test\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"\",\"type\":0,\"url\":\"url\"}]',
        '0:0:0:0:0:0:0:1', '2018-03-09 09:56:56'),
       (17, 'admin', '修改菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.update',
        '[{\"menuId\":49,\"name\":\"test11111\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"\",\"type\":0,\"url\":\"url\"}]',
        '0:0:0:0:0:0:0:1', '2018-03-09 09:58:50'),
       (18, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[49]]', '0:0:0:0:0:0:0:1',
        '2018-03-09 15:02:01'),
       (19, 'admin', '删除定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.resume', '[[9]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 14:34:26'),
       (20, 'admin', '删除定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.resume', '[[8]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 14:35:49'),
       (21, 'admin', '暂停定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.pause', '[[8,9]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 14:47:49'),
       (22, 'admin', '立即执行定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.run', '[[8]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 14:55:19'),
       (23, 'admin', '修改定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.update',
        '[{\"beanName\":\"2\",\"createTime\":1520835377000,\"cronExpression\":\"0/1 * * * * ?\",\"jobId\":9,\"methodName\":\"2\",\"params\":\"2\",\"remark\":\"2\",\"status\":1}]',
        '0:0:0:0:0:0:0:1', '2018-03-12 15:09:52'),
       (24, 'admin', '恢复定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.resume', '[[9]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 15:10:21'),
       (25, 'admin', '暂停定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.pause', '[[9]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 15:12:36'),
       (26, 'admin', '修改定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.update',
        '[{\"beanName\":\"21\",\"createTime\":1520835377000,\"cronExpression\":\"0/1 * * * * ?\",\"jobId\":9,\"methodName\":\"21\",\"params\":\"21\",\"remark\":\"21\",\"status\":1}]',
        '0:0:0:0:0:0:0:1', '2018-03-12 15:18:54'),
       (27, 'admin', '删除定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.delete', '[[9]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 15:23:48'),
       (28, 'admin', '保存定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.save',
        '[{\"beanName\":\"backupDB\",\"createTime\":1520840573449,\"cronExpression\":\"0/5 * * * * ?\",\"jobId\":10,\"methodName\":\"backup\",\"params\":\"rzxt\",\"remark\":\"bz\",\"status\":1}]',
        '0:0:0:0:0:0:0:1', '2018-03-12 15:42:55'),
       (29, 'admin', '删除定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.delete', '[[8]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 15:43:01'),
       (30, 'admin', '恢复定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.resume', '[[10]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 15:43:20'),
       (31, 'admin', '删除定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.delete', '[[10]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 15:47:52'),
       (32, 'admin', '保存定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.save',
        '[{\"beanName\":\"backupDB\",\"createTime\":1520840907596,\"cronExpression\":\"0/5 * * * * ?\",\"jobId\":11,\"methodName\":\"backup\",\"params\":\"test param\",\"remark\":\"commons\",\"status\":1}]',
        '0:0:0:0:0:0:0:1', '2018-03-12 15:48:27'),
       (33, 'admin', '恢复定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.resume', '[[11]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 15:48:32'),
       (34, 'admin', '保存定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.save',
        '[{\"beanName\":\"myTask2\",\"createTime\":1520843418905,\"cronExpression\":\"0/1 * * * * ?\",\"jobId\":12,\"methodName\":\"fetch\",\"remark\":\"抓取\",\"status\":1}]',
        '0:0:0:0:0:0:0:1', '2018-03-12 16:30:19'),
       (35, 'admin', '恢复定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.resume', '[[12]]', '0:0:0:0:0:0:0:1',
        '2018-03-12 16:30:24'),
       (36, 'admin', '暂停定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.pause', '[[11,12]]',
        '0:0:0:0:0:0:0:1', '2018-03-12 16:50:01'),
       (37, 'admin', '恢复定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.resume', '[[11,12]]',
        '0:0:0:0:0:0:0:1', '2018-03-12 16:50:11'),
       (38, 'admin', '暂停定时任务', 'com.qfedu.dtboot.controller.ScheduleJobController.pause', '[[11,12]]',
        '0:0:0:0:0:0:0:1', '2018-03-12 17:26:25'),
       (39, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[30]]', '0:0:0:0:0:0:0:1',
        '2021-06-07 15:37:18'),
       (40, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[27]]', '0:0:0:0:0:0:0:1',
        '2021-06-07 15:37:36'),
       (41, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[28]]', '0:0:0:0:0:0:0:1',
        '2021-06-07 15:37:44'),
       (42, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1}]', '0:0:0:0:0:0:0:1',
        '2021-06-07 19:54:52'),
       (43, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[32]]', '0:0:0:0:0:0:0:1',
        '2021-06-07 19:55:28'),
       (44, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1}]', '0:0:0:0:0:0:0:1',
        '2021-06-07 19:56:17'),
       (45, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[33]]', '0:0:0:0:0:0:0:1',
        '2021-06-08 18:49:57'),
       (46, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"哈哈\",\"orderNum\":66,\"parentId\":1,\"parentName\":\"系统管理\",\"perms\":\"fds\",\"type\":1,\"url\":\"asd\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-08 21:39:25'),
       (47, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[34]]', '0:0:0:0:0:0:0:1',
        '2021-06-08 21:39:56'),
       (48, 'admin', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623205293494,\"createUserId\":1,\"email\":\"32423\",\"mobile\":\"2131\",\"password\":\"7686ef78ca53bbc0de81fc72ccfbee66\",\"roleIdList\":[5],\"status\":1,\"username\":\"test200\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 10:21:34'),
       (49, 'admin', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623206544316,\"createUserId\":1,\"email\":\"123\",\"mobile\":\"123\",\"password\":\"2b26ca72f4a3599e43f63cf9cfd2f5d1\",\"roleIdList\":[5],\"status\":1,\"username\":\"zjl100\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 10:42:24'),
       (50, 'admin', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623224786288,\"createUserId\":1,\"email\":\"124\",\"mobile\":\"123\",\"password\":\"c6026f6507323cdad79e934fab8146bb\",\"roleIdList\":[6],\"status\":1,\"username\":\"test15\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 15:46:27'),
       (51, 'test15', '删除用户', 'com.qfedu.dtboot.controller.SysUserController.userSave', '[[108]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 15:49:01'),
       (52, 'test15', '删除用户', 'com.qfedu.dtboot.controller.SysUserController.userSave', '[[1]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 15:49:09'),
       (53, 'test15', '修改用户', 'com.qfedu.dtboot.controller.SysUserController.userUpdate',
        '[{\"createTime\":1623224786000,\"createUserId\":1,\"email\":\"124\",\"mobile\":\"123\",\"password\":\"060da7f4efc417990efbd7f9c38f54c4\",\"roleIdList\":[6],\"status\":0,\"userId\":108,\"username\":\"test15\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 15:49:28'),
       (54, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"asd\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"asd\",\"type\":1,\"url\":\"adas\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 16:34:18'),
       (55, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[35]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 16:34:53'),
       (56, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"sada\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"dsad\",\"type\":1,\"url\":\"sadasd\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 16:34:59'),
       (57, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[36]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 16:35:06'),
       (58, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"fs\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"fsd\",\"type\":1,\"url\":\"sdfd\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 16:38:05'),
       (59, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[37]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 16:38:14'),
       (60, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"ssdasd\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"da\",\"type\":1,\"url\":\"asdas\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 16:38:18'),
       (61, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[38]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 16:38:26'),
       (62, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"aasad\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"asd\",\"type\":1,\"url\":\"dsad\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 16:40:53'),
       (63, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"gggg\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"ggg\",\"type\":1,\"url\":\"ggg\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 16:47:15'),
       (64, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"dddd\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"dddd\",\"type\":1,\"url\":\"dddd\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 16:51:03'),
       (65, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"hah\",\"orderNum\":0,\"parentId\":2,\"parentName\":\"用户管理\",\"perms\":\"user\",\"type\":2}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 17:16:40'),
       (66, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[42]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 17:16:56'),
       (67, 'admin', '修改密码', 'com.qfedu.dtboot.controller.SysUserController.updatePassword', '[\"123456\",\"123\"]',
        '0:0:0:0:0:0:0:1', '2021-06-09 17:17:43'),
       (68, 'admin', '修改密码', 'com.qfedu.dtboot.controller.SysUserController.updatePassword', '[\"123456\",\"123\"]',
        '0:0:0:0:0:0:0:1', '2021-06-09 17:18:32'),
       (69, 'admin', '修改密码', 'com.qfedu.dtboot.controller.SysUserController.updatePassword', '[\"123456\",\"admin\"]',
        '0:0:0:0:0:0:0:1', '2021-06-09 17:21:50'),
       (70, 'admin', '修改密码', 'com.qfedu.dtboot.controller.SysUserController.updatePassword', '[\"sdfdsf\",\"as\"]',
        '0:0:0:0:0:0:0:1', '2021-06-09 17:22:27'),
       (71, 'admin', '删除用户', 'com.qfedu.dtboot.controller.SysUserController.userSave', '[[105,106,107,108]]',
        '0:0:0:0:0:0:0:1', '2021-06-09 20:55:14'),
       (72, 'admin', '删除角色', 'com.qfedu.dtboot.controller.SysRoleController.delete', '[[10]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 20:55:31'),
       (73, 'admin', '修改菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.update',
        '[{\"icon\":\"fa fa-bug\",\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":210,\"parentId\":31,\"parentName\":\"系统监控\",\"perms\":\"\",\"type\":1,\"url\":\"druid/index.html\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 20:56:14'),
       (74, 'admin', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623243427276,\"createUserId\":1,\"email\":\"test001@qq.com\",\"mobile\":\"12345678910\",\"password\":\"c54b7e69659e44549d4ab40811837da5\",\"roleIdList\":[5],\"status\":1,\"username\":\"test001\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 20:57:07'),
       (75, 'admin', '删除用户', 'com.qfedu.dtboot.controller.SysUserController.userSave', '[[109]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 20:57:31'),
       (76, 'admin', '删除角色', 'com.qfedu.dtboot.controller.SysRoleController.delete', '[[7]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 20:59:44'),
       (77, 'admin', '删除用户', 'com.qfedu.dtboot.controller.SysUserController.userSave', '[[5]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 20:59:50'),
       (78, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623243640140,\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18],\"remark\":\"测试角色001\",\"roleName\":\"TestRole001\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:00:40'),
       (79, 'admin', '修改角色', 'com.qfedu.dtboot.controller.SysRoleController.update',
        '[{\"createTime\":1508061957000,\"menuIdList\":[5,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26],\"remark\":\"\",\"roleId\":5,\"roleName\":\"系统管理员\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:00:50'),
       (80, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623243675661,\"createUserId\":1,\"menuIdList\":[1,3,19,20,21,22],\"remark\":\"测试角色002\",\"roleName\":\"TestRole002\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:01:16'),
       (81, 'admin', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623243724922,\"createUserId\":1,\"email\":\"ZhaoJianLing@qq.com\",\"mobile\":\"15886391013\",\"password\":\"1635ca84ea829f27b1217020403c3475\",\"roleIdList\":[5],\"status\":1,\"username\":\"ZhaoJianLing\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:02:05'),
       (82, 'admin', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623243821033,\"createUserId\":1,\"email\":\"TangCheng@qq.com\",\"mobile\":\"15866666666\",\"password\":\"60eb6c28a908a8d3d16ff5ba757dd282\",\"roleIdList\":[5],\"status\":1,\"username\":\"TangCheng\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:03:41'),
       (83, 'admin', '修改角色', 'com.qfedu.dtboot.controller.SysRoleController.update',
        '[{\"createTime\":1622541957000,\"menuIdList\":[31,5,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26],\"remark\":\"拥有所有权限\",\"roleId\":5,\"roleName\":\"系统管理员\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:06:32'),
       (84, 'ZhaoJianLing', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"监控\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"系统监控\",\"perms\":\"dsa\",\"type\":1,\"url\":\"das\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:36:48'),
       (85, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[43]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 21:37:36'),
       (86, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623245903185,\"createUserId\":1,\"menuIdList\":[1,3,19],\"remark\":\"只有角色查看权限\",\"roleName\":\"Test9\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:38:23'),
       (87, 'admin', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623245936164,\"createUserId\":1,\"email\":\"Test9@qq.com\",\"mobile\":\"12388888888\",\"password\":\"b162785d70043aedfaebe4bb30ad3824\",\"roleIdList\":[13],\"status\":1,\"username\":\"Test9\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:38:56'),
       (88, 'admin', '修改用户', 'com.qfedu.dtboot.controller.SysUserController.userUpdate',
        '[{\"createTime\":1623245936000,\"createUserId\":1,\"email\":\"Test9@qq.com\",\"mobile\":\"12388888888\",\"roleIdList\":[13],\"status\":0,\"userId\":112,\"username\":\"Test9\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:40:32'),
       (89, 'admin', '修改用户', 'com.qfedu.dtboot.controller.SysUserController.userUpdate',
        '[{\"createTime\":1623245936000,\"createUserId\":1,\"email\":\"Test9@qq.com\",\"mobile\":\"12388888888\",\"roleIdList\":[13,5],\"status\":1,\"userId\":112,\"username\":\"Test9\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:41:34'),
       (90, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"shang\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"da\",\"type\":1,\"url\":\"da\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:48:16'),
       (91, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[44]]', '0:0:0:0:0:0:0:1',
        '2021-06-09 21:48:47'),
       (92, 'admin', '修改用户', 'com.qfedu.dtboot.controller.SysUserController.userUpdate',
        '[{\"createTime\":1623245936000,\"createUserId\":1,\"email\":\"Test9@qq.com\",\"mobile\":\"12388888888\",\"roleIdList\":[13,5],\"status\":0,\"userId\":112,\"username\":\"Test9\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:51:27'),
       (93, 'admin', '修改角色', 'com.qfedu.dtboot.controller.SysRoleController.update',
        '[{\"createTime\":1623245903000,\"createUserId\":1,\"menuIdList\":[1,3,19],\"remark\":\"只有角色查看权限\",\"roleId\":13,\"roleName\":\"TestRole9\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:55:37'),
       (94, 'admin', '修改角色', 'com.qfedu.dtboot.controller.SysRoleController.update',
        '[{\"createTime\":1623245903000,\"createUserId\":1,\"menuIdList\":[1,3,19],\"remark\":\"只有角色查看权限\",\"roleId\":13,\"roleName\":\"TestRole003\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:55:54'),
       (95, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623246993689,\"createUserId\":1,\"menuIdList\":[1,4,23],\"remark\":\"查看菜单\",\"roleName\":\"TestRole004\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:56:34'),
       (96, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623247058520,\"createUserId\":1,\"menuIdList\":[1,2,15],\"remark\":\"查看用户\",\"roleName\":\"TestRole005\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:57:39'),
       (97, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623247077197,\"createUserId\":1,\"menuIdList\":[1,2,15,17],\"remark\":\"查看、修改用户\",\"roleName\":\"TestRole006\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:57:57'),
       (98, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623247093786,\"createUserId\":1,\"menuIdList\":[1,3,19,21],\"remark\":\"查看、修改角色\",\"roleName\":\"TestRole007\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:58:14'),
       (99, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623247109691,\"createUserId\":1,\"menuIdList\":[1,3,19,22],\"remark\":\"查看、删除角色\",\"roleName\":\"TestRole008\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:58:30'),
       (100, 'admin', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623247125861,\"createUserId\":1,\"menuIdList\":[1,2,15,18],\"remark\":\"查看、删除用户\",\"roleName\":\"TestRole009\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:58:46'),
       (101, 'admin', '修改角色', 'com.qfedu.dtboot.controller.SysRoleController.update',
        '[{\"createTime\":1622583130000,\"menuIdList\":[1,2,15,17,18],\"remark\":\"测试\",\"roleId\":6,\"roleName\":\"测试角色\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 21:59:05'),
       (102, 'ZhaoJianLing', '保存角色', 'com.qfedu.dtboot.controller.SysRoleController.save',
        '[{\"createTime\":1623247219793,\"createUserId\":9,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22],\"remark\":\"管理用户、角色\",\"roleName\":\"TestRole10\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:00:20'),
       (103, 'ZhaoJianLing', '修改角色', 'com.qfedu.dtboot.controller.SysRoleController.update',
        '[{\"createTime\":1623247220000,\"createUserId\":9,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22],\"remark\":\"管理用户、角色\",\"roleId\":20,\"roleName\":\"TestRole010\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:00:33'),
       (104, 'ZhaoJianLing', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623247282952,\"createUserId\":9,\"email\":\"XuWanLi@qq.com\",\"mobile\":\"12488888888\",\"password\":\"88c608aad3bea9c04bdc7bde68b6365b\",\"roleIdList\":[11,13],\"status\":1,\"username\":\"XuWanLi\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:01:23'),
       (105, 'ZhaoJianLing', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623247326210,\"createUserId\":9,\"email\":\"LiMengZhuo@qq.com\",\"mobile\":\"13299999999\",\"password\":\"39b1a450327b62ba73fc1428357b9c0c\",\"roleIdList\":[17],\"status\":1,\"username\":\"LiMengZhuo\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:02:06'),
       (106, 'ZhaoJianLing', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623247351388,\"createUserId\":9,\"email\":\"ZhengChao@qq.com\",\"mobile\":\"13488888888\",\"password\":\"db9f5d64b5422d40ef0be7a4723c3c16\",\"roleIdList\":[15],\"status\":1,\"username\":\"ZhengChao\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:02:31'),
       (107, 'ZhaoJianLing', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623247383683,\"createUserId\":9,\"email\":\"HeShuangXi@qq.com\",\"mobile\":\"15699999999\",\"password\":\"baa7ae97ea22890f2794da0d16f2e1dd\",\"roleIdList\":[15,17],\"status\":1,\"username\":\"HeShuangXi\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:03:04'),
       (108, 'TangCheng', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623247436500,\"createUserId\":111,\"email\":\"Test010@qq.com\",\"mobile\":\"13699999999\",\"password\":\"3d9ff7e101e53822729e2a0d529ada37\",\"roleIdList\":[15,14],\"status\":1,\"username\":\"Test010\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:03:57'),
       (109, 'TangCheng', '修改用户', 'com.qfedu.dtboot.controller.SysUserController.userUpdate',
        '[{\"createTime\":1623247437000,\"createUserId\":111,\"email\":\"Test010@qq.com\",\"mobile\":\"13699999999\",\"roleIdList\":[15,14],\"status\":0,\"userId\":117,\"username\":\"Test010\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:04:10'),
       (110, 'TangCheng', '保存用户', 'com.qfedu.dtboot.controller.SysUserController.userSave',
        '[{\"createTime\":1623247473680,\"createUserId\":111,\"email\":\"Test011@qq.com\",\"mobile\":\"18799999999\",\"password\":\"4d0e3d0972b8e08b8b9297c9f8d7be96\",\"roleIdList\":[18,16],\"status\":0,\"username\":\"Test011\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-09 22:04:34'),
       (111, 'admin', '修改密码', 'com.qfedu.dtboot.controller.SysUserController.updatePassword', '[\"admin\",\"admin\"]',
        '0:0:0:0:0:0:0:1', '2021-06-10 00:28:22'),
       (112, 'admin', '保存菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.save',
        '[{\"name\":\"ada\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"da\",\"type\":1,\"url\":\"dsaa\"}]',
        '0:0:0:0:0:0:0:1', '2021-06-10 15:50:28'),
       (113, 'admin', '删除菜单记录', 'com.qfedu.dtboot.controller.SysMenuController.deleteBatch', '[[45]]',
        '0:0:0:0:0:0:0:1', '2021-06-10 15:50:36');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET
character_set_client = utf8mb4 ;
CREATE TABLE `sys_menu`
(
    `menu_id`   bigint(20) NOT NULL AUTO_INCREMENT,
    `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
    `name`      varchar(50)  DEFAULT NULL COMMENT '菜单名称',
    `url`       varchar(200) DEFAULT NULL COMMENT '菜单URL',
    `perms`     varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
    `type`      int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
    `icon`      varchar(50)  DEFAULT NULL COMMENT '菜单图标',
    `order_num` int(11) DEFAULT NULL COMMENT '排序',
    PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK
TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu`
VALUES (1, 0, '系统管理', '', '', 0, 'fa fa-cog', 300),
       (2, 1, '用户管理', 'sys/user.html', '', 1, 'fa fa-user', 310),
       (3, 1, '角色管理', 'sys/role.html', '', 1, 'fa fa-user-secret', 320),
       (4, 1, '菜单管理', 'sys/menu.html', '', 1, 'fa fa-th-list', 330),
       (5, 31, 'SQL监控', 'druid/index.html', '', 1, 'fa fa-bug', 210),
       (15, 2, '查看', '', 'sys:user:list,sys:user:info,sys:role:select', 2, '', 311),
       (16, 2, '新增', '', 'sys:user:save,sys:role:select', 2, '', 312),
       (17, 2, '修改', '', 'sys:user:update,sys:role:select', 2, '', 313),
       (18, 2, '删除', '', 'sys:user:delete', 2, '', 314),
       (19, 3, '查看', '', 'sys:role:list,sys:role:info,sys:menu:perms', 2, '', 321),
       (20, 3, '新增', '', 'sys:role:save,sys:menu:perms', 2, '', 322),
       (21, 3, '修改', '', 'sys:role:update,sys:menu:perms', 2, '', 323),
       (22, 3, '删除', '', 'sys:role:delete', 2, '', 324),
       (23, 4, '查看', '', 'sys:menu:list,sys:menu:info', 2, '', 331),
       (24, 4, '新增', '', 'sys:menu:save,sys:menu:select', 2, '', 332),
       (25, 4, '修改', '', 'sys:menu:update,sys:menu:select', 2, '', 333),
       (26, 4, '删除', '', 'sys:menu:delete', 2, '', 334),
       (31, 0, '系统监控', '', '', 0, 'fa fa-binoculars', 200);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET
character_set_client = utf8mb4 ;
CREATE TABLE `sys_role`
(
    `role_id`        bigint(20) NOT NULL AUTO_INCREMENT,
    `role_name`      varchar(100) DEFAULT NULL COMMENT '角色名称',
    `remark`         varchar(100) DEFAULT NULL COMMENT '备注',
    `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
    `create_time`    datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK
TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role`
VALUES (5, '系统管理员', '拥有所有权限', NULL, '2021-06-01 18:05:57'),
       (6, '测试角色', '测试', NULL, '2021-06-02 05:32:10'),
       (11, 'TestRole001', '测试角色001', 1, '2021-06-09 21:00:40'),
       (12, 'TestRole002', '测试角色002', 1, '2021-06-09 21:01:16'),
       (13, 'TestRole003', '只有角色查看权限', 1, '2021-06-09 21:38:23'),
       (14, 'TestRole004', '查看菜单', 1, '2021-06-09 21:56:34'),
       (15, 'TestRole005', '查看用户', 1, '2021-06-09 21:57:39'),
       (16, 'TestRole006', '查看、修改用户', 1, '2021-06-09 21:57:57'),
       (17, 'TestRole007', '查看、修改角色', 1, '2021-06-09 21:58:14'),
       (18, 'TestRole008', '查看、删除角色', 1, '2021-06-09 21:58:30'),
       (19, 'TestRole009', '查看、删除用户', 1, '2021-06-09 21:58:46'),
       (20, 'TestRole010', '管理用户、角色', 9, '2021-06-09 22:00:20');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET
character_set_client = utf8mb4 ;
CREATE TABLE `sys_role_menu`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
    `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK
TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu`
VALUES (233, 11, 1),
       (234, 11, 2),
       (235, 11, 15),
       (236, 11, 16),
       (237, 11, 17),
       (238, 11, 18),
       (256, 12, 1),
       (257, 12, 3),
       (258, 12, 19),
       (259, 12, 20),
       (260, 12, 21),
       (261, 12, 22),
       (262, 5, 31),
       (263, 5, 5),
       (264, 5, 1),
       (265, 5, 2),
       (266, 5, 15),
       (267, 5, 16),
       (268, 5, 17),
       (269, 5, 18),
       (270, 5, 3),
       (271, 5, 19),
       (272, 5, 20),
       (273, 5, 21),
       (274, 5, 22),
       (275, 5, 4),
       (276, 5, 23),
       (277, 5, 24),
       (278, 5, 25),
       (279, 5, 26),
       (286, 13, 1),
       (287, 13, 3),
       (288, 13, 19),
       (289, 14, 1),
       (290, 14, 4),
       (291, 14, 23),
       (292, 15, 1),
       (293, 15, 2),
       (294, 15, 15),
       (295, 16, 1),
       (296, 16, 2),
       (297, 16, 15),
       (298, 16, 17),
       (299, 17, 1),
       (300, 17, 3),
       (301, 17, 19),
       (302, 17, 21),
       (303, 18, 1),
       (304, 18, 3),
       (305, 18, 19),
       (306, 18, 22),
       (307, 19, 1),
       (308, 19, 2),
       (309, 19, 15),
       (310, 19, 18),
       (311, 6, 1),
       (312, 6, 2),
       (313, 6, 15),
       (314, 6, 17),
       (315, 6, 18),
       (327, 20, 1),
       (328, 20, 2),
       (329, 20, 15),
       (330, 20, 16),
       (331, 20, 17),
       (332, 20, 18),
       (333, 20, 3),
       (334, 20, 19),
       (335, 20, 20),
       (336, 20, 21),
       (337, 20, 22);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET
character_set_client = utf8mb4 ;
CREATE TABLE `sys_user`
(
    `user_id`        bigint(20) NOT NULL AUTO_INCREMENT,
    `username`       varchar(50) NOT NULL COMMENT '用户名',
    `password`       varchar(100) DEFAULT NULL COMMENT '密码',
    `email`          varchar(100) DEFAULT NULL COMMENT '邮箱',
    `mobile`         varchar(100) DEFAULT NULL COMMENT '手机号',
    `status`         tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
    `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
    `create_time`    datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK
TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user`
VALUES (1, 'admin', 'df655ad8d3229f3269fad2a8bab59b6c', '100@qq.com', '13666666666', 1, NULL, '2021-06-01 15:33:20'),
       (4, 'helen', '250d6bc11dd9015cc6557a1e56741002', '55317332@qq.com', '13766816630', 1, NULL,
        '2021-06-05 14:54:49'),
       (9, 'ZhaoJianLing', '1635ca84ea829f27b1217020403c3475', 'ZhaoJianLing@qq.com', '15886391013', 1, 1,
        '2021-06-09 21:02:05'),
       (111, 'TangCheng', '60eb6c28a908a8d3d16ff5ba757dd282', 'TangCheng@qq.com', '15866666666', 1, 1,
        '2021-06-09 21:03:41'),
       (112, 'Test9', 'b162785d70043aedfaebe4bb30ad3824', 'Test9@qq.com', '12388888888', 0, 1, '2021-06-09 21:38:56'),
       (113, 'XuWanLi', '88c608aad3bea9c04bdc7bde68b6365b', 'XuWanLi@qq.com', '12488888888', 1, 9,
        '2021-06-09 22:01:23'),
       (114, 'LiMengZhuo', '39b1a450327b62ba73fc1428357b9c0c', 'LiMengZhuo@qq.com', '13299999999', 1, 9,
        '2021-06-09 22:02:06'),
       (115, 'ZhengChao', 'db9f5d64b5422d40ef0be7a4723c3c16', 'ZhengChao@qq.com', '13488888888', 1, 9,
        '2021-06-09 22:02:31'),
       (116, 'HeShuangXi', 'baa7ae97ea22890f2794da0d16f2e1dd', 'HeShuangXi@qq.com', '15699999999', 1, 9,
        '2021-06-09 22:03:04'),
       (117, 'Test010', '3d9ff7e101e53822729e2a0d529ada37', 'Test010@qq.com', '13699999999', 0, 111,
        '2021-06-09 22:03:57'),
       (118, 'Test011', '4d0e3d0972b8e08b8b9297c9f8d7be96', 'Test011@qq.com', '18799999999', 0, 111,
        '2021-06-09 22:04:34');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET
character_set_client = utf8mb4 ;
CREATE TABLE `sys_user_role`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
    `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK
TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role`
VALUES (38, 4, 6),
       (64, 6, 5),
       (75, 9, 5),
       (76, 111, 5),
       (81, 112, 13),
       (82, 112, 5),
       (83, 113, 11),
       (84, 113, 13),
       (85, 114, 17),
       (86, 115, 15),
       (87, 116, 15),
       (88, 116, 17),
       (91, 117, 15),
       (92, 117, 14),
       (93, 118, 18),
       (94, 118, 16);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-10 16:18:16
