package com.lit.controller;

import com.lit.entity.Question;
import com.lit.entity.Survey;
import com.lit.service.questionService;
import com.lit.service.surveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class DynamicController {

    @Autowired
    private surveyService surveyService;
    @Autowired
    private questionService questionService;
    @RequestMapping("/dy/{uuid}")
    public String uuid(@PathVariable("uuid") String uuid, Model model){
        Survey survey = new Survey();
        survey.setStatement("执行中");
        //先查询所有的问卷
        List<Survey> surveys = surveyService.query(survey);
        Survey entity=null;

        //查找符合要求的问卷，即链接中包含请求参数的。
        for (Survey s : surveys) {

            if (s.getUrl().substring(s.getUrl().lastIndexOf("/")+1).equals(uuid)){
                entity=s;
            }
        }
        if (entity==null){
            return "Survey/404";
        }
        Question question = new Question();
        question.setSurveyId(entity.getId());
        List<Question> questions = questionService.query(question);
        entity.setQuestions(questions);
        model.addAttribute("survey", entity);
        return "Survey/exec";
    }

}
