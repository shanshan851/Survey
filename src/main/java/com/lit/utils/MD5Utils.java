package com.lit.utils;

import org.springframework.util.DigestUtils;

public class MD5Utils {

    //加盐
    private static final String salt="Survey&*%%&*";

    public static String getMD5(String s){
        String val=s+salt;
        return DigestUtils.md5DigestAsHex(val.getBytes());
    }

//    public static void main(String[] args) {
//        System.out.println(getMD5("1111"));
//    }

}
