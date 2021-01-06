package com.lit.mapper;

import com.lit.entity.Admin;

import java.util.List;
import java.util.Map;

public interface adminMapper {

    int insert(Admin admin);

    int delete(Map<String,Object> paramMap);

    int update(Map<String,Object> paramMap);

    List<Admin> query(Map<String,Object> paramMap);

    List<Admin> initQuery(Map<String,Object> paramMap);

    Admin detail(Map<String,Object> paramMap);

    int count(Map<String,Object> paramMap);//用于分页
}
