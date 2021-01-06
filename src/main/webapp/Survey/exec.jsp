<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .preview{
            position: absolute;top: 0px;bottom: 10px;right: 0px;background-color: #ffffff;border: 1px solid #e0e0e0;
            width: 60%;
            margin: auto;
            left: 10px;
        }
        .preview ul{
            width: 100%;
            margin:0px;
            padding: 0px;

        }
        .preview ul li td{
            padding-left: 7px;

        }
        .preview ul li{
            margin-top: 10px;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #ffffff;
        }
        .preview ul li>div{
            padding-left: 50px;
        }
        .spliter{
            border-bottom: #0c0f13 1px solid;
            margin-bottom: 55px;
        }
        .preview label{
            font-size: 14px;
            padding: 10px 10px;
            color: #666666;
        }
        .preview div{
            font-size: 15px;
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
        .required select,input{
            border:1px solid #cccccc;
            height: 30px;
            border-radius: 2px;
            margin-left: 10px;
        }
        .options{
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
        .preview .inputp{
            width: 500px;
            margin-left: 65px;
        }
        .preview .text1{
            width: 500px;
            margin-left: 65px;
        }

    </style>
</head>
<body>

<div class="layuimini-container" style="position: absolute;bottom: 0px;top: 0px;background-color: #F2F2F2;left: 0px;right:0px;margin: 10px;">

    <div class="preview" id="preview" style="overflow: auto">
        <div style="text-align: center ;font-size: 21px;margin-top: 10px">
            ${survey.title}<br>
        </div>
        <h5 align="center" style="color: #999">${survey.remark}</h5>
        <ul class="content">

            <c:forEach items="${survey.questions}" var="question" varStatus="index">
                <c:if test="${question.type==1 or question.type==2}">
                    <div class="radioTemplate spliter" >
                        <li class="using radio">
                            <input type="text" value="${question.id}" xtype="${question.type}" hidden name="questionId">
                            <div class="title">
                                <div class="no_edit" > <b>${index.count}、${question.title}</b> </div>
<%--                                <c:if test="${question.remark!=null && question.remark!=''}">--%>
<%--                                    <div class="no_edit" >${question.remark}</div>--%>
<%--                                </c:if>--%>
                            </div>
                            <div class="options">
                                <ul>
                                    <c:forEach items="${question.options}" var="option">
                                        <li>
                                            <table>
                                                <tr>
                                                    <td><c:if test="${option.type==1}"><input name="r${question.id}" type="radio" class="mySelect" value="${option.id}"></c:if>
                                                        <c:if test="${option.type==2}"><input name="r${question.id}" type="checkbox" class="mySelect" value="${option.id}"></c:if></td>
                                                    <td>${option.option}</td>
                                                </tr>
                                            </table>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="que-btn">

                            </div>
                        </li>
                    </div>
                </c:if>
                <c:if test="${question.type==3 or question.type==4}">
                    <div class="inputTemplate spliter" >
                        <li class="using inputT">
                            <input type="text" value="${question.id}" xtype="${question.type}" hidden name="questionId">
                            <div class="title">
                                <div class="no_edit" ><b>${index.count}、${question.title}</b> </div>
                                <c:if test="${question.remark!=null && question.remark!=''}">
                                    <div class="no_edit" >${question.remark}</div>
                                </c:if>
                            </div>
                            <c:if test="${question.type==3}">
                                <input class="inputp"type="text" id="r${question.id}">
                            </c:if>
                            <c:if test="${question.type==4}">
                                <textarea class="text1" id="r${question.id}"></textarea>
                            </c:if>
                            <div class="que-btn">

                            </div>
                        </li>
                    </div>

                </c:if>
            </c:forEach>
            <li style="margin-bottom: 50px">
                <center><button class="layui-btn-lg save">确认提交</button></center>
            </li>
        </ul>
    </div>
</div>
<script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="../js/lay-config.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(["jquery","layer"],function () {
        let $=layui.jquery,layer=layui.layer;
        $('.save').click(function(){
            var optionArray = $('.mySelect');
            optionArray.each(function(index){
                //console.log($(this).prop("name"));
            })
            var list = [];//待提交的数组
            var questionArr = $('input[name="questionId"]');
            questionArr.each(function(index){
                var that = $(this);
                var obj = {};
                obj.questionId = $(this).val();
                obj.surveyId = "${survey.id}";
                obj.type = $(this).attr("xtype");
                //一个问题产生一个数组结果
                if(obj.type == 1 || obj.type == 2){
                    var tmp = [];//存放选项id的临时数。
                    optionArray.each(function(index){
                        if($(this).prop("name") == ("r"+that.val())){
                            if($(this).prop("checked")){
                                tmp.push($(this).val());
                            }
                        }
                    })
                    obj.options = tmp;
                }else {
                    obj.result = $("#r"+that.val()).val();
                }
                list.push(obj);
                //list结构：存放每一条问题对象。问题对象包括问卷id，问题id，问题类型，如果问题类型是选择类型
                //则将选项id存放到数组，如果是文本类型则存放内容。
            })
            console.log(list);

            $.ajax({
                url:"../submit",
                type:"POST",
                contentType:'application/json',
                dataType:'json',
                data:JSON.stringify(list),
                success:function(data){
                    layer.msg(data.msg,{time:1000},
                        function(){
                            // window.location.href="../Survey/success.jsp";
                        });
                }
            });
        })
    })


</script>
</body>
</html>