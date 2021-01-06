package com.lit.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

@Controller
public class indexController {
    @Value("classpath:init.json")
    private Resource resource;

    @RequestMapping("/menu")
    @ResponseBody
    public String getData(){
        try {
            File file = resource.getFile();
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String info,data="";
            while ((info=reader.readLine())!=null){
                data+=info;
            }
            reader.close();
            System.out.println(data);
            return data;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
