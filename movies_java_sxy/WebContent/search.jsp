<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import ="java.sql.*,dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>搜索页面</title>
</head>
<link href="search-css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="search-css/style1.css" />
<script type="text/javascript" src="search-js/modernizr-1.5.min.js"></script>
<body>
<%! String id,username,src; %>  
<%
     id=request.getParameter("id");
	Dbdao db1=new Dbdao();
	ResultSet rs1=db1.querytoshow(id);
	while(rs1.next())
	{
	 username=rs1.getString(5);
	}
	if(id==null)
	{
		src="login.jsp";
		username="登录/注册";
		
	}else{
		src="self.jsp?userid="+id;
		
	}
%>       

<%
ResultSet rs=null;
int num=0;
ArrayList name = new ArrayList(); 
ArrayList picturelink = new ArrayList(); 
ArrayList  country= new ArrayList(); 
ArrayList rank = new ArrayList(); 
String term=request.getParameter("search");
// out.print(term);

Dbdao douban=new Dbdao();
rs=douban.searchmovies(term);
while(rs.next())
{
	rank.add(rs.getString(1));
	name.add(rs.getString(2));
	picturelink.add("image/"+rs.getString(3));
	country.add(rs.getString(4));
	
	num++;
}
rs.first();

%>

<div id="main">
    <header>
      <div id="logo"><h1>SUFE<a >&amp;MOVIES</a></h1></div>
      <form action="search.jsp" method="get" class="box">
      <div>
      <input type="text"  name="search" value="" placeholder="请在这里输入你想要的内容">
      <input type="submit" value="搜索"/>
      </div>
      </form>
      <nav>
        <ul class="lavaLampWithImage" id="lava_menu">
          <li><a href="index.jsp">主页</a></li>
          <li><a href="examples.">分类</a></li>
          <li><a href=<%=src %>><%=username %></a></li>
          
        </ul>
      </nav>
    </header>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery.easing.min.js"></script>
  <script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
  <script type="text/javascript" src="js/image_fade.js"></script>
  <script type="text/javascript">
    $(function() {
      $("#lava_menu").lavaLamp({
        fx: "backout",
        speed: 700
      });
    });
  </script>
<!-- <div class="list"> -->
<% 
for(int i=0;i<num;i++){
      %>
      <div id="Box">
<!--       <div class="Box"> -->
      	<a  href="demo.jsp?id=<%=rank.get(i) %>">
      	
      	<img width="200" alt=<%=name.get(i) %> src=<%=picturelink.get(i) %> class="">
      	</a>
      	<br/>
      	<a  href="demo.jsp?id=<%=rank.get(i) %>" class>
      			<span><%=name.get(i) %></span>
      	</a>
      		
     </div>
     <%
     }
      %>
</body>
</html>