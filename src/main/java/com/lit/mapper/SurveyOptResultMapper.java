package com.lit.mapper;
import com.lit.entity.SurveyOptResult;
import java.util.List;
import java.util.Map;

public interface SurveyOptResultMapper {
    int insert(SurveyOptResult optResult);

    int delete(Map<String,Object> paramMap);

    int update(Map<String,Object> paramMap);

    List<SurveyOptResult> query(Map<String,Object> paramMap);

    SurveyOptResult detail(Map<String,Object> paramMap);

    int count(Map<String,Object> paramMap);//用于分页
}