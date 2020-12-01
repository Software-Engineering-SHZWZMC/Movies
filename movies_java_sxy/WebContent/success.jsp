

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

  <head>

    <title>success.jsp页面</title>

  </head>

  <body>

<%

String referer = request.getHeader("Referer");

if(referer==null||referer.trim().length()==0||

!referer.equals("http://localhost:8081/two/login.jsp")){

response.sendRedirect("login.jsp");

return;

}
