# /*!40101 SET NAMES utf8 */;
#
# /*!40101 SET SQL_MODE=''*/;
#
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- CREATE DATABASE /*!32312 IF NOT EXISTS*/`dtboot1716` /*!40100 DEFAULT CHARACTER SET utf8 */;
--
-- USE `dtboot1716`;

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers`
(
    `SCHED_NAME`    varchar(120) NOT NULL,
    `TRIGGER_NAME`  varchar(200) NOT NULL,
    `TRIGGER_GROUP` varchar(200) NOT NULL,
    `BLOB_DATA`     blob,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    KEY             `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
    CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars`
(
    `SCHED_NAME`    varchar(120) NOT NULL,
    `CALENDAR_NAME` varchar(200) NOT NULL,
    `CALENDAR`      blob         NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers`
(
    `SCHED_NAME`      varchar(120) NOT NULL,
    `TRIGGER_NAME`    varchar(200) NOT NULL,
    `TRIGGER_GROUP`   varchar(200) NOT NULL,
    `CRON_EXPRESSION` varchar(120) NOT NULL,
    `TIME_ZONE_ID`    varchar(80) DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert into `qrtz_cron_triggers`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`)
values ('MyScheduler', 'TRIGGER_11', 'DEFAULT', '0/5 * * * * ?', 'Asia/Shanghai'),
       ('MyScheduler', 'TRIGGER_12', 'DEFAULT', '0/1 * * * * ?', 'Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers`
(
    `SCHED_NAME`        varchar(120) NOT NULL,
    `ENTRY_ID`          varchar(95)  NOT NULL,
    `TRIGGER_NAME`      varchar(200) NOT NULL,
    `TRIGGER_GROUP`     varchar(200) NOT NULL,
    `INSTANCE_NAME`     varchar(200) NOT NULL,
    `FIRED_TIME`        bigint(13) NOT NULL,
    `SCHED_TIME`        bigint(13) NOT NULL,
    `PRIORITY`          int(11) NOT NULL,
    `STATE`             varchar(16)  NOT NULL,
    `JOB_NAME`          varchar(200) DEFAULT NULL,
    `JOB_GROUP`         varchar(200) DEFAULT NULL,
    `IS_NONCONCURRENT`  varchar(1)   DEFAULT NULL,
    `REQUESTS_RECOVERY` varchar(1)   DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`),
    KEY                 `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
    KEY                 `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
    KEY                 `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
    KEY                 `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
    KEY                 `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
    KEY                 `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details`
(
    `SCHED_NAME`        varchar(120) NOT NULL,
    `JOB_NAME`          varchar(200) NOT NULL,
    `JOB_GROUP`         varchar(200) NOT NULL,
    `DESCRIPTION`       varchar(250) DEFAULT NULL,
    `JOB_CLASS_NAME`    varchar(250) NOT NULL,
    `IS_DURABLE`        varchar(1)   NOT NULL,
    `IS_NONCONCURRENT`  varchar(1)   NOT NULL,
    `IS_UPDATE_DATA`    varchar(1)   NOT NULL,
    `REQUESTS_RECOVERY` varchar(1)   NOT NULL,
    `JOB_DATA`          blob,
    PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`),
    KEY                 `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
    KEY                 `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert into `qrtz_job_details`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`,
                               `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`)
values ('MyScheduler', 'JOB_11', 'DEFAULT', NULL, 'com.qfedu.dtboot.quartz.QuartzJob', '0', '0', '0', '0',
        '��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYt\0�{\"beanName\":\"backupDB\",\"createTime\":1520840907596,\"cronExpression\":\"0/5 * * * * ?\",\"jobId\":11,\"methodName\":\"backup\",\"params\":\"test param\",\"remark\":\"commons\",\"status\":1}x\0'),
       ('MyScheduler', 'JOB_12', 'DEFAULT', NULL, 'com.qfedu.dtboot.quartz.QuartzJob', '0', '0', '0', '0',
        '��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYt\0�{\"beanName\":\"myTask2\",\"createTime\":1520843418905,\"cronExpression\":\"0/1 * * * * ?\",\"jobId\":12,\"methodName\":\"fetch\",\"remark\":\"抓取\",\"status\":1}x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks`
(
    `SCHED_NAME` varchar(120) NOT NULL,
    `LOCK_NAME`  varchar(40)  NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert into `qrtz_locks`(`SCHED_NAME`, `LOCK_NAME`)
values ('MyScheduler', 'TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps`
(
    `SCHED_NAME`    varchar(120) NOT NULL,
    `TRIGGER_GROUP` varchar(200) NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state`
(
    `SCHED_NAME`        varchar(120) NOT NULL,
    `INSTANCE_NAME`     varchar(200) NOT NULL,
    `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
    `CHECKIN_INTERVAL`  bigint(13) NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers`
(
    `SCHED_NAME`      varchar(120) NOT NULL,
    `TRIGGER_NAME`    varchar(200) NOT NULL,
    `TRIGGER_GROUP`   varchar(200) NOT NULL,
    `REPEAT_COUNT`    bigint(7) NOT NULL,
    `REPEAT_INTERVAL` bigint(12) NOT NULL,
    `TIMES_TRIGGERED` bigint(10) NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers`
(
    `SCHED_NAME`    varchar(120) NOT NULL,
    `TRIGGER_NAME`  varchar(200) NOT NULL,
    `TRIGGER_GROUP` varchar(200) NOT NULL,
    `STR_PROP_1`    varchar(512)   DEFAULT NULL,
    `STR_PROP_2`    varchar(512)   DEFAULT NULL,
    `STR_PROP_3`    varchar(512)   DEFAULT NULL,
    `INT_PROP_1`    int(11) DEFAULT NULL,
    `INT_PROP_2`    int(11) DEFAULT NULL,
    `LONG_PROP_1`   bigint(20) DEFAULT NULL,
    `LONG_PROP_2`   bigint(20) DEFAULT NULL,
    `DEC_PROP_1`    decimal(13, 4) DEFAULT NULL,
    `DEC_PROP_2`    decimal(13, 4) DEFAULT NULL,
    `BOOL_PROP_1`   varchar(1)     DEFAULT NULL,
    `BOOL_PROP_2`   varchar(1)     DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers`
(
    `SCHED_NAME`     varchar(120) NOT NULL,
    `TRIGGER_NAME`   varchar(200) NOT NULL,
    `TRIGGER_GROUP`  varchar(200) NOT NULL,
    `JOB_NAME`       varchar(200) NOT NULL,
    `JOB_GROUP`      varchar(200) NOT NULL,
    `DESCRIPTION`    varchar(250) DEFAULT NULL,
    `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
    `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
    `PRIORITY`       int(11) DEFAULT NULL,
    `TRIGGER_STATE`  varchar(16)  NOT NULL,
    `TRIGGER_TYPE`   varchar(8)   NOT NULL,
    `START_TIME`     bigint(13) NOT NULL,
    `END_TIME`       bigint(13) DEFAULT NULL,
    `CALENDAR_NAME`  varchar(200) DEFAULT NULL,
    `MISFIRE_INSTR`  smallint(2) DEFAULT NULL,
    `JOB_DATA`       blob,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    KEY              `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
    KEY              `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
    KEY              `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
    KEY              `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
    KEY              `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
    KEY              `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
    KEY              `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
    KEY              `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
    KEY              `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
    KEY              `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
    KEY              `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
    KEY              `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert into `qrtz_triggers`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`,
                            `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`,
                            `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`)
values ('MyScheduler', 'TRIGGER_11', 'DEFAULT', 'JOB_11', 'DEFAULT', NULL, 1520846790000, 1520846785000, 5, 'PAUSED',
        'CRON', 1520840907000, 0, NULL, 2, ''),
       ('MyScheduler', 'TRIGGER_12', 'DEFAULT', 'JOB_12', 'DEFAULT', NULL, 1520846786000, 1520846785000, 5, 'PAUSED',
        'CRON', 1520843418000, 0, NULL, 2, '');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job`
(
    `job_id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
    `bean_name`       varchar(200)  DEFAULT NULL COMMENT 'spring bean名称',
    `method_name`     varchar(100)  DEFAULT NULL COMMENT '方法名',
    `params`          varchar(2000) DEFAULT NULL COMMENT '参数',
    `cron_expression` varchar(100)  DEFAULT NULL COMMENT 'cron表达式',
    `status`          tinyint(4) DEFAULT NULL COMMENT '任务状态',
    `remark`          varchar(255)  DEFAULT NULL COMMENT '备注',
    `create_time`     datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='定时任务';

/*Data for the table `schedule_job` */

insert into `schedule_job`(`job_id`, `bean_name`, `method_name`, `params`, `cron_expression`, `status`, `remark`,
                           `create_time`)
values (11, 'backupDB', 'backup', 'test param', '0/5 * * * * ?', 1, 'commons', '2018-03-12 15:48:27'),
       (12, 'myTask2', 'fetch', NULL, '0/1 * * * * ?', 1, '抓取', '2018-03-12 16:30:18');

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log`
(
    `log_id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
    `job_id`      bigint(20) NOT NULL COMMENT '任务id',
    `bean_name`   varchar(200)  DEFAULT NULL COMMENT 'spring bean名称',
    `method_name` varchar(100)  DEFAULT NULL COMMENT '方法名',
    `params`      varchar(2000) DEFAULT NULL COMMENT '参数',
    `status`      tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
    `error`       varchar(2000) DEFAULT NULL COMMENT '失败信息',
    `times`       bigint(20) NOT NULL COMMENT '耗时(单位：毫秒)',
    `create_time` datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`log_id`),
    KEY           `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

insert into `schedule_job_log`(`log_id`, `job_id`, `bean_name`, `method_name`, `params`, `status`, `error`, `times`,
                               `create_time`)
values (1, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:37'),
       (2, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:37'),
       (3, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:37'),
       (4, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:37'),
       (5, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:37'),
       (6, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:37'),
       (7, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:37'),
       (8, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:38'),
       (9, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:38'),
       (10, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:38'),
       (11, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:38'),
       (12, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:38'),
       (13, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:38'),
       (14, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:38'),
       (15, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:38'),
       (16, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:39'),
       (17, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:39'),
       (18, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:39'),
       (19, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:39'),
       (20, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:39'),
       (21, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:39'),
       (22, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:39'),
       (23, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:39'),
       (24, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:40'),
       (25, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:40'),
       (26, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:40'),
       (27, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:40'),
       (28, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:40'),
       (29, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:40'),
       (30, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:40'),
       (31, 12, 'myTask2', 'fetch', NULL, 0, NULL, 1, '2018-03-12 16:50:40'),
       (32, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:41'),
       (33, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:41'),
       (34, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:41'),
       (35, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:41'),
       (36, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:41'),
       (37, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:42'),
       (38, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:43'),
       (39, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:44'),
       (40, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:45'),
       (41, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:45'),
       (42, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:46'),
       (43, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:47'),
       (44, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:48'),
       (45, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:49'),
       (46, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:50'),
       (47, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:50'),
       (48, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:51'),
       (49, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:52'),
       (50, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:53'),
       (51, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:54'),
       (52, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:50:55'),
       (53, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:55'),
       (54, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:56'),
       (55, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:57'),
       (56, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:58'),
       (57, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:50:59'),
       (58, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:00'),
       (59, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:00'),
       (60, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:01'),
       (61, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:02'),
       (62, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:03'),
       (63, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:04'),
       (64, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:05'),
       (65, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:05'),
       (66, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:06'),
       (67, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:07'),
       (68, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:08'),
       (69, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:09'),
       (70, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:10'),
       (71, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:10'),
       (72, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:11'),
       (73, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:12'),
       (74, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:13'),
       (75, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:14'),
       (76, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:15'),
       (77, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:15'),
       (78, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:16'),
       (79, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:17'),
       (80, 12, 'myTask2', 'fetch', NULL, 0, NULL, 1, '2018-03-12 16:51:18'),
       (81, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:19'),
       (82, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:20'),
       (83, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:20'),
       (84, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:21'),
       (85, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:22'),
       (86, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:23'),
       (87, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:24'),
       (88, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:25'),
       (89, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:25'),
       (90, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:26'),
       (91, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:27'),
       (92, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:28'),
       (93, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:29'),
       (94, 11, 'backupDB', 'backup', 'test param', 0, NULL, 1, '2018-03-12 16:51:30'),
       (95, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:30'),
       (96, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:31'),
       (97, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:32'),
       (98, 12, 'myTask2', 'fetch', NULL, 0, NULL, 1, '2018-03-12 16:51:33'),
       (99, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:34'),
       (100, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:35'),
       (101, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:35'),
       (102, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:36'),
       (103, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:37'),
       (104, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:38'),
       (105, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:39'),
       (106, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:40'),
       (107, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:40'),
       (108, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:41'),
       (109, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:42'),
       (110, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:43'),
       (111, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:44'),
       (112, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:45'),
       (113, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:45'),
       (114, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:46'),
       (115, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:47'),
       (116, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:48'),
       (117, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:49'),
       (118, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:50'),
       (119, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:50'),
       (120, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:51'),
       (121, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:52'),
       (122, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:53'),
       (123, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:54'),
       (124, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:51:55'),
       (125, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:55'),
       (126, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:56'),
       (127, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:57'),
       (128, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:58'),
       (129, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:51:59'),
       (130, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:52:00'),
       (131, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:52:00'),
       (132, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:52:01'),
       (133, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:52:02'),
       (134, 12, 'myTask2', 'fetch', NULL, 0, NULL, 1, '2018-03-12 16:52:03'),
       (135, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:52:04'),
       (136, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 16:52:05'),
       (137, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:52:05'),
       (138, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:52:06'),
       (139, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 16:52:07'),
       (140, 12, 'myTask2', 'fetch', NULL, 0, NULL, 3, '2018-03-12 17:25:48'),
       (141, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:49'),
       (142, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 17:25:50'),
       (143, 12, 'myTask2', 'fetch', NULL, 0, NULL, 1, '2018-03-12 17:25:50'),
       (144, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:51'),
       (145, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:52'),
       (146, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:53'),
       (147, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:54'),
       (148, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 17:25:55'),
       (149, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:55'),
       (150, 12, 'myTask2', 'fetch', NULL, 0, NULL, 1, '2018-03-12 17:25:56'),
       (151, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:57'),
       (152, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:58'),
       (153, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:25:59'),
       (154, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 17:26:00'),
       (155, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:00'),
       (156, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:01'),
       (157, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:02'),
       (158, 12, 'myTask2', 'fetch', NULL, 0, NULL, 1, '2018-03-12 17:26:03'),
       (159, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:04'),
       (160, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 17:26:05'),
       (161, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:05'),
       (162, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:06'),
       (163, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:07'),
       (164, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:08'),
       (165, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:09'),
       (166, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 17:26:10'),
       (167, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:10'),
       (168, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:11'),
       (169, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:12'),
       (170, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:13'),
       (171, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:14'),
       (172, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 17:26:15'),
       (173, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:15'),
       (174, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:16'),
       (175, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:17'),
       (176, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:18'),
       (177, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:19'),
       (178, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 17:26:20'),
       (179, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:20'),
       (180, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:21'),
       (181, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:22'),
       (182, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:23'),
       (183, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:24'),
       (184, 11, 'backupDB', 'backup', 'test param', 0, NULL, 0, '2018-03-12 17:26:25'),
       (185, 12, 'myTask2', 'fetch', NULL, 0, NULL, 0, '2018-03-12 17:26:25');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config`
(
    `id`     bigint(20) NOT NULL AUTO_INCREMENT,
    `key`    varchar(50)   DEFAULT NULL COMMENT 'key',
    `value`  varchar(2000) DEFAULT NULL COMMENT 'value',
    `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
    `remark` varchar(500)  DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`),
    UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

/*Data for the table `sys_config` */

insert into `sys_config`(`id`, `key`, `value`, `status`, `remark`)
values (1, 'CLOUD_STORAGE_CONFIG_KEY',
        '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',
        0, '云存储配置信息'),
       (2, 'SHIRO_FILTER_CONFIG_01', '/images/**=anon', 1, 'shiro过滤器'),
       (5, 'SHIRO_FILTER_CONFIG_02', '/css/**=anon', 1, 'shiro过滤器'),
       (6, 'SHIRO_FILTER_CONFIG_03', '/libs/**=anon', 1, 'shiro过滤器'),
       (7, 'SHIRO_FILTER_CONFIG_04', '/login.html=anon', 1, 'shiro过滤器'),
       (8, 'SHIRO_FILTER_CONFIG_05', '/sys/login=anon', 1, 'shiro过滤器'),
       (9, 'SHIRO_FILTER_CONFIG_06', '/captcha.jpg=anon', 1, 'shiro过滤器'),
       (10, 'SHIRO_FILTER_CONFIG_99', '/**=user', 1, 'shiro过滤器');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

insert into `sys_log`(`id`, `username`, `operation`, `method`, `params`, `ip`, `create_date`)
values (11, 'admin', '修改用户', 'name.yaohuan.dt.service.impl.SysUserServiceImpl.update()',
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
        '0:0:0:0:0:0:0:1', '2018-03-12 17:26:25');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert into `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
values (1, 0, '系统管理', '', '', 0, 'fa fa-cog', 300),
       (2, 1, '用户管理', 'sys/user.html', '', 1, 'fa fa-user', 310),
       (3, 1, '角色管理', 'sys/role.html', '', 1, 'fa fa-user-secret', 320),
       (4, 1, '菜单管理', 'sys/menu.html', '', 1, 'fa fa-th-list', 330),
       (5, 31, 'SQL监控', 'druid/index.html', '', 1, 'fa fa-bug', 210),
       (6, 30, '任务管理', 'schedule/job.html', '', 1, '', 110),
       (7, 6, '查看', '', 'schedule:job:list,schedule:job:info', 2, '', 111),
       (8, 6, '新增', '', 'schedule:job:save', 2, '', 112),
       (9, 6, '修改', '', 'schedule:job:update', 2, '', 113),
       (10, 6, '删除', '', 'schedule:job:delete', 2, '', 114),
       (11, 6, '暂停', '', 'schedule:job:pause', 2, '', 115),
       (12, 6, '恢复', '', 'schedule:job:resume', 2, '', 116),
       (13, 6, '立即执行', '', 'schedule:job:run', 2, '', 117),
       (14, 30, '任务日志', 'schedule/joblog.html', 'schedule:joblog:list', 1, '', 120),
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
       (27, 1, '参数管理', 'sys/config.html',
        'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 340),
       (28, 1, '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', 1, 'fa fa-rocket', 349),
       (29, 31, '系统日志', 'sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 220),
       (30, 0, '定时任务', '', '', 0, 'fa fa-clock-o', 100),
       (31, 0, '系统监控', '', '', 0, 'fa fa-binoculars', 200);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role`
(
    `role_id`        bigint(20) NOT NULL AUTO_INCREMENT,
    `role_name`      varchar(100) DEFAULT NULL COMMENT '角色名称',
    `remark`         varchar(100) DEFAULT NULL COMMENT '备注',
    `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
    `create_time`    datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

insert into `sys_role`(`role_id`, `role_name`, `remark`, `create_user_id`, `create_time`)
values (5, '系统管理员', '', NULL, '2017-10-15 18:05:57'),
       (6, '测试角色', '', NULL, '2017-10-17 05:32:10');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
    `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert into `sys_role_menu`(`id`, `role_id`, `menu_id`)
values (190, 5, 1),
       (191, 5, 2),
       (192, 5, 15),
       (193, 5, 16),
       (194, 5, 17),
       (195, 5, 18),
       (196, 5, 3),
       (197, 5, 19),
       (198, 5, 20),
       (199, 5, 21),
       (200, 5, 22),
       (201, 5, 4),
       (202, 5, 23),
       (203, 5, 24),
       (205, 5, 26),
       (206, 5, 5),
       (207, 5, 6),
       (208, 5, 7),
       (209, 5, 8),
       (210, 5, 9),
       (211, 5, 10),
       (212, 5, 11),
       (213, 5, 12),
       (214, 5, 13),
       (215, 5, 14),
       (216, 5, 27),
       (217, 5, 29),
       (218, 5, 28),
       (225, 6, 1),
       (226, 6, 2),
       (227, 6, 15),
       (228, 6, 17),
       (229, 6, 18);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统用户';

/*Data for the table `sys_user` */

insert into `sys_user`(`user_id`, `username`, `password`, `email`, `mobile`, `status`, `create_user_id`, `create_time`)
values (1, 'admin', '0d640a406596c708629a7824d34d0e39', '100@qq.com', '13666666666', 1, NULL, '2017-06-01 15:33:20'),
       (4, 'helen', '5aa0f441849a94bd1f18852df531919d0024f78affbf37c229d78820bbbae226', '55317332@qq.com',
        '13766816630', 1, NULL, '2017-10-15 14:54:49');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
    `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert into `sys_user_role`(`id`, `user_id`, `role_id`)
values (38, 4, 6),
       (39, 5, 5),
       (64, 6, 5),
       (65, 1, 5),
       (66, 1, 6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
