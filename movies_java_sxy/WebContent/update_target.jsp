<%@page import="java.sql.ResultSet"%>
<%@page import="dao.Dbdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%  int num;
		String link= request.getParameter("link");
		String num1 = request.getParameter("num");
		num=Integer.parseInt(num1);
		Dbdao douban=new Dbdao();
		douban.updatecomment_num(link,num);
		ResultSet rs=douban.querymovies(link);
		String newstar=null;
		while(rs.next())
		{
			newstar=rs.getString(num+21);
		}
		out.println(newstar.split(",")[1]);
	%>

</body>
</html>