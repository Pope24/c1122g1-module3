<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %>
Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/7/2023
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dictionary</title>
</head>
<body>
  <%!Map<String, String> dic = new HashMap<>();%>
<%
  dic.put("hello", "xin chao");
  dic.put("how", "the nao");
  dic.put("phone", "dien thoai");
  dic.put("book", "sach");
  String search = request.getParameter("search");
  PrintWriter writer = response.getWriter();
  String result = dic.get(search);
  if (result != null) {
    writer.println("Word: " + result);
    writer.println("Result: " +result);
  }
  else {
    writer.println("Not found");
  }
%>
</body>
</html>