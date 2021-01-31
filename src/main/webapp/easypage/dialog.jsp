<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>EasyUI-dialog</title>
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
            //初始化 对话框
            $("#login_dialog").dialog({
                title: '用户登陆',
                iconCls: "icon-logo",//设置图标
                width: 350,
                height: 200,
                top: 120,
                draggable: false,//是否允许拖拽
                closable: false,//（关闭小图标）是否出现
                closed: false, //初始化后 是否关闭 设置 true后 可执行$("#login_dialog").dialog（"open"） 打开
                modal: true,//模式化窗口，窗口后面的 按钮不允许 操作
                //输入框上方的位置
                toolbar: [{
                    text: '注册',
                    plain: true,//水平显示
                    handler: function () {
                        $("#login_dialog").dialog("close")
                        $("#register_dialog").dialog("open")
                    }
                }],

                //输入框下方的组件
                buttons: [{
                    text: '登陆',
                    iconCls: 'icon-ok',
                    handler: function () {
                        alert('登陆')
                    }
                }, {
                    text: '重置',
                    iconCls: 'icon-redo',
                    handler: function () {
                        alert('重置')
                    }
                }]
            })


            $("#register_dialog").dialog({
                title: '用户注册',
                iconCls: "icon-logo",
                width: 350,
                height: 200,
                top: 120,
                draggable: false,
                closable: false,
                closed: true,
                modal: true,
                toolbar: [{
                    text: '登陆页面',
                    plain: true,
                    handler: function () {
                        $("#login_dialog").dialog("open")
                        $("#register_dialog").dialog("close")
                    }
                }],
                buttons: [{
                    text: '注册',
                    iconCls: 'icon-ok',
                    handler: function () {
                        alert('注册')
                    }
                }, {
                    text: '重置',
                    iconCls: 'icon-redo',
                    handler: function () {
                        alert('重置')
                    }
                }]
            })
        })
    </script>
</head>
<body>
<%--（1）、登录对话框 --%>
<div id="login_dialog">
    <%--对话框中 填充内容--%>
    <%--设置居中，挤中间部分 表单中添加图标 prompt 提示语--%>
    <div style="padding-left: 10%;padding-right: 10%;margin-top: 10px"><%--内嵌css 样式style="width: 100%;height: 30px"--%>
        <input class="easyui-textbox" data-options="iconCls:'icon-man',prompt:'用户名'" style="width: 100%;height: 30px"/>
    </div>

    <div style="padding-left: 10%;padding-right: 10%;margin-top: 10px;margin-bottom: 20px">
        <input class="easyui-textbox" data-options="iconCls:'icon-lock',type:'password'"
               style="width: 100%;height: 30px"/>
    </div>
</div>


<%--（1）、注册对话框--%>
<div id="register_dialog">
    <div style="padding-left: 10%;padding-right: 10%;margin-top: 10px">
        <input class="easyui-textbox" data-options="iconCls:'icon-man',prompt:'用户名'" style="width: 100%;height: 30px"/>
    </div>
    <div style="padding-left: 10%;padding-right: 10%;margin-top: 10px;margin-bottom: 20px">
        <input class="easyui-textbox" data-options="iconCls:'icon-lock',type:'password'"
               style="width: 100%;height: 30px"/>
    </div>
</div>
</body>