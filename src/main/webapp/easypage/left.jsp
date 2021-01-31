<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<script>
    $(function () {


        $("#user_manager_btn").click(function () {
            var options = $("#user_manager_btn").linkbutton("options")
            addTab(options, "${pageContext.request.contextPath}/easypage/usermanager.jsp")
        })


        $("#user_location_btn").click(function () {
            var options = $("#user_location_btn").linkbutton("options")
            addTab(options)
        })


        $("#user_load_btn").click(function () {
            var options = $("#user_load_btn").linkbutton("options")
            addTab(options)
        })


        function addTab(options, url) {
            if (!$("#center_content_tabs").tabs('exists', options.text)) {
                $("#center_content_tabs").tabs('add', {
                    title: options.text,
                    fit: true,
                    closable: true,
                    iconCls: options.iconCls,
                    href: url
                })
            } else {
                $("#center_content_tabs").tabs("select", options.text)
            }
        }
    })
</script>
<div class="easyui-accordion" data-options="fit:true">
    <div title="用户管理" data-options="iconCls:'icon-man',selected:true">
        <a id="user_manager_btn" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,width:'100%'">用户管理</a>
        <a id="user_location_btn" class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true,width:'100%'">用户分布</a>
        <a id="user_load_btn" class="easyui-linkbutton"
           data-options="iconCls:'icon-print',plain:true,width:'100%'">板块负载</a>
    </div>
    <div title="库存管理" data-options="iconCls:'icon-logo'">
    </div>
    <div title="系统参数">
    </div>
</div>