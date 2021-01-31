<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>EasyUI-datagrid</title>
    <!--引入样式主题-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/bootstrap/easyui.css">
    <!--引入图标样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
    <!--引入jQuery EasyUI 插件 -->
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script>
        <%--数据表格--初始化datagrid --%>
        $(function () {
            $("#user_datagrid").datagrid({
                url: "${pageContext.request.contextPath}/static/datagrid_data.json",//用户加载数据
                method: "get",
                fitColumns: true,//配合width使用，真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
                singleSelect: true,//如果为true，则只允许选择一行。
                pagination: true,//底部显示分页工具栏
                striped: true,//是否显示斑马线效果。
                remoteSort: false,//不想在远程排序 --配合sortable:true使用
                fit: true,//自适应高度
                pageSize: 15,//在设置分页属性的时候初始化页面大小。
                pageNumber: 1,//在设置分页属性的时候初始化页码
                pageList: [5, 10, 15],//在设置分页属性的时候 初始化页面大小选择列表
                toolbar: '#tb',//id--选择器 --添加上方搜索框。
                //在请求远程数据的时候发送额外的参数。
                /*   queryParams: {
                       column: 'name',
                       value: '1234'
                   },  */

                //远程的排序
                /* sortOrder:"id",
                 sortOrder:"desc",*/

                //设置表格需要展示的字段。
                columns: [[
                    {field: "id", title: "用户ID", width: 5, sortable: true, align: "center"},//本地的排序
                    {field: "name", title: "名称", width: 20, align: "center"},
                    {
                        field: "sex", title: "性别", width: 20, align: "center", formatter: function (value, row, index) {
                            if (value) {
                                return "男"
                            } else {
                                return "女"
                            }
                        }
                    },
                    {field: "birthDay", title: "生日", width: 10, align: "center"},
                    {
                        field: "photo", title: "头像", width: 20, formatter: function (value, row, index) {
                            return "<img width='30' src=" + value + "/>"
                        }
                    }
                ]]
            })
            //初始化 组件
            $('#search_box').searchbox({
                width: "30%",
                searcher: function (value, name) {

                    $("#user_datagrid").datagrid("load", {
                        "column": name,
                        "value": value
                    })
                },
                menu: '#searc_menu',
                prompt: '请输入值'
            });

            //给添加按钮添加事件
            $("#user_add_btn").click(function () {
                //$.messager.alert("添加","请添加信息")
                $("#user_datagrid").datagrid('appendRow', {
                    "id": 6,
                    "name": "温晓琪",
                    sex: false,
                    "birthDay": "2019-10-10",
                    "photo": "/UserModel/user.jpg"
                })
            })


            //给删除按钮添加事件
            $("#user_delete_btn").click(function () {
                //$.messager.alert("添加","请添加信息")
                var row = $("#user_datagrid").datagrid('getSelected');
                if (row == null) {
                    $.messager.show({
                        title: '删除警告',
                        msg: '请至少选择1行数据',
                        timeout: 5000,
                        showType: 'slide'
                    });
                    return
                }
                $.messager.confirm('删除确认对话', '您想要删除[' + row.id + ']记录吗？', function (r) {
                    if (r) {
                        var rowIndex = $("#user_datagrid").datagrid('getRowIndex', row);
                        $("#user_datagrid").datagrid('deleteRow', rowIndex);
                    }
                });
            })


            //给修改按钮添加 修改事件
            $("#user_edit_btn").click(function () {
                var row = $("#user_datagrid").datagrid('getSelected');
                if (row == null) {
                    $.messager.show({
                        title: '编辑提示',
                        iconCls: 'icon-edit',
                        msg: '请至少选择1行数据',
                        timeout: 5000,
                        showType: 'slide'
                    });
                    return
                }
                console.log(row)
            })
        })
    </script>
</head>
<body>
<table id="user_datagrid">

</table>


<div id="tb" style="padding:2px 5px;">
    <a id="user_add_btn" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a id="user_edit_btn" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a id="user_delete_btn" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>

    <%--搜索相关--js组件的初始化 --%>
    <input id="search_box"/>
    <div id="searc_menu" style="width:120px">
        <div data-options="name:'name',iconCls:'icon-man'">用户名</div>
        <div data-options="name:'sex'">性别</div>
        <div data-options="name:'birthDay'">生日</div>
    </div>
</div>
</body>