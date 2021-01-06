
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="css/public.css" media="all">
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
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="account" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" autocomplete="off" class="layui-input">
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
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add" style="margin-left: 27px"> 添加 </button>
                <button class="layui-btn layui-btn-sm layui-btn-warm data-edit-btn" lay-event="edit"> 编辑 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>



    </div>
</div>
<script src="lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: 'admin/pageList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[
                {type: "checkbox", width: 100},
                {field: 'id', width: 150, title: 'ID', sort: true},
                {field: 'account', width: 150, title: '用户名'},
                {field: 'name', width: 150, title: '姓名'},
                {field: 'phone', width: 150, title: '电话'},

            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    "account":data.field.account,
                    "name":data.field.name
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
                    area: ['80%', '80%'],
                    content: 'adminAdd.jsp',
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
                $.ajax({
                    url:"admin/delete",
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
                    layer.msg("只能对一条数据修改")
                    return ;
                }
                const index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    data:data,
                    shade: 0.2,
                    shadeClose: true,
                    area: ['80%', '80%'],
                    content: "admin/detail?id="+arr[0],
                    end:function () {
                        table.reload("currentTableId")
                    }
                });
                $(window).on("resize", function () {

                    layer.full(index);
                });
                return false;
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });
        //
        // table.on('toolbar(currentTableFilter)', function (obj) {
        //     const data = obj.data;
        //     console.log(data)
        //     if (obj.event === 'edit') {
        //
        //         const index = layer.open({
        //             title: '编辑用户',
        //             type: 2,
        //             data:data,
        //             shade: 0.2,
        //             shadeClose: true,
        //             area: ['80%', '80%'],
        //             content: "adminEdit.jsp",
        //         });
        //         $(window).on("resize", function () {
        //
        //             layer.full(index);
        //         });
        //         return false;
        //     }
        // });

    });
</script>

</body>
</html>