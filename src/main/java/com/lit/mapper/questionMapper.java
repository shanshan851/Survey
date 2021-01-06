package com.lit.mapper;

import com.lit.entity.Admin;
import com.lit.entity.Question;

import java.util.List;
import java.util.Map;

public interface questionMapper {
    int insert(Question question);

    int delete(Map<String,Object> paramMap);

    int update(Map<String,Object> paramMap);

    List<Question> query(Map<String,Object> paramMap);

    Question detail(Map<String,Object> paramMap);

    int count(Map<String,Object> paramMap);//用于分页
}