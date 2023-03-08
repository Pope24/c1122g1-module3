<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/8/2023
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form Edit</title>
</head>
<body>
<a href="/products">Back to view</a>
<form method="post">
    <h1>Form Edit</h1>
    <label>Name: </label><input type="text" name="name" value="${requestScope["product"].getName()}"><br><br>
    <label>Description: </label><input type="text" name="desc" value="${requestScope["product"].getDesc()}"><br><br>
    <label>Amount: </label><input type="text" name="amount" value="${requestScope["product"].getAmount()}"><br><br>
    <button style="margin-right: 10px" type="submit">Submit</button>
</form>
</body>
</html>
