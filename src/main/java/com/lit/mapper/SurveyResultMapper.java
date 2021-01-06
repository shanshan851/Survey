package com.lit.mapper;

import com.lit.entity.SurveyResult;

import java.util.List;
import java.util.Map;

public interface SurveyResultMapper {
    int insert(SurveyResult result);

    int delete(Map<String,Object> paramMap);

    int update(Map<String,Object> paramMap);

    List<SurveyResult > query(Map<String,Object> paramMap);

    SurveyResult  detail(Map<String,Object> paramMap);

    int count(Map<String,Object> paramMap);//用于分页
}