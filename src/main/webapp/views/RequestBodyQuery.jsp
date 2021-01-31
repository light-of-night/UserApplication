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
            $("#query_all_btn").click(function () {
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
                    type: "GET",
                    dataType: "json",
                    success: function (data) {
                        alert(data.name + "----------------" + data.password)
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
<button id="query_all_btn">查询</button>
<div id="userlist">
    <input type="checkbox" value="19"> 19 <br/>
    <input type="checkbox" value="20"> 20 <br/>
    <input type="checkbox" value="21"> 21<br/>
</div>
<a href="${pageContext.request.contextPath}/views/RequetBody.jsp">back</a>
</body>