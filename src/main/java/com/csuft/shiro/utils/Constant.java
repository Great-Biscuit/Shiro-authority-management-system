package com.csuft.shiro.utils;

public class Constant {

    /** 超级管理员ID */
    public static final int SUPER_ADMIN = 1;

    /**
     * 定时任务状态
     *
     */
    public enum ScheduleStatus {
        /**
         * 正常
         */
        NORMAL((byte)0),
        /**
         * 暂停
         */
        PAUSE((byte)1);

        private byte value;

        private ScheduleStatus(byte value) {
            this.value = value;
        }

        public byte getValue() {
            return value;
        }
    }

    /**
     * 菜单类型
     */
    public enum MenuType {
        /**
         * 目录
         */
        CATALOG(0),
        /**
         * 菜单
         */
        MENU(1),
        /**
         * 按钮
         */
        BUTTON(2);

        private int value;

        MenuType(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }


}
