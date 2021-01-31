<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>RestBody Ajax测试</title>
</head>
<body>
<h3>RestBody Ajax测试</h3>
<ul>
    <li>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/views/RequestBodyRegist.jsp">RequestBodyRegister</a>
    </li>
    <li><a href="${pageContext.request.contextPath}/views/RequestBodyDelete.jsp">RequestBodyDelete</a></li>
    <li><a href="${pageContext.request.contextPath}/views/RequestBodyUpdate.jsp">RequestBodyUpdate</a></li>
    <li><a href="${pageContext.request.contextPath}/views/RequestBodyQuery.jsp">RequestBodyQuery</a></li>
</ul>
<a href="${pageContext.request.contextPath}/index.jsp">back</a>
</body>