package com.common.utils;

/**
 * Created by LINxwFF on 2017/12/17.
 * 定义一个全局的变量类
 */
public class Const {

    public enum ExamModelEnum{
        MODEL_1(1,"随机组卷模式"),
        MODEL_2(2,"往年真题模式"),
        MODEL_3(3,"章节练习"),
        MODEL_4(4,"大题练习"),
        MODEL_5(5,"错题练习");

        private String value;
        private int code;

        ExamModelEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }

        public String getValue() {
            return value;
        }

        public static ExamModelEnum codeOf(int code){
            for(ExamModelEnum examModelEnum : values()){
                if(examModelEnum.getCode() == code){
                    return examModelEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }

    }
}
