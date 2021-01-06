<%--
  Created by IntelliJ IDEA.
  User: boom
  Date: 2020/12/6
  Time: 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">问卷标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="required" lay-reqtext="用户名不能为空" placeholder="问卷标题" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text" >
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="remark" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label ">限制</label>
        <div class="layui-input-inline">
            <select name="bounds" lay-filter="bounds" >
                <option value="0">限制</option>
                <option value="1">IP限制</option>
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
            <input type="text" id="password" name="password" placeholder="设置访问密码" autocomplete="off" style="display:none;" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline" style="margin-left:40px">
        <label class="layui-form-label ">开始时间</label>
        <div class="layui-input-inline">
            <input type="text" id="startTime" name="startTime" lay-verify="datetime" autocomplete="off" lay-reqtext="请选择时间" placeholder="yyyy-MM-dd"  class="layui-input">
        </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label ">结束时间</label>
        <div class="layui-input-inline">
            <input type="text" id="endTime" name="endTime" lay-verify="datetime" autocomplete="off" lay-reqtext="请选择时间" placeholder="yyyy-MM-dd"  class="layui-input">
        </div>
        </div>
    </div>

        <div class="layui-form-item">
            <label class="layui-form-label">匿名访问</label>
            <div class="layui-input-block">
                <input type="checkbox" name="anon" value="0"  checked lay-skin="switch" lay-verify="required" lay-filter="switchTest" class="layui-text" lay-text="ON|OFF">
            </div>
        </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            <button class="layui-btn layui-btn-normal"  lay-submit lay-filter="saveBtn">确认添加</button>
        </div>
    </div>
</div>
<script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
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
               url:"../add",
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