<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/8/2023
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Product</title>
</head>
<body>
<a href="/products">Back to view</a>
<p>ID: ${requestScope["product"].getId()}</p>
<p>Name: ${requestScope["product"].getName()}</p>
<p>Description: ${requestScope["product"].getDesc()}</p>
<p>Amount: ${requestScope["product"].getAmount()}</p>
</body>
</html>
