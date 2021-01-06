package com.lit.service;

import com.google.common.base.Splitter;
import com.google.common.collect.Maps;
import com.lit.entity.Admin;
import com.lit.entity.Survey;
import com.lit.entity.SurveyOptResult;
import com.lit.entity.SurveyResult;
import com.lit.mapper.SurveyOptResultMapper;
import com.lit.mapper.SurveyResultMapper;
import com.lit.mapper.adminMapper;
import com.lit.mapper.surveyMapper;
import com.lit.utils.BeanMapUtil;
import com.lit.utils.MapController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class surveyService {

    @Autowired
    private surveyMapper surveyMapper;
    @Autowired
    private SurveyResultMapper surveyResultMapper;
    @Autowired
    private SurveyOptResultMapper surveyOptResultMapper;

    //查询全部
    public List<Survey> query(Survey survey){
        Map<String, Object> map =  BeanMapUtil.beanToMap(survey);
        List<Survey> questionList = surveyMapper.query(map);
        return questionList;
    }
    //插入
    public int insert(Survey survey){
        return surveyMapper.insert(survey);
    }
    //更新
    public int update(Survey survey){
        Map<String, Object> map =  BeanMapUtil.beanToMap(survey);
        return surveyMapper.update(map);
    }
    //查询数量
    public int count(Survey survey){
        Map<String, Object> map =  BeanMapUtil.beanToMap(survey);
        return surveyMapper.count(map);
    }
    //删除
    public int delete(Integer id){
        Map<String, Object> map = Maps.newHashMap();
        map.put("id", id);
        return surveyMapper.delete(map);

    }
    //批量删除
    public int deleteBatch(String id){
        int flag=0;
        List<String> list = Splitter.on(",").splitToList(id);
        for (String s:list){
            surveyMapper.delete(MapController.getInstance().put("id", Integer.parseInt(s)).getMap());
            flag++;
        }
        return flag;
    }

    //详细查询
    public Survey detail(Survey survey){
        Map<String, Object> map =  BeanMapUtil.beanToMap(survey);
        return surveyMapper.detail(map);
    }


    public void submit(List<SurveyOptResult> optList, List<SurveyResult> surveyList) {
        for (SurveyOptResult optResult : optList) {
            surveyOptResultMapper.insert(optResult);
        }
        for (SurveyResult result : surveyList) {
            surveyResultMapper.insert(result);
        }
    }
}
