package com.lit.controller;

import com.lit.entity.Question;
import com.lit.entity.Survey;
import com.lit.entity.SurveyOptResult;
import com.lit.entity.SurveyResult;
import com.lit.service.questionService;
import com.lit.service.surveyService;
import com.lit.utils.MD5Utils;
import com.lit.utils.MapController;
import com.lit.utils.SystemInit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller

public class SurveyControl {
    @Autowired
    private surveyService surveyService;
    @Autowired
    private questionService questionService;
    @RequestMapping("/add")
    @ResponseBody
    public Map<String,Object> insert(Survey survey, HttpServletRequest request){

        survey.setStatement(Survey.state_create);//默认状态为创建
        survey.setCreater((Integer) request.getSession().getAttribute("adminID"));
        surveyService.insert(survey);
        return MapController.getInstance().success("添加成功").put("data",survey).getMap();
    }

    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> login(@RequestBody Survey survey){
        survey.setPassword(MD5Utils.getMD5(survey.getPassword()));
        Survey info = surveyService.detail(survey);
        if(info==null){
            return MapController.getInstance().error("用户名或密码错误").getMap();
        }
        return MapController.getInstance().success().getMap();
    }

    @RequestMapping("/pageList")
    @ResponseBody
    public Map<String,Object> list( Survey survey){
        //count：查询的总数量，
        Integer count = surveyService.count(survey);

        //设置分页条件，page为当前页，limit为每页数量
        survey.setPage((survey.getPage() - 1) * survey.getLimit());
        if (survey.getLimit()>count)
        survey.setLimit(count);
        List<Survey> surveys = surveyService.query(survey);
        for (Survey s : surveys) {
            s.setAdmin(SystemInit.map.get(s.getCreater()));
        }
        return MapController.getInstance().success().page(surveys, count).getMap();

    }

    @RequestMapping("/update")
    @ResponseBody
    public Map<String,Object> update(Survey survey){
        surveyService.update(survey);

        return MapController.getInstance().success("修改成功").getMap();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map<String,Object> delete(String id){
        surveyService.deleteBatch(id);
        return MapController.getInstance().success("删除成功").put("data",id).getMap();

    }
    @RequestMapping("/detail")
    public String detail(Survey survey, Model model){
        model.addAttribute("survey", surveyService.detail(survey));
        return "Survey/edit";
    }
    @RequestMapping("/question")//关于问题的请求，点击设计问卷发起
    public String question(Survey survey, Model model){
        //查询到该问卷的信息后，将该信息保存。
        model.addAttribute("survey", surveyService.detail(survey));
        return "Survey/question";
    }
    //问卷预览，
    @RequestMapping("/preview/{id}")
    public String preview(@PathVariable Integer id,Model model){
        Survey survey = new Survey();
        survey.setId(id);
        surveyService.detail(survey);
        Question question = new Question();
        question.setSurveyId(survey.getId());
        //根据问卷id查询该问卷中的所有问题，并封装到集合当中。
        List<Question> questions = questionService.query(question);
        survey.setQuestions(questions);
        model.addAttribute("survey",survey);
        return "Survey/preview";
    }

    @RequestMapping("/upload")
    public String upload(Integer id, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request){
        //上传位置
        String path = request.getSession().getServletContext().getRealPath("/upload");
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        //上传文件项
        String filename = multipartFile.getOriginalFilename();//获得上传时的文件名
        String uuid= UUID.randomUUID().toString().replace("-", "");
        String saveName=uuid+"_"+filename.substring(filename.lastIndexOf(File.separator));
        try {
            multipartFile.transferTo(new File(path,saveName));
            Survey survey = new Survey();
            survey.setId(id);
            survey.setBgimg(saveName);
            surveyService.update(survey);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:Survey/preview"+id;
    }

   @RequestMapping("/publish")
   @ResponseBody
    public Map<String,Object> punish(Integer id,HttpServletRequest request,Model model){
       Survey survey = new Survey();
       survey.setId(id);
       if(!surveyService.detail(survey).getStatement().equals("执行中")){
           return MapController.getInstance().error("该问卷已结束，不能发布！").getMap();
       }
       String uuid = "/dy/"+UUID.randomUUID().toString();
       String url="http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+uuid;
       survey.setUrl(url);
       surveyService.update(survey);
       model.addAttribute("survey", survey);
       return MapController.getInstance().success("操作成功").getMap();

   }

   //用户提交
    @RequestMapping("/submit")
    @ResponseBody
    public Map<String,Object> submit(@RequestBody List<Map<String,Object>> list){
        List<SurveyResult> surveyList=new ArrayList<>();
        List<SurveyOptResult> optList=new ArrayList<>();
        String uuid=UUID.randomUUID().toString();
        for (Map map : list) {
            if(map.get("type").equals("1")||map.get("type").equals("2")){
                //将集合里的选项存到数组。
                List<Object> options =(List<Object>) map.get("options");
                for (Object option : options) {
                    SurveyOptResult optResult = new SurveyOptResult();
                    optResult.setOptId(Integer.parseInt((String)option));//选项id
                    optResult.setQuestionId(Integer.parseInt((String) map.get("questionId")) );
                    optResult.setSurveyId(Integer.parseInt((String) map.get("surveyId")));
                    optResult.setCreatetime(new Date());
                    optResult.setVoter(uuid);
                    optList.add(optResult);
                }
            }
            if(map.get("type").equals("3")||map.get("type").equals("4")){
                    SurveyResult result = new SurveyResult();
                    result.setQuestionId((Integer.parseInt((String) map.get("questionId"))) );
                    result.setSurveyId((Integer.parseInt((String) map.get("surveyId"))));
                    result.setCreatetime(new Date());
                    result.setResult((String.valueOf(map.get("result"))));
                    result.setVoter(uuid);
                    surveyList.add(result);
            }

        }///
        surveyService.submit(optList,surveyList);
        return MapController.getInstance().success("提交成功").getMap();
    }
}
