package com.lit.entity;

public class QuestionOpt { //问题选项

    private Integer id;

    private Integer surveyId; //问卷号

    private Integer type;  //问卷类型 如 单选、多选

    private Integer questionId; //问题id，如 (1)爱好 (2)年龄

    private String option; //问题的选项 如爱好有(游泳) (爬山)

    private Integer orderby; //问题选项的排序号

    private Integer answer;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSurveyId() {
        return surveyId;
    }

    public void setSurveyId(Integer surveyId) {
        this.surveyId = surveyId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option == null ? null : option.trim();
    }

    public Integer getOrderby() {
        return orderby;
    }

    public void setOrderby(Integer orderby) {
        this.orderby = orderby;
    }

    public Integer getAnswer() {
        return answer;
    }

    public void setAnswer(Integer answer) {
        this.answer = answer;
    }
}