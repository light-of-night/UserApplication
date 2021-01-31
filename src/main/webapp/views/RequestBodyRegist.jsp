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
            $("#rest_register_form input[type='file']").imgShow({
                imageId: "photoImg"
            })


            $("#rest_register_btn").click(function () {
                var formData = new FormData();

                var file = $("#rest_register_form input[type='file']")[0].files[0]
                formData.append("photoFile", file);

                var user = $("#rest_register_form").serializeForm2JSON();

                //这里包装 可以直接转换成对象
                formData.append("user", new Blob([user], {type: "application/json"}));

                $.ajax({
                    url: "${pageContext.request.contextPath}/UserManager/user",
                    type: "post",
                    contentType: false,//忽略contentType
                    processData: false,//取消序列换 formData本来就是序列化好的
                    dataType: "json",
                    data: formData,
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

<form id="rest_register_form">


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
            <td rowspan="3"><img id="photoImg" width="50px" alt="用户图"/></td>
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
            <td><input name="photoFile" type="file"/></td>
        </tr>
        </tbody>


        <tfoot>
        <tr>
            <td colspan="3">
                <a id="rest_register_btn" href="javascript:void(0)">提&nbsp;&nbsp;交</a>
            </td>
        </tr>
        </tfoot>


    </table>
</form>
<a href="${pageContext.request.contextPath}/views/RequetBody.jsp">back</a>
</body>