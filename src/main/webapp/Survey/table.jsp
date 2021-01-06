
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
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

<fieldset class="table-search-fieldset">
    <legend>搜索信息</legend>
    <div style="margin: 10px 10px 10px 10px">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-inline">
                        <input type="text" name="title" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <select name="statement" lay-filter="">
                            <option value="" selected style="width: 50px">- - -请选择- - -</option>
                            <option value="创建">创建</option>
                            <option value="执行中">执行中</option>
                            <option value="结束">结束</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <button type="submit" class="layui-btn layui-btn-primary"
                            lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                </div>
            </div>
        </form>
    </div>
</fieldset>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm data-add-btn" lay-event="add" style="margin-left: 27px"><i class="layui-icon layui-icon-add-1" ></i>添加 </button>
        <button class="layui-btn layui-btn-sm  data-edit-btn" lay-event="edit"> <i class="layui-icon layui-icon-edit"></i>编辑 </button>
        <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"><i class="layui-icon layui-icon-delete"/>删除 </button>
        <button class="layui-btn layui-btn-sm  data-delete-btn" lay-event="questionDesign"><i class="layui-icon layui-icon-app"></i>设计问卷 </button>
        <button class="layui-btn layui-btn-sm  data-delete-btn" lay-event="preview"> <i class="layui-icon layui-icon-layer"></i>预览问卷 </button>
        <button class="layui-btn layui-btn-sm  data-delete-btn" lay-event="publish"> <i class="layui-icon layui-icon-layer"></i>发布问卷 </button>

    </div>
</script>

<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>



    </div>
</div>
<script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '../pageList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[
                {type: "checkbox", width: 80},
                {field: 'id', width: 80, title: 'ID', sort: true},
                {field: 'title', width: 100, title: '问卷标题'},
                {field: 'url', width: 500, title: '问卷url'},
                {field: 'startTime', width: 200, title: '开始时间'},
                {field: 'endTime', width: 200, title: '结束时间'},
                {field: 'statement', width: 100, title: '状态'},
                {field: 'admin.account', width: 100, title: '创建人',templet:'<div>{{d.admin.account}}</div>'},
                {field: 'createTime', width: 200, title: '创建时间'},

            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            console.log(result)
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    "title":data.field.title,
                    "statement":data.field.statement
                }
            }, 'data');

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加用户',
                    type: 2,
                    shade: 0.5,
                    maxmin:true,
                    shadeClose: true,
                    area: ['80%', '95%'],
                    content: 'add.jsp',
                    end:function () {
                        table.reload("currentTableId")
                    }
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                let arr=[];
                for (index in data){
                    arr.push(data[index].id)
                }
                if (arr.length<1){
                    layer.msg("至少选择一条数据")
                    return ;
                }
                $.ajax({
                    url:"../delete",
                    data:'id='+arr.join(","),
                    dataType:"json",
                    success:function (result) {
                        layer.msg(result.msg,{time:500},function () {
                            table.reload("currentTableId")
                        });
                    }
                })
            }else if (obj.event === 'edit') {
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                let arr=[];
                for (i in data){
                    arr.push(data[i].id)
                }
                if (arr.length!=1){
                    layer.msg("请选择一条数据")
                    return ;
                }
                const index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    data:data,
                    shade: 0.2,
                    shadeClose: true,
                    area: ['80%', '80%'],
                    content: "../detail?id="+arr[0],
                    end:function () {
                        table.reload("currentTableId")
                    }
                });
                $(window).on("resize", function () {

                    layer.full(index);
                });
                return false;
            }else if (obj.event === 'questionDesign') {
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                let arr=[],i;
                for (i in data){
                    arr.push(data[i].id)
                }
                if (arr.length!=1){
                    layer.msg("请选择一条数据")
                    return ;
                }
                const index = layer.open({
                    title: '设计',
                    type: 2,
                    data:data,
                    shade: 0.2,
                    shadeClose: true,
                    area: ['80%', '80%'],
                    content: "../question?id="+arr[0],
                    end:function () {
                        table.reload("currentTableId")
                    }
                });
                $(window).on("resize", function () {

                    layer.full(index);
                });
                return false;
            }else if(obj.event === 'preview'){//预览问卷
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                let arr=[],i;
                for (i in data){
                    arr.push(data[i].id)
                }
                if(arr.length!=1){
                    layer.msg("请选择一条数据",{time:1000})
                    return;
                }
                window.open("../preview/"+arr[0]);
                console.log(arr[0]);
            }else if(obj.event === 'publish'){//预览问卷
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                let arr=[],i;
                for (i in data){
                    arr.push(data[i].id)
                }
                console.log(arr[0]);
                if(arr.length!=1){
                    layer.msg("请选择一条数据",{time:1000})
                    return;
                }
               $.ajax({
                   url:"../publish",
                   data:"id="+arr[0],
                   dataType: "json",
                   success:function (result) {
                        layer.msg(result.msg,{time:1000},function () {
                            table.reload("currentTableId")
                        });

                   },

               })

            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });


    });
</script>

</body>
</html>