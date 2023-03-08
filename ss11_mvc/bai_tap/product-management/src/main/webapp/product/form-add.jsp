<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/8/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form add</title>
</head>
<style>
    input {
        margin-bottom: 20px;
    }
</style>
<body>
<a href="/products">Back to view</a>
<form method="post">
    <label>ID: </label><input type="text" name="id" placeholder="input ID product" required><br>
    <label>Name: </label><input type="text" name="name" placeholder="input name product" required><br>
    <label>Description: </label><input type="text" name="desc" placeholder="input description product" required><br>
    <label>Amount: </label><input type="text" name="amount" placeholder="input amount product" required><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
