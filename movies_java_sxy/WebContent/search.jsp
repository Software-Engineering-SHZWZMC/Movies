<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int result;
String id=request.getParameter("search").trim();

这里改自己的类
Dbdao douban=new Dbdao();
查询返回一系列电影的信息
result=douban.query(id, logpassword);
if(result==1)
{
	返回电影名，主演，图片
	session.setAttribute("username",name);
	session.setAttribute("username",name);
	session.setAttribute("username",name);
	session.setAttribute("username",name);
	session.setAttribute("username",name);
	response.sendRedirect("search1.jsp");
}
if(result==0)
{
	out.print("密码输入错误！！！<br>"+"重新<a href=\"login.jsp\">登录</a>");
	
}

%>
</body>
</html>