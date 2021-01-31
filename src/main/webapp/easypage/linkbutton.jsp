<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>EasyUI</title>
    <!--引入样式主题-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/bootstrap/easyui.css">
    <!--引入图标样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
    <!--引入jQuery EasyUI 插件 -->
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script>
        <%--方式二 通过js的方式 初始化插件--%>
        $(function () {
            $("#btn5").linkbutton({//等价data-options

                //属性的设置
                iconCls: 'icon-print',
                iconAlign: "right",
                plain: true,

                //事件的调用 --通过事件 改变组件的属性
                onClick: function () {
                    alert("点我！")
                    $("#btn5").linkbutton("resize", { //方法调用
                        width: 80,
                        height: 50
                    })
                    $("#btn5").linkbutton("disable")
                }
            })
        })
    </script>
</head>
<body>
<%-- 引如eeasyUI 插件方式一 内嵌--%>
<%--所有的插件样式 以class easyUI -开头 后面为插件的名称 如 linkbutton--%>
<%--data-options 为非标准属性 表达组件的行为--%>
<a id="btn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">button1</a>
<a id="btn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok',iconAlign:'right'">button2</a>
<a id="btn3" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">button3</a>
<a id="btn4" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">button4</a>

<%--引入easyUi 插件 方式二--%>
<a id="btn5" href="#">点我</a>
</body>