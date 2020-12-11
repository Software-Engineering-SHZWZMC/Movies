<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import ="java.sql.*,dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ResultSet rs=null;
String term="这个杀手";

Dbdao douban=new Dbdao();
rs=douban.searchmovies(term);
while(rs.next())
{
	String data="";
	data+="rank:"+rs.getString(1)+"@";
	data+="name:"+rs.getString(2)+"@";
	data+="picturelink:"+rs.getString(3)+"@";
	data+="country:"+rs.getString(4)+"@";
	String rank,name,picturelink,country;
	rank=data.split("@")[0].split(":")[1];
	name=data.split("@")[1].split(":")[1];
	picturelink=data.split("@")[2].split(":")[1];
	country=data.split("@")[3].split(":")[1];
	out.println(rank);
	
	out.println(name);
	out.println(picturelink);
	out.println(country);
	out.print("---------------");
	
}




%>
</body>
</html>