<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册成功页面</title>
</head>
<body>
<%
		
		String name=request.getParameter("name").trim();//去除首尾空格
		String password=request.getParameter("password").trim();
		String refill=request.getParameter("refill").trim();
		Dbdao douban=new Dbdao();

		int result;
		try{


		if(name!=null ){
			result=douban.registered(name, password, refill);
			
			if(result==1){
				out.print("该学号已经存在  "+"请<a href=\"login.jsp\">登录</a>");//返回值为1，账号存在
			}else{
				if(result==2){//返回2，成功注册

				%>
				注册成功！！！<br>
				三秒钟后自动转到登录页面！！！<br>
				如果没有跳转，请点击<a href="login.jsp">这里</a>！！！
				<span style="font-size:24px;"><meta http-equiv="refresh" content="3;URL=login.jsp"> </span>
<% 
				}else{//返回3，密码输入不一致
				if (result==3){
				out.print(result);
				out.print("密码输入不一致!!!<br>"+"重新<a href=\"registered.jsp\">注册</a>");
				}
				}
			}
			}else {
				out.print("用户名不能为空");
			}
		}catch(Exception e){
			out.print(e);
		}
%>

</body>
</html>
