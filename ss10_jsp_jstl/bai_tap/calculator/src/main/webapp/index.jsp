<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/result-operator" method="post">
    <h1>Simple Calculator</h1>
    <label>First operand: </label><input type="text" style="height: 20px; margin-bottom: 10px" name="firstOperand"
                                         placeholder="Enter first operand"><br>
    <label>Operator: </label>
    <select style="height: 20px; margin-bottom: 10px" name="operator" aria-label="Default select example">
        <option value="+">Add</option>
        <option value="-">Subtract</option>
        <option value="*">Multiply</option>
        <option value="/">Divide</option>
    </select><br>
    <label>Second operand: </label><input type="text" style="height: 20px; margin-bottom: 10px" name="secondOperand"
                                          placeholder="Enter second operand"><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>