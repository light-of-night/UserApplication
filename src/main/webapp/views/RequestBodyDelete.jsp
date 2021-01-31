<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>RequetBody-更新Delete</title>
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery.extend.js"></script>
    <script>
        $(function () {
            //批量选择
            $("#select_all_btn").click(function () {
                $("#userlist input[type='checkbox']").attr("checked", true)
            })

            //批量删除
            $("#delete_all_btn").click(function () {
                var length = $("#userlist input[type='checkbox']:checked").length
                var inputs = []
                for (var i = 0; i < length; i++) {
                    inputs.push($("#userlist input[type='checkbox']:checked")[i])
                }
                var vals = []
                inputs.forEach(function (item, i) {
                    vals.push($(item).val())
                })
                $.ajax({
                    url: "${pageContext.request.contextPath}/UserManager/user/" + vals.join(","),
                    type: "delete",
                    success: function (data) {
                        alert("提交成功");
                    },
                    error: function () {
                        alert("出错了！")
                    }
                });
            })
        })
    </script>
</head>
<body>
<button id="select_all_btn">全选</button>
<button id="delete_all_btn">删除</button>
<div id="userlist">
    <input type="checkbox" value="18"> 18 <br/>
    <input type="checkbox" value="6"> 6 <br/>
    <input type="checkbox" value="11"> 11<br/>
</div>
<a href="${pageContext.request.contextPath}/views/RequetBody.jsp">back</a>
</body>