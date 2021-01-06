package com.lit.controller;

import com.lit.entity.Admin;
import com.lit.entity.Question;
import com.lit.service.adminService;
import com.lit.service.questionService;
import com.lit.utils.MapController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/question")
public class questionControl {
    @Autowired
    private questionService questionService;

    @RequestMapping("/add")
    @ResponseBody
    public Map<String,Object> insert(@RequestBody Question question){
        int res = questionService.insert(question);
        return MapController.getInstance().success("添加成功").put("data",question).getMap();
    }
    @RequestMapping("/query")
    @ResponseBody
    public Map<String,Object> query(@RequestBody Question question){
        return MapController.getInstance().success("添加成功").put("data",questionService.query(question)).getMap();
    }


    @RequestMapping("/pageList")
    @ResponseBody
    public Map<String,Object> list( Question question){

        //count：查询的总数量，
        Integer count = questionService.count(question);
        //设置分页条件，page为当前页，limit为每页数量
        question.setPage((question.getPage() - 1) * question.getLimit());
        if (question.getLimit()>count)
            question.setLimit(count);
        List<Question> questions = questionService.query(question);

        return MapController.getInstance().success().page(questions, count).getMap();

    }

    @RequestMapping("/update")
    @ResponseBody
    public Map<String,Object> update(Question question){
        questionService.update(question);
        return MapController.getInstance().success("修改成功").getMap();
    }

    @RequestMapping("/delete")
    public Map<String,Object> delete(Integer id){
        questionService.delete(id);
        return MapController.getInstance().success("删除成功").getMap();
    }

}
