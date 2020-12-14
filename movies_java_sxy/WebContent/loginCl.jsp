
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
session.setAttribute("userid", "no");
result=douban.query(id, logpassword);
if(result==1)
{%>
	<script type="text/javascript" language="javascript">
	alert("登陆成功");
	window.location.href="index.jsp?id="+<%=id%>;
	</script> 
<% }%>

<% 
if(result==0)
{
	%>
	<script type="text/javascript" language="javascript">
	alert("密码输入错误！！！重新登陆");
	window.location.href='login.jsp';
	</script> 
	<% 
}%>
<%
if(result==-1)
{ %>
	<script type="text/javascript" language="javascript">
	alert("用户不存在，请注册！");
	window.location.href='register.jsp';
	</script> 
<% 
}%>

  </body>

</html>


 