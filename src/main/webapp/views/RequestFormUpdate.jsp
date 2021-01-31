<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>RequetBody-更新PUT</title>
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery.extend.js"></script>
</head>
<body>

<form id="form_update_form" method="post" action="${pageContext.request.contextPath}/FormUserManager/updateUser">
    <table style="text-align: center;" border="1" cellpadding="0" cellspacing="0">
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
            <td>请求类型</td>
            <td><input name="_method" type="text" value="put"></td>
        </tr>
        <tr>
            <td>密&nbsp;码</td>
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
                <input type="submit">提&nbsp;&nbsp;交</input>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
<a href="${pageContext.request.contextPath}/views/RequetForm.jsp">back</a>
</body>