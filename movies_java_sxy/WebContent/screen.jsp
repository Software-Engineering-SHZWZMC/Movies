<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import ="java.sql.*,dao.*"%>
<%
String term=request.getParameter("term");
String type=term.split("@")[0];
String year=term.split("@")[1];
String country=term.split("@")[2];

String rank,name,picture,info=null;
ArrayList infoList=new ArrayList();
Dbdao douban =new Dbdao();
ResultSet rs=douban.screen(type, year, country);

rs.first();
while (rs.next())
{
	rank=rs.getString(1);
	name=rs.getString(2);
	picture=rs.getString(3);
	info=rank+"@"+name+"@"+picture+"@";
	out.println(info);
	break;
}

%>
<a href="login.jsp">