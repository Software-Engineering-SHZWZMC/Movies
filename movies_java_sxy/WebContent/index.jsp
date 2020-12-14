<%@page import="dao.Dbdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.Random"
%>
    

<html lang="zh-CN">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width"/>
        <title>首页</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    	<link href="search-css/index.css" rel="stylesheet" type="text/css" />
   		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
		<script type="text/javascript" src="search-js/modernizr-1.5.min.js"></script>
    </head>
    <body>
 <%! String id,username,src; %>  
<%
     id=request.getParameter("id");
	Dbdao db=new Dbdao();
	ResultSet rs=db.querytoshow(id);
	while(rs.next())
	{
	 username=rs.getString(5);
	}
	if(id==null)
	{
		src="login.jsp";
		username="登录/注册";
		
	}else{
		src="self.jsp?userid="+id;
		
	}
%>       
        
<!--顶部样式
<div style=" width:100px;height:100px;background:yellow ;float:right;padding-top:200px;position:absolute;">5545</div>
 -->   

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
          <li><a href="fenlei02.jsp">分类</a></li>
          <li><a href=<%=src %>><%=username %></a></li>
          
        </ul>
      </nav>
    </header>
</div>
 
 
   <!--轮播图样式
-->
<% 

int []picture=new int[10];
String []link=new String[10];

for (int i=0;i<10;i++)
{
	int ranl=(int)(Math.random()*250);
	picture[i]=ranl;
	link[i]="image/"+ranl+".jpg";

}
%> 

<!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[0] %>&userid=<%=id %>" target="parent"><img src=<%=link[0] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[1] %>&userid=<%=id %>" target="parent"><img src=<%=link[1] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[2] %>&userid=<%=id %>" target="parent"><img src=<%=link[2] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[3] %>&userid=<%=id %>" target="parent"><img src=<%=link[3] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[4] %>&userid=<%=id %>" target="parent"><img src=<%=link[4] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[5] %>&userid=<%=id %>" target="parent"><img src=<%=link[5] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[6] %>&userid=<%=id %>" target="parent"><img src=<%=link[6] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[7] %>&userid=<%=id %>" target="parent"><img src=<%=link[7] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[8] %>&userid=<%=id %>" target="parent"><img src=<%=link[8] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[9] %>&userid=<%=id %>" target="parent"><img src=<%=link[9] %>></a></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
  </div>

  <!-- Swiper JS -->
 
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
//       slidesPerView: 'auto',
      slidesPerView: 3,
      spaceBetween: 20,
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      },
      loop: true,
      autoplay: {
        delay:2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
    });
  </script>
<!-- <div class="swiper-container" > -->
<!--     <div class="swiper-wrapper" > -->
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[0] %>" target="parent"><img src=<%=link[0] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[1] %>" target="parent"><img src=<%=link[1] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[2] %>" target="parent"><img src=<%=link[2] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[3] %>" target="parent"><img src=<%=link[3] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[4] %>" target="parent"><img src=<%=link[4] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[5] %>" target="parent"><img src=<%=link[5] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[6] %>" target="parent"><img src=<%=link[6] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[7] %>" target="parent"><img src=<%=link[7] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[8] %>" target="parent"><img src=<%=link[8] %>></a></div> --%>
<%--       <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[8] %>" target="parent"><img src=<%=link[9] %>></a></div> --%>
<!--     </div> -->
<!--     Add Arrows -->
<!--     <div class="swiper-button-next"></div> -->
<!--     <div class="swiper-button-prev"></div> -->
<!--   </div> -->
<!--   <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>  -->
   

<!--   <!-- Initialize Swiper --> -->
<!--   <script> -->
<!-- //     var swiper = new Swiper('.swiper-container', { -->
<!-- //       navigation: { -->
<!-- //         nextEl: '.swiper-button-next', -->
<!-- //         prevEl: '.swiper-button-prev', -->
<!-- //       }, -->
<!-- //       loop: true, -->
<!-- //       autoplay: { -->
<!-- //           delay:2500, -->
<!-- //           disableOnInteraction: false, -->
<!-- //         }, -->
<!-- //     }); -->
<!--   </script> -->


</body>
</html>