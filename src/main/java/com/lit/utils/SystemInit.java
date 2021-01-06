package com.lit.utils;

import com.lit.entity.Admin;
import com.lit.mapper.adminMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;

public class SystemInit {

    @Autowired
    private adminMapper adminMapper;

    public static HashMap<Integer,Admin> map=new HashMap<>();

    public void init(){
        List<Admin> list = adminMapper.initQuery(null);
        for (Admin admin : list) {
            map.put(admin.getId(), admin);
        }
    }

}
