<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/survey/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="/survey/css/public.css" media="all">
    <style>
        html,body{
            height: 100%;
            background-color: #F2F2F2;
        }
        .left{
            position: absolute;top: 0px;bottom: 10px;background-color: red;width: 300px;background-color: #FAFAFA;border: 1px solid #e0e0e0;
        }
        .left ul{
            margin: 0px;
            padding:0px;
            width: 250px;
            margin:auto;
            margin-top: 30px;
        }
        .left ul li{
           height: 35px;
           line-height: 35px;
           margin-top: 10px;
           background-color: #FFFFFF;
           border: 1px solid #e0e0e0;
           padding-left: 10px;
            box-sizing: border-box;
        }
        .left ul li a{
            display: block;
        }
        .main{
            position: absolute;top: 0px;bottom: 10px;right: 0px;left: 320px;background-color: #ffffff;border: 1px solid #e0e0e0;
        }
        .main ul{
            width: 100%;
            margin:0px;
            padding: 0px;

        }
        .main ul li{
            margin-top: 50px;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #ffffff;
        }
        .main ul li>div{
            padding-left: 50px;
        }
        .main ul li:hover{
           background-color: #FAFAFA;
           border-top: 1px solid #e0e0e0;
           border-bottom: 1px solid #e0e0e0;
        }
        .main label{
            font-size: 14px;
            padding: 10px 10px;
            color: #666666;
        }
        .edit{
            padding: 5px 5px;
            border: 1px solid #cccccc;
            min-height: 20px;
            width: 80%;
            margin-top: 10px;
            margin-left: 10px;
            border-radius:2px;
            color: #666666;
            background-color: #ffffff;
            cursor: default;
        }
        .no_edit{
            padding: 5px 5px;
            min-height: 20px;
            width: 80%;
            margin-top: 10px;
            margin-left: 10px;
            border-radius:2px;
            color: #666666;
        }
        .required{
            margin-left: 10px;
            margin-top: 10px;
            color: #666666;
        }
        .required select,input{
            border:1px solid #cccccc;
            height: 30px;
            border-radius: 2px;
            margin-left: 10px;
        }
        .options{
        }
        .options .edit{
            width: 75%;
            float: left;
        }
        .options div{
            margin-top:10px;
        }
        .que-btn{
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 60px !important;
            clear: both;
        }
        [contenteditable]:focus{outline: none;border: 1px solid #479de6;}
        .show{
            display: block;
        }
        .hide{
            display: none;
        }
    </style>
</head>
<body>
<div class="layuimini-container" style="position: absolute;bottom: 0px;top: 0px;background-color: #F2F2F2;left: 0px;right:0px;margin: 10px;">
    <div class="left">
       <ul>
           <li>
               <a href="javascript:void(0)" class="radio_type">
                   <i class="layui-icon layui-icon-about"></i>
                   单选题
               </a>
           </li>
           <li>
               <a href="javascript:void(0)" class="checkbox_type">
                   <i class="layui-icon layui-icon-about"></i>
                   多选题
               </a>
           </li>
           <li>
               <a href="javascript:void(0)" class="input_type">
                   <i class="layui-icon layui-icon-about"></i>
                   单行文本
               </a>
           </li>
           <li>
               <a href="javascript:void(0)" class="text_type">
                   <i class="layui-icon layui-icon-about"></i>
                   多行文本
               </a>
           </li>
       </ul>
    </div>
    <div class="main" id="main" style="overflow: auto">
        <ul class="content">
        </ul>
    </div>
</div>

<div class="radioTemplate" style="display: none">
    <li class="using radio">
        <input type="text" hidden >
        <div class="title">
            <div class="edit" contenteditable="true">标题</div>
            <div class="edit" contenteditable="true">描述</div>
        </div>
        <div class="required">
            <div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div>
            必填项
            <div class="layui-unselect layui-form-checkbox checkscore" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div>
            统计分值
            <span class="edit hide scorevalue" contenteditable="true" style="width: 60px;padding: 7px 20px;">5</span>
            <span class="edit hide answer" contenteditable="true" title="序号" style="width: 60px;padding: 7px 20px;"></span>

        </div>
        <div class="options">
            <div class="edit" contenteditable="true">选项</div>
            <div class="edit" contenteditable="true">选项</div>
            <div class="edit" contenteditable="true">选项</div>
            <div class="edit" contenteditable="true">选项</div>
        </div>
        <div class="que-btn">
            <button class="layui-btn layui-btn-primary layui-btn-sm data-add-btn mydel" lay-event="add"> 取消 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn myedit hide" lay-event="add"> 编辑 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn mysave" lay-event="add"> 保存 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn mysaveitem" lay-event="addItem"> 新增选项 </button>
            <span class="layui-text">编辑状态下，双击选项删除</span>
        </div>
    </li>
</div>

<div class="checkboxTemplate" style="display: none">
    <li class="using checkbox">
        <input type="text" hidden>
        <div class="title">
            <div class="edit" contenteditable="true">标题</div>
            <div class="edit" contenteditable="true">描述</div>
        </div>
        <div class="required">
            <div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div>
            必填项
            <div class="layui-unselect layui-form-checkbox checkscore" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div>
            统计分值
            <span class="edit hide scorevalue" contenteditable="true" style="width: 60px;padding: 7px 20px;">5</span>
            <span class="edit hide answer" contenteditable="true" title="序号" style="width: 60px;padding: 7px 20px;"></span>

        </div>
        <div class="options">
            <div class="edit" contenteditable="true">选项</div>
            <div class="edit" contenteditable="true">选项</div>
            <div class="edit" contenteditable="true">选项</div>
            <div class="edit" contenteditable="true">选项</div>
        </div>
        <div class="que-btn">
            <button class="layui-btn layui-btn-primary layui-btn-sm data-add-btn mydel" lay-event="add"> 取消 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn myedit hide" lay-event="add"> 编辑 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn mysave" lay-event="add"> 保存 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn mysaveitem" lay-event="addItem"> 新增选项 </button>
            <span class="layui-text">编辑状态下，双击选项删除</span>
        </div>
    </li>
</div>


<div class="inputTemplate" style="display: none">
    <li class="using inputT">
        <input type="text" hidden>
        <div class="title">
            <div class="edit" contenteditable="true">标题</div>
            <div class="edit" contenteditable="true">描述</div>
        </div>
        <div class="required">
            <div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div>
            必填项
        </div>
        <div class="que-btn">
            <button class="layui-btn layui-btn-primary layui-btn-sm data-add-btn mydel" lay-event="add"> 取消 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn myedit hide" lay-event="add"> 编辑 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn mysave" lay-event="add"> 保存 </button>
        </div>
    </li>
</div>


<div class="textTemplate" style="display: none">
    <li class="using text">
        <input type="text" hidden >
        <div class="title">
            <div class="edit" contenteditable="true">标题</div>
            <div class="edit" contenteditable="true">描述</div>
        </div>
        <div class="required">
            <div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div>
            必填项
        </div>
        <div class="que-btn">
            <button class="layui-btn layui-btn-primary layui-btn-sm data-add-btn mydel" lay-event="add"> 取消 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn myedit hide" lay-event="add"> 编辑 </button>
            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn mysave" lay-event="add"> 保存 </button>
        </div>
    </li>
</div>

<script src="lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="js/lay-config.js" charset="utf-8"></script>
<script>
    layui.use(['jquery','layer'],function () {
            let $ = layui.jquery, layer = layui.layer;
        $('.radio_type,.checkbox_type,.input_type,.text_type').on('click',function(){
            if(isEditing()){
                layer.msg("正在编辑，请先保存");
                return;
            }
            $('.content').find(".using").removeClass("using");
            let template = loadTemplation($(this).prop("className"));
            $('.content').append($(template));
            $('#main').animate({scrollTop:$(".content").height()}, 300);
        });

        //删除操作
        $(".content").on('click','.mydel',function(){
            //判断是否是当前编辑项
            var flag = $(this).parent().parent().hasClass("using");
            if(flag){
                $(this).parent().parent().remove();
            }else{
                if(isEditing()){
                    layer.msg("正在编辑，请先保存");
                    return;
                }else{
                    $(this).parent().parent().remove();
                }
            }
            //清除using状态
            clearUsing();

            let id=$(this).parent().parent().find('input').val();
            $.ajax({
                url:"question/delete",
                type:"post",
                data:"id="+id,
                success:function (result) {
                    console.log(result)
                }
            })
        });


        //判断是否有正在编辑的项目
        function isEditing(){
            var length = $('.content').find(".using").length;
            if(length == 0){
                return false;
            }else{
                return true;
            }
        }

        //保存之后，清除保存状态
        function clearUsing(){
            var obj = $('.content').find(".using");
            obj.removeClass("using");
        }

        //保存操作
        $(".content").on('click','.mysave',function(){
            var obj = $(this).parents(".using");
            obj.find(".edit").prop("contenteditable",false);
            obj.find(".edit").removeClass("edit").addClass("no_edit");
            //隐藏
            obj.find('.mysave').hide();
            obj.find('.mysaveitem').hide();
            obj.find('.myedit').show();
            clearUsing();

            //写入数据库
            save(obj)
        });

        function save(obj){
            const question={};
            if(obj.hasClass("radio")){
                question.type=1;
            }else if (obj.hasClass("checkbox")){
                question.type=2;
            }else if(obj.hasClass("inputT")){
                question.type=3;
            }else {
                question.type=4;
            }

            //标题与描述

            obj.find('.title').find('div').each(function (i) {
                if(i===0){
                    question.title=$(this).html();
                }
                if(i===1){
                    question.remark=$(this).html();
                }
            })
            //是否必填
            var _answer="";
            obj.find('.required').find('div').each(function (i) {
                //是否选中必填，选中则为 1，否则为0
                if(i===0){
                    if($(this).hasClass('layui-form-checked')){
                        question.required=1;
                    }else {
                        question.required=0;
                    }
                }
                //答案选项和分数填写，
                if (i === 1) {
                    if ($(this).hasClass('layui-form-checked')) {
                        question.test = 1;//选中为测试
                        question.score = obj.find('.required').find('.scorevalue').html();//绑定分值
                        _answer = obj.find('.required').find('.answer').html();//绑定答案选项

                    } else {
                        question.test = 0;
                        question.score = 0;
                        question.answer = 0;
                    }
                }
            })
            //选项管理，只有选择题类型才有选项
            if(question.type==1||question.type==2){//type为选项类型。1为单选，2为多选
                const arr=[];//存放选项信息的数组+
                let anArr=_answer.split(",");
                obj.find('.options').find('div').each(function (index) {
                    let options={};
                    options.option=$(this).html();
                    options.type=question.type;
                    //如果答案与选项匹配，则标记该选项为答案，，即标记为1
                    for (let i = 0; i <anArr.length; i++) {
                        if(anArr[i]==(index+1)){
                            options.answer=1;
                        }
                    }
                    arr.push(options)
                })
                //问题选项信息
                question.options=arr;
                question.id=obj.find('input').val();
            }
            question.surveyId=${survey.id}//问卷id是点击问卷信息后查询所获得的

                $.ajax({
                    url:"question/add",
                    type:"post",
                    contentType:"application/json",
                    data:JSON.stringify(question),
                    dataType:"json",
                    success:function (result) {
                        console.log(result);
                        obj.find('input').val(result.data.id);
                    },
                    error:function (err) {
                        console.log(err)
                    }
                })

            console.log(question)
        }

        init();
        function init(){
            let param={};
            param.surveyId=${survey.id};
            $.ajax({
                url:"question/query",
                type:"post",
                contentType:"application/json",
                data:JSON.stringify(param),
                dataType:"json",
                success:function (result) {
                    console.log(result);
                    let ques=result.data;
                    console.log(ques.length);
                    let index;
                    for (index=0;index<ques.length;index++){
                        //返回的结果为该问卷下的所有问题（ques）,类型是数组
                        switch (ques[index].type) {
                            //type为该问题的类型
                            case 1:
                                load(1,ques,index);
                                break;
                            case 2:
                                load(2,ques,index);
                                break;
                            case 3:
                                loadText(3,ques,index);
                                break;
                            case 4:
                                loadText(4,ques,index);
                                break;
                        }
                    }
                },
                error:function (err) {
                    console.log(err)
                }
            })
        }
        function load(type,ques,index){
            let template;
            if (type==1){
                template=$($('.radioTemplate').html());
            }
            if (type==2){
                template=$($('.checkboxTemplate').html());
            }

            template.find("div .edit").prop("contenteditable",false);
            template.find("div .edit").removeClass("edit").addClass("no_edit");
            //获取单选模块的内容
            //标题和问题描述在一个div选择器中，对这两个进行循环遍历
            template.find(".title").find("div").each(function (pos) {
                if(pos==0)//下标为0则说明在第一个位置，为其赋值问题标题
                    $(this).html(ques[index].title);
                else
                    $(this).html(ques[index].remark);
            })
            template.removeClass('using')
            template.find('.mysave').hide();
            template.find('.mysaveitem').hide();
            template.find('.myedit').show();
            template.find('input').val(ques[index].id);
            template.find(".required").find("div").each(function (pos) {
                if(pos==0)//下标为0则说明在第一个位置，为其赋值问题标题
                    if(ques[index].required==1){
                        $(this).addClass("layui-form-checked");
                    }else {
                        $(this).removeClass("layui-form-checked");
                    }
                else{
                    if(ques[index].test==1){
                        $(this).addClass("layui-form-checked");
                        template.find('.scorevalue').show();
                        template.find('.answer').show();
                        template.find('.scorevalue').html(ques[index].score);
                    }else {
                        $(this).removeClass("layui-form-checked");
                    }
                }

            })
            //清空原有选项
            template.find('.options').empty();
            let options=ques[index].options;
            let answerArr=[];
            for (let i = 0; i <options.length; i++) {
                template.find('.options').append($('<div class="no_edit" contenteditable="false">'+options[i].option+'</div>'))
                if(options[i].answer==1){
                    answerArr.push(i+1);
                }
            }
            if (answerArr.length>0){
                template.find('.answer').html(answerArr.join(','))
            }
            //问卷回写，追加模板。
            $(".content").append(template);
        }

        function loadText(type,ques,index){
            let template;
            if (type==3){
                template=$($('.inputTemplate').html());
            }
            if (type==4){
                template=$($('.textTemplate').html());
            }
            template.find("div .edit").prop("contenteditable",false);
            template.find("div .edit").removeClass("edit").addClass("no_edit");
            //获取单选模块的内容
            //标题和问题描述在一个div选择器中，对这两个进行循环遍历
            template.find(".title").find("div").each(function (pos) {
                if(pos==0)//下标为0则说明在第一个位置，为其赋值问题标题
                    $(this).html(ques[index].title);
                else
                    $(this).html(ques[index].remark);
            })
            template.removeClass('using')
            template.find('.mysave').hide();
            template.find('.mysaveitem').hide();
            template.find('.myedit').show();
            template.find('input').val(ques[index].id);
            template.find(".required").find("div").each(function (pos) {
                if(pos==0)//下标为0则说明在第一个位置，为其赋值问题标题
                    if(ques[index].required==1){
                        $(this).addClass("layui-form-checked");
                    }else {
                        $(this).removeClass("layui-form-checked");
                    }
                else{
                    if(ques[index].test==1){
                        $(this).addClass("layui-form-checked");
                        template.find('.scorevalue').show();
                        template.find('.answer').show();
                        template.find('.scorevalue').html(ques[index].score);
                    }else {
                        $(this).removeClass("layui-form-checked");
                    }
                }

            })
            //清空原有选项
            template.find('.options').empty();
            let options=ques[index].options;
            let answerArr=[];
            for (let i = 0; i <options.length; i++) {
                template.find('.options').append($('<div class="no_edit" contenteditable="false">'+options[i].option+'</div>'))
                if(options[i].answer==1){
                    answerArr.push(i+1);
                }
            }
            if (answerArr.length>0){
                template.find('.answer').html(answerArr.join(','))
            }
            //问卷回写，追加模板。
            $(".content").append(template);
        }

        //新增选项操作
        $(".content").on('click','.mysaveitem',function(){
            var obj = $(this).parents(".using");
            obj.find(".options").append($('<div class="edit" contenteditable="true">选项</div>'));
        });

        //双击删除选项操作
        $(".content").on('dblclick','.edit',function(){
            $(this).remove();
        });


        //编辑操作
        $(".content").on('click','.myedit',function(){
            if(isEditing()){
                layer.msg("正在编辑，请先保存");
                return;
            }
            var obj = $(this).parent().parent().addClass('using');
            obj.find(".no_edit").prop("contenteditable",true);
            obj.find(".no_edit").removeClass("no_edit").addClass("edit");
            //隐藏
            obj.find('.mysave').show();
            obj.find('.mysaveitem').show();
            obj.find('.myedit').hide();
        });

        //是否必填项
        $(".content").on('click','.layui-form-checkbox',function(){
            //判断当前是否可编辑，如果不可编辑，则不可点击
            var flag = $(this).parent().parent().hasClass("using");
            if(flag){
                if($(this).hasClass("layui-form-checked")){
                    $(this).removeClass("layui-form-checked")
                }else{
                    $(this).addClass("layui-form-checked")
                }
            }else{
                layer.msg("请切换编辑状态");
            }
        });

        //统计分值
        $(".content").on('click','.checkscore',function(){
            var flag = $(this).parent().parent().hasClass("using");
            if(flag){
                if($(this).hasClass("layui-form-checked")){
                    $(this).addClass("layui-form-checked")
                    $(this).siblings('.scorevalue').show();
                    $(this).siblings('.answer').show();
                }else{
                    $(this).removeClass("layui-form-checked")
                    $(this).siblings('.scorevalue').hide();
                    $(this).siblings('.answer').hide();

                }
            }else{
                layer.msg("请切换编辑状态");
            }
        });

        function loadTemplation(type){
            switch (type) {
                case "radio_type":
                    return $('.radioTemplate').html();
                case "checkbox_type":
                    return $('.checkboxTemplate').html();
                case "input_type":
                    return $('.inputTemplate').html();
                case "text_type":
                    return $('.textTemplate').html();
            }
        }
    });
</script>
</body>
</html>