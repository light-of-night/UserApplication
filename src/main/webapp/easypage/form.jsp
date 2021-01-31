<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>EasyUI-表单</title>
    <!--引入样式主题-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
    <!--引入图标样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
    <!--引入jQuery EasyUI 插件 -->
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js"></script>

    <script>
        <%--扩张组件的功能--%>
        $.extend($.fn.validatebox.defaults.rules, {
            len: {
                validator: function (value, param) {
                    return value.length == param[0];
                },
                message: '请输入{0} 个字符.'
            }
        });


        $(function () {
            // $.messager.alert('警告','警告消息');

            $("#input1").textbox({
                iconCls: "icon-lock",
                type: "password",
                required: true,
                validType: "len[6]"
            })

            $("#dateInput").datebox({
                editable: false,
                onSelect: function (date) {
                    // alert(date.getFullYear()+":"+(date.getMonth()+1)+":"+date.getDate());
                }
            })


            //   联合体  combo
            $('#cc1').combo({
                required: true,
                editable: false,
                multiple: false
            });

            $('#cc1').combo("panel").append($("#sp"))

            $("#sp input[type='radio']").click(function () {
                //调用 combo 的方法 设置 他的值  $(this).val()==选中的值
                $('#cc1').combo("setValue", $(this).val())
                //拿选中的文本 对下拉框 做填充
                $('#cc1').combo("setText", $(this).find("~ span:first").text())
            })


            $('#cc3').combobox({
                url: '${pageContext.request.contextPath}/static/combobox_data.json',
                method: "get",
                valueField: 'id',
                textField: 'text'
            });


        })
    </script>
</head>
<body>
<%--required:true ：表示该组件必须要有值--%>
<h4> （1）、表单基本的使用</h4>
<input class="easyui-validatebox" data-options="required:true,validType:'email'"/>

<h4> （2）、扩展组件的功能及其 调用</h4>
<input class="easyui-validatebox" data-options="validType:'len[2]'"/>

<h4> （3）、表单中嵌套 小图标</h4>
<input class="easyui-textbox" name="username" data-options="iconCls:'icon-man',iconAlign:'left'"/>

<h4> （4）、密码框的调用</h4>   <input id="input1"/>

<h4> （5）、日期框的使用</h4>   <input id="dateInput"/>

<h4> （6）、文本框的使用--其中在左侧添加的小图标 </h4>
<input class="easyui-filebox" style="width:300px" data-options="buttonAlign:'left',buttonIcon:'icon-logo'">

<h4> （7）、下拉菜单 及选中获取 选中的值 方式一</h4>
<input id="cc1">

<div id="sp">
    <div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a language</div>
    <div style="padding:10px">
        <input type="radio" name="lang" value="01"><span>Java</span><br/>
        <input type="radio" name="lang" value="02"><span>C#</span><br/>
        <input type="radio" name="lang" value="03"><span>Ruby</span><br/>
        <input type="radio" name="lang" value="04"><span>Basic</span><br/>
        <input type="radio" name="lang" value="05"><span>Fortran</span>
    </div>
</div>
<hr/>

<h4> （8）、下拉菜单 及选中获取 选中的值 方式二</h4>

<select id="cc2" class="easyui-combobox" style="width:200px;">
    <option value="01">Java</option>
    <option value="02">Scala</option>
    <option value="03">hadoop</option>
</select>


<h4> （9）、下拉菜单 及选中获取 选中的值 数据来源 url json文件 动态获取 </h4>
<select id="cc3" style="width:200px;"></select>


</body>