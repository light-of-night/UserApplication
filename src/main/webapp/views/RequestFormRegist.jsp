<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>RequetBody-注册</title>
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery.extend.js"></script>
    <script>
        $(function () {
            $("#form_register_form input[type='file']").imgShow({
                imageId: "photoImg"
            })
        })
    </script>
</head>
<body>

<br/>
<hr/>
<br/><br/>
<div align="center">
    <form id="form_register_form" method="post" enctype="multipart/form-data"
          action="${pageContext.request.contextPath}/FormUserManager/registUser">
        <table style="text-align: center;" border="1" cellpadding="0" cellspacing="0">
            <thead>
            <tr>
                <td>标题</td>
                <td>控件</td>
                <td>图</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>用户名</td>
                <td><input name="name" type="text"></td>
                <td rowspan="5"><img id="photoImg" width="50px" alt="用户图"/></td>
            </tr>
            <tr>
                <td>密&nbsp;码</td>
                <td><input name="password" type="password"></td>
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

            <tr>
                <td>头&nbsp;像</td>
                <td><input type="file" name="photoFile"/></td>
            </tr>


            </tbody>
            <tfoot>
            <tr>
                <td colspan="3">
                    <input type="submit" value="提交"></input>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>


    <a href="${pageContext.request.contextPath}/views/RequetForm.jsp">back</a>
</div>
</body>