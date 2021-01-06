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
        /*.preview ul li:hover{*/
        /*    background-color: #FAFAFA;*/
        /*    border-top: 1px solid #e0e0e0;*/
        /*    border-bottom: 1px solid #e0e0e0;*/
        /*}*/
        .preview label{
            font-size: 14px;
            padding: 10px 10px;
            color: #666666;
        }
        .preview div{
            font-size: 15px;
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
        .preview .inputp{
            width: 500px;
            margin-left: 65px;
        }
        .preview .text1{
            width: 500px;
            margin-left: 65px;
        }
        .bg{
            background-image: url("upload/${survey.bgimg}");
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<div style="margin: 5px;float: right;margin-right: 300px; ">
    <form action="../upload" enctype="multipart/form-data" method="post">
        <input type="file" name="file">
        <input type="hidden" name="id" value="${survey.id}">
        <input type="submit" style="background-color: #009688;width: 100px;color: #ffffff ; border:1px solid #cccccc;" value="上传背景图">
    </form>
</div>

<div class="layuimini-container bg" style="position: absolute;bottom: 0px;top: 0px;background-color: #F2F2F2;left: 0px;right:0px;margin: 10px;">
    <div class="preview" id="preview" style="overflow: auto">
        <ul class="content">
            <c:forEach items="${survey.questions}" var="question" varStatus="index">
                <c:if test="${question.type==1 or question.type==2}">
                    <div class="radioTemplate spliter" >
                        <li class="using radio">
                            <input type="text" hidden >
                            <div class="title">
                                <div class="no_edit" > <b>${index.count}、${question.title}</b> </div>
                                <c:if test="${question.remark!=null && question.remark!=''}">
                                    <div class="no_edit" >${question.remark}</div>
                                </c:if>
                            </div>
                            <div class="options">
                                <ul>
                                    <c:forEach items="${question.options}" var="option">
                                            <li>
                                                <table>
                                                    <tr>
                                                        <td><c:if test="${option.type==1}"><input name="ques" type="radio"></c:if>
                                                            <c:if test="${option.type==2}"><input name="ques" type="checkbox"></c:if></td>
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
                            <input type="text" hidden>
                            <div class="title">
                                <div class="no_edit" ><b>${index.count}、${question.title}</b> </div>
                                <c:if test="${question.remark!=null && question.remark!=''}">
                                    <div class="no_edit" >${question.remark}</div>
                                </c:if>
                            </div>
                            <c:if test="${question.type==3}">
                                <input class="inputp">
                            </c:if>
                            <c:if test="${question.type==4}">
                                <textarea class="text1"></textarea>
                            </c:if>
                            <div class="que-btn">

                            </div>
                        </li>
                    </div>

                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
<script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="../js/lay-config.js" charset="utf-8"></script>

</body>
</html>