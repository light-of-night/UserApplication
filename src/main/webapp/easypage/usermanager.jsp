<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<script>
    $(function () {
        $("#user_datagrid").datagrid({
            url: "${pageContext.request.contextPath}/static/datagrid_data.json",
            method: "get",
            fitColumns: true,
            singleSelect: true,
            pagination: true,
            striped: true,
            remoteSort: false,
            fit: true,
            pageSize: 15,
            pageNumber: 1,
            pageList: [5, 10, 15],
            toolbar: '#tb',
            columns: [[
                {field: "id", title: "用户ID", width: 5, sortable: true},
                {field: "name", title: "名称", width: 20},
                {
                    field: "sex", title: "性别", width: 20, formatter: function (value, row, index) {
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

<table id="user_datagrid">
</table>
<div id="tb" style="padding:2px 5px;">
    <a id="user_add_btn" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a id="user_edit_btn" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a id="user_delete_btn" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
    <input id="search_box"/>
    <div id="searc_menu" style="width:120px">
        <div data-options="name:'name',iconCls:'icon-man'">用户名</div>
        <div data-options="name:'sex'">性别</div>
        <div data-options="name:'birthDay'">生日</div>
    </div>
</div>