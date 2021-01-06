<%--
  Created by IntelliJ IDEA.
  User: boom
  Date: 2020/12/6
  Time: 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/survey/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="/survey/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">

    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <input type="hidden" name="id"  value="${survey.id}" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">问卷标题</label>
        <div class="layui-input-block">
            <input type="text" name="title"  lay-reqtext="用户名不能为空" placeholder="问卷标题" value="${survey.title}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text" >
        <label class="layui-form-label">说明</label>
        <div class="layui-input-block">
            <textarea name="remark" class="layui-textarea" >${survey.remark}</textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label ">限制</label>
        <div class="layui-input-inline">
            <select name="bounds" lay-filter="bounds" >
                <option value="${survey.bounds}">限制</option>
                <option value="${survey.bounds}">IP限制</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label ">访问规则</label>
        <div class="layui-input-inline">
            <select name="rules" lay-filter="rules">
                <option value="0">公开访问</option>
                <option value="1">密码访问</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <input  type="text" id="password" value="${survey.password}" name="password" placeholder="设置访问密码" autocomplete="off" style="display:none;" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline" style="margin-left:40px">
            <label class="layui-form-label ">开始时间</label>
            <div class="layui-input-inline">
                <input   type='text' id="startTime" name="startTime" lay-verify="datetime" autocomplete="off" lay-reqtext="请选择时间" placeholder="yyyy-MM-dd"  class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label ">结束时间</label>
            <div class="layui-input-inline">
                <input  type="text" id="endTime" name="endTime" lay-verify="datetime" autocomplete="off" lay-reqtext="请选择时间" placeholder="yyyy-MM-dd"  class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">匿名访问</label>
        <div class="layui-input-block">
            <input type="checkbox"  name="aono" value="${survey.anon}"  checked lay-skin="switch"  lay-filter="switchTest" class="layui-text" lay-text="ON|OFF">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal"  lay-submit lay-filter="saveBtn">确认修改</button>
        </div>
    </div>
</div>
<script src="/survey/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form','jquery','laydate'], function () {
        var form = layui.form,
            laydate=layui.laydate,
            layer = layui.layer,
            index=parent.layer.getFrameIndex(window.name),
            $ = layui.$;
        laydate.render({
            elem:'#startTime',
            type:'datetime'
        })
        laydate.render({
            elem:'#endTime',
            type:'datetime'
        })
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            console.log(data.field)
            $.ajax({
                url:"update",
                data:data.field,
                dataType:"json",
                contentType:"application/json",
                success:function (result) {
                    layer.alert(result.msg,function () {
                        parent.layer.close(index)
                    });

                }
            })
            return false;
        });
        form.on('select(rules)',function (data) {
            if (data.value=="1"){
                $('#password').show()
            }else {
                $('#password').hide()
            }
            return false;
        })

    });

</script>
</body>
</html>