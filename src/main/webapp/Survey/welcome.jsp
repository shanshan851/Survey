<%--
  Created by IntelliJ IDEA.
  User: boom
  Date: 2020/12/7
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>主页一</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="../lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
</head>
<style>
    .layui-top-box {padding:40px 20px 20px 20px;color:#fff}
    .panel {margin-bottom:17px;background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
    .panel-body {padding:15px}
    .panel-title {margin-top:0;margin-bottom:0;font-size:14px;color:inherit}
    .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
    .layui-red {color:red}
    .main_btn > p {height:40px;}
</style>
<body>
<div class="layuimini-container">
    <div class="layuimini-main layui-top-box">
        <div class="layui-row layui-col-space10">

            <div class="layui-col-md3">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-cyan">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-blue">实时</span>
                                <h5>用户统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">1234</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1234</div>
                                <small>当前分类总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="layui-col-md3">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-green">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-orange">实时</span>
                                <h5>浏览统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">1234</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1234</div>
                                <small>当前分类总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="layui-box">
        <div class="layui-row layui-col-space10">
            <div class="layui-col-md6">
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>昵称</th>
                        <th>加入时间</th>
                        <th>签名</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>一博</td>
                        <td>2020-11-16</td>
                        <td>怎么忘掉一个自己喜欢的人…</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="layui-col-md6">
                <ul class="layui-timeline">
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">8月18日</h3>
                            <p>
                                <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                                <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                            </p>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">8月16日</h3>
                            <p>杜甫的思想核心是儒家的仁政思想，他有“<em>致君尧舜上，再使风俗淳</em>”的宏伟抱负。个人最爱的名篇有：</p>
                            <ul>
                                <li>《登高》</li>
                                <li>《茅屋为秋风所破歌》</li>
                            </ul>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">8月15日</h3>
                            <p>
                                中国人民抗日战争胜利72周年
                                <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                                <br>铭记、感恩
                                <br>所有为中华民族浴血奋战的英雄将士
                                <br>永垂不朽
                            </p>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">过去</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
</body>
</html>