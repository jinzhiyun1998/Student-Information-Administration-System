<%--
  Created by IntelliJ IDEA.
  User: 13681864361
  Date: 2019/9/11
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>更新历史</title>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${ctx}/static/plugins/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/plugins/layuiadmin/style/admin.css" media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>更新时间线</legend>
</fieldset>
<ul class="layui-timeline">
    <li class="layui-timeline-item">
        <i class="layui-icon layui-timeline-axis"></i>
        <div class="layui-timeline-content layui-text">
            <h3 class="layui-timeline-title">v1.2.0-2019.5.19</h3>
            <div class="layui-timeline-title">
                <p><em>大学生信息管理系统</em> StuInfoAdmin-v1.2.0版本上线啦！</p>
                <ul>
                    <li>修复了前端编辑添加弹窗在不同分辨率客户机上的显示大小问题</li>
                    <li>新增Redis技术，用以缓存用户名密码，用户错误登录次数限制，邮箱验证码等等</li>
                    <li>新增连续输错用户名密码超过一定次数后的限制时间</li>
                    <li>更改了邮箱验证码有效时间的实现方式，由服务端java实现改为redis过期时间实现</li>
                    <li>提升了服务端的安全性和新增异常处理机制，用aop实现入参的校验，对不合法的请求及其参数值用日志记录，并抛出异常</li>
                    <li>优化了util包等源代码的结构，增强了可拓展性</li>
                </ul>
            </div>
        </div>
    </li>
    <li class="layui-timeline-item">
        <i class="layui-icon layui-timeline-axis"></i>
        <div class="layui-timeline-content layui-text">
            <h3 class="layui-timeline-title">v1.1.0-2019.7.27</h3>
            <p><em>大学生信息管理系统</em> StuInfoAdmin-v1.1.0版本上线啦！</p>
            <ul>
                <li>优化了数据表结构，对原有的表的部分字段进行了修改，并增加了title和grade两个表</li>
                <li>优化了sql语句效率</li>
                <li>优化了前端查询界面及查询方式，使其更加全面，对用户友好</li>
                <li>更新了登录界面记住密码的cookie设置</li>
                <li>更新了邮箱验证码服务，增加了验证码有效时间</li>
                <li>优化了源代码结构，增强了规范性和可拓展性</li>
            </ul>
        </div>
    </li>
    <li class="layui-timeline-item">
        <i class="layui-icon layui-timeline-axis"></i>
        <div class="layui-timeline-content layui-text">
            <h3 class="layui-timeline-title">v1.0.0-2019.9.12</h3>
            <p>
                <em>大学生信息管理系统</em>StuInfoAdmin-v1.0.0的一切准备工作似乎都已到位。发布之弦，一触即发。
                <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
            </p>
        </div>
    </li>
    <li class="layui-timeline-item">
        <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
        <div class="layui-timeline-content layui-text">
            <div class="layui-timeline-title">孵化中...</div>
        </div>
    </li>
</ul>

<script src="${ctx}/static/plugins/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${ctx}/static/plugins/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>

</body>
</html>
