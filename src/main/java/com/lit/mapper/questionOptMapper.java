package com.lit.mapper;

import com.lit.entity.Admin;
import com.lit.entity.QuestionOpt;

import java.util.List;
import java.util.Map;

public interface questionOptMapper {

    int insert(QuestionOpt questionOpt);

    int delete(Map<String,Object> paramMap);

    int update(Map<String,Object> paramMap);

    List<QuestionOpt> query(Map<String,Object> paramMap);

    QuestionOpt detail(Map<String,Object> paramMap);

    int count(Map<String,Object> paramMap);//用于分页
}