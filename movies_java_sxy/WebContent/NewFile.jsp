<%@page import="dao.Dbdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.Random"
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
Dbdao douban=new Dbdao();
douban.updateusers("2018111165", "Riddle","啦啦啦！");

%>
</body>
</html>