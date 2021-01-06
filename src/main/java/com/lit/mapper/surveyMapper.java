package com.lit.mapper;


import com.lit.entity.Survey;

import java.util.List;
import java.util.Map;

public interface surveyMapper {
    int insert(Survey result);

    int delete(Map<String,Object> paramMap);

    int update(Map<String, Object> paramMap);

    List<Survey> query(Map<String,Object> paramMap);

    Survey detail(Map<String,Object> paramMap);

    int count(Map<String,Object> paramMap);//用于分页

    void updateState();//改变问卷状态

}