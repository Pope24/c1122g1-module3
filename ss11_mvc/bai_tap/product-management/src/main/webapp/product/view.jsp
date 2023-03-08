<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/8/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Management</title>
</head>
<style>
    td:not(:first-child), th:not(:first-child) {
        width:100px;
    }
</style>
<body>
    <h1>Product List</h1>
    <a href="/products?action=create">Create new product</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Amount</th>
        </tr>
        <c:forEach items="${productList}" var="product">
            <tr>
                <td><a href="/products?action=view&id=${product.getId()}">${product.getId()}</a></td>
                <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
                <td>${product.getDesc()}</td>
                <td>${product.getAmount()}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
