<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>RequetBody-更新PUT</title>
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery.extend.js"></script>
    <script>
        $(function () {
            $("#rest_update_btn").click(function () {
                var user = $("#rest_update_form").serializeForm2JSON();
                //这里包装 可以直接转换成对象
                $.ajax({
                    url: "${pageContext.request.contextPath}/UserManager/user",
                    type: "put",
                    contentType: "application/json",
                    dataType: "json",
                    data: user,
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
<br/><br/><br/><br/><br/><br/>
<div align="center">
    <form id="rest_update_form">
        <table style="text-align: center;" border="1" cellpadding="0" cellspacing="0" width="25%">
            <thead>
            <tr>
                <td>标题</td>
                <td>控件</td>
            </tr>
            </thead>


            <tbody>
            <tr>
                <td>用户ID</td>
                <td><input name="id" type="text"></td>
            </tr>

            <tr>
                <td>新密码</td>
                <td><input name="password" type="text"></td>
            </tr>

            <tr>
                <td>性&nbsp;别</td>
                <td>
                    <input type="radio" value="true" name="sex"> &nbsp;&nbsp;&nbsp;
                    <input type="radio" value="false" name="sex">
                </td>
            </tr>
            <tr>
                <td>日&nbsp;期</td>
                <td><input name="birthDay" type="date" pattern="yyyy-MM-dd"/></td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2">
                    <a id="rest_update_btn" href="javascript:void(0)">提&nbsp;&nbsp;交</a>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<div align="center">
    <a href="${pageContext.request.contextPath}/views/RequetBody.jsp">返回上级</a>
</div>
</body>