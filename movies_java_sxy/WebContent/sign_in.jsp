<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<!--这里改自己的类-->
Dbdao douban=new Dbdao();
这里改成增加查询自己的用户名
result=douban.query(id, logpassword);
if(result==1)
{
	out.print(id+"登录成功");
	session.setAttribute("username",name);
	response.sendRedirect("index2.jsp");
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