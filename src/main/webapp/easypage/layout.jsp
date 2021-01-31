<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>EasyUI-布局</title>
    <!--引入样式主题-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
    <!--引入图标样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
    <!--引入jQuery EasyUI 插件 -->
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script>
        $(function () {

        })
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',height:60">
    <h2>欢迎<b>XXX</b>登陆</h2>
</div>
<div data-options="region:'south',height:30"></div>
<div id="left"
     data-options="region:'west',width:120,title:'操作栏',hideCollapsedContent:false,href:'${pageContext.request.contextPath}/easypage/left.jsp'">

</div>
<div data-options="region:'center',width:120,border:false">
    <div id="center_content_tabs" class="easyui-tabs" data-options="border:false,fit:true"
         style="background-color: #F4F4F4"></div>
</div>
</body>