package org.xinua.example.spring.mvc.util;

public class StringUtil {

    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    public static boolean notEmpty(String str) {
        return !StringUtil.isEmpty(str);
    }

}
