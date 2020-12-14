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
		String tel=request.getParameter("tel").trim();
		Dbdao douban=new Dbdao();

		int result;
		
		try{

		
		if(name!=null ){
			result=douban.registered(name, password, refill,tel);
			if(result==0)
			{%>
			
				<script type="text/javascript" language="javascript">
				alert("非十位学号");
				window.location.href="registered.jsp";
				</script> 
			<% }%>
			<% 
			if(result==1){%>
				<script type="text/javascript" language="javascript">
				alert("该学号已经存在了");
				window.location.href="registered.jsp";
				</script> 
				<% 
			}else{
				if(result==2){//返回2，成功注册

				%>
				<script type="text/javascript" language="javascript">
				alert("注册成功");
				window.location.href="login.jsp";
				</script> 
<% 
				}else{//返回3，密码输入不一致
				if (result==3){%>
				<script type="text/javascript" language="javascript">
				alert("两次密码输入不一致");
				window.location.href="registered.jsp";
				</script> 
				<% }
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
