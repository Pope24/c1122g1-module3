<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/display-discount" method="post">
    <h1>Product Discount Calculator</h1>
    <input type="text" name="ProductDescription" placeholder="Product Description">
    <input type="text" name="ListPrice" placeholder="List Price">
    <input type="text" name="DiscountPercent" placeholder="Discount Percent">
    <input type="submit" id="elm-btn" value=" Calculate Discount">
</form>
</body>
</html>