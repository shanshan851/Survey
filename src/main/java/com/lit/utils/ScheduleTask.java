package com.lit.utils;

import com.lit.mapper.surveyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@EnableScheduling//设置定时任务
public class ScheduleTask {

    @Autowired
    private surveyMapper surveyMapper;

    @Scheduled(fixedRate = 100000)//每100秒轮询一次
    public void state(){
        surveyMapper.updateState();
    }


}
