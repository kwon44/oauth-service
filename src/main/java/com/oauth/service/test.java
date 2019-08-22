package com.oauth.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class test {
    public static void main(String[] args){
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        System.out.println(bCryptPasswordEncoder.encode("a123456"));
        System.out.println(bCryptPasswordEncoder.matches("123456","$2a$10$z5ZZ6tVJ1MxHNAaQ.JqELu4UNXG21B0y6BXkVQln.VS0EvmsO.wQu"));
    }
}
