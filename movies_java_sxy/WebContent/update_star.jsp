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
	<%
		String rank= request.getParameter("rank");
		String star = request.getParameter("star");
		Dbdao douban=new Dbdao();
		douban.updateaverage_star(rank, star);
		ResultSet rs=douban.querymovies(rank);
		String newstar="";
		while(rs.next())
		{
			newstar=rs.getString(19);
		}
		out.println(newstar);
	%>

</body>
</html>