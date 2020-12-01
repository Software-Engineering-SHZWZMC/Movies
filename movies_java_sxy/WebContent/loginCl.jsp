
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@
page import ="java.sql.*"
 %>
<html>

  <head>

    <title>loginCL.jsp页面</title>

  </head>

  <body align="center">

<%

int result;
String id=request.getParameter("name").trim();
String logpassword=request.getParameter("password").trim();

//判断登陆界面的用户名和密码，根据输入的不同情况进行不同的处理
Class.forName("com.mysql.jdbc.Driver"); 
String url = "jdbc:mysql://localhost:3306/douban?useSSL=false"; //数据库名
String username = "root";  //数据库用户名
String password = "sxy000217";  //数据库用户密码
ResultSet rs = null;
Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
Statement stmt = null;  
stmt=conn.createStatement();//stmt要先被创建好，实例化
rs=stmt.executeQuery("select * from users where id='"+id+"' ");

if(rs.next())
{	
	rs=stmt.executeQuery("select * from users where id='"+id+"' and password='"+logpassword+"' ");//mysql语句拼接
	if(rs.next()){
			result=1;      
		}else{
			result= 0;
		}
	}else{
		result=-1;
		}



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


 