package com.lit.service;

import com.google.common.base.Splitter;
import com.google.common.collect.Maps;
import com.lit.entity.Question;
import com.lit.entity.QuestionOpt;
import com.lit.mapper.questionMapper;
import com.lit.mapper.questionOptMapper;
import com.lit.utils.BeanMapUtil;
import com.lit.utils.MapController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class questionService {
    @Autowired
    private questionMapper questionMapper;
    @Autowired
    private questionOptMapper questionOptMapper;
    //查询全部
    public List<Question> query(Question question){
        Map<String, Object> map =  BeanMapUtil.beanToMap(question);
        List<Question> questionList = questionMapper.query(map);
        List<QuestionOpt> questionOptList
                = questionOptMapper.query(MapController.getInstance().put("surveyId", question.getSurveyId()).getMap());
        //创建选项集合，一个集合相当于一个问题，将与该问题id相同的选项放在同一个集合中
        for (Question question1 : questionList) {
            ArrayList<QuestionOpt> opt = new ArrayList<>();
            for (QuestionOpt questionOpt : questionOptList) {
                if(question1.getId()==questionOpt.getQuestionId()){
                    opt.add(questionOpt);
                }
            }
            question1.setOptions(opt);
        }
        return questionList;
    }
    //插入
    public int insert(Question question){
        int flag=0;
        /**
        对问题选项进行管理，在进行第一次保存问题信息的时候，会获取问题id，
        然后有id是否存在进行判断，如果存在则说明该操作需要更新问题，同时删除上一次保存的选项信息。
         */
        if(question.getId()!=null){
            flag=update(question);
            questionOptMapper.delete(MapController.getInstance().put("questionId",question.getId()).getMap());
        }else {
            flag=questionMapper.insert(question);
        }
        if ((flag>0)){
            //获取遍历前端传来的选项集合，选项包括问题选项的内容，选项类型（单选、多选。。。），此项是否为选中答案
            List<QuestionOpt> opts=question.getOptions();
            System.out.println(opts);
            int i=0;
            for (QuestionOpt opt : opts) {
                //为问题选项
                opt.setQuestionId(question.getId());
                opt.setSurveyId(question.getSurveyId());
                opt.setOrderby(++i);
                //设计问卷信息的同时，为问题选项表添加相应的信息。
                questionOptMapper.insert(opt);
            }
        }
        return question.getId();
    }
    //更新
    public int update(Question question){
        Map<String, Object> map =  BeanMapUtil.beanToMap(question);
        return questionMapper.update(map);
    }
    //查询数量
    public int count(Question question){
        Map<String, Object> map =  BeanMapUtil.beanToMap(question);
        return questionMapper.count(map);
    }
    //删除
    public int delete(Integer id){
        Map<String, Object> map = Maps.newHashMap();
        map.put("id", id);
        Map<String, Object> map1 = Maps.newHashMap();
        map1.put("questionId", id);
        questionOptMapper.delete(map1);
        return questionMapper.delete(map);

    }
    //详细查询
    public Question detail(Question question){
        Map<String, Object> map =  BeanMapUtil.beanToMap(question);
        return questionMapper.detail(map);
    }

}
