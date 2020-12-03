
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import ="java.sql.*,dao.*"%>

<html>

  <head>

    <title>loginCL.jsp页面</title>

  </head>

  <body align="center">

<%
int result;
String id=request.getParameter("name").trim();
String logpassword=request.getParameter("password").trim();
Dbdao douban=new Dbdao();

result=douban.query(id, logpassword);
if(result==1)
{
	out.print(id+"登录成功");
	response.sendRedirect("index.jsp");
}
if(result==0)
{
	out.print("密码输入错误！！！<br>"+"重新<a href=\"login.jsp\">登录</a>");
	
}
if(result==-1)
{
	
	out.print("<font color=red>"+id+"</font>用户不存在！！！<br>"+"请点击<a href=\"registered.jsp\">注册</a>");

}
%>

  </body>

</html>


 