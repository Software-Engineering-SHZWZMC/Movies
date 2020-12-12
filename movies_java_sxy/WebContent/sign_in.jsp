<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import ="java.sql.*,dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>登陆跳转页面</title>
</head>
<body>
<%
int result;
String id=request.getParameter("name").trim();
String logpassword=request.getParameter("password").trim();
Dbdao douban=new Dbdao();
result=douban.query(id, logpassword);

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