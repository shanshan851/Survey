package com.lit.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lit.utils.Page;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Question extends Page {
    private Integer id;

    private String title; //问题标题

    private String remark;

    private Integer type;

    private Integer required; //是否必填

    private String checkStyle; //验证方式

    private Integer orderStyle; //排列方式

    private Integer showStyle; //展示方式

    private Integer test;

    private Integer score;

    private Integer orderby;

    private Integer creater;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern ="yyyy-MM-dd",timezone = "GMT+8")
    private Date createtime;

    private Integer surveyId;

    private List<QuestionOpt> options;

    public List<QuestionOpt> getOptions() {
        return options;
    }

    public void setOptions(List<QuestionOpt> options) {
        this.options = options;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getRequired() {
        return required;
    }

    public void setRequired(Integer required) {
        this.required = required;
    }

    public String getCheckStyle() {
        return checkStyle;
    }

    public void setCheckStyle(String checkStyle) {
        this.checkStyle = checkStyle;
    }

    public Integer getOrderStyle() {
        return orderStyle;
    }

    public void setOrderStyle(Integer orderStyle) {
        this.orderStyle = orderStyle;
    }

    public Integer getShowStyle() {
        return showStyle;
    }

    public void setShowStyle(Integer showStyle) {
        this.showStyle = showStyle;
    }

    public Integer getTest() {
        return test;
    }

    public void setTest(Integer test) {
        this.test = test;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getOrderby() {
        return orderby;
    }

    public void setOrderby(Integer orderby) {
        this.orderby = orderby;
    }

    public Integer getCreater() {
        return creater;
    }

    public void setCreater(Integer creater) {
        this.creater = creater;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getSurveyId() {
        return surveyId;
    }

    public void setSurveyId(Integer surveyId) {
        this.surveyId = surveyId;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", remark='" + remark + '\'' +
                ", type=" + type +
                ", required=" + required +
                ", checkStyle='" + checkStyle + '\'' +
                ", orderStyle=" + orderStyle +
                ", showStyle=" + showStyle +
                ", test=" + test +
                ", score=" + score +
                ", orderby=" + orderby +
                ", creater=" + creater +
                ", createtime=" + createtime +
                ", surveyId=" + surveyId +
                '}';
    }
}