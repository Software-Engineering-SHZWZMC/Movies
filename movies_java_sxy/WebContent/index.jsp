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
    <link href="index.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
       </head>
    <body>
        
        
<!--顶部样式
<div style=" width:100px;height:100px;background:yellow ;float:right;padding-top:200px;position:absolute;">5545</div>
 -->   <div  class="index" style="position: relative;">
        <div style="float:left;">
           
        
            <div style="width: 50px;float:left;"><a href="index.jsp" target="_parent"><p>首页</p></a></div>
            <div style="width: 50px;float:left;"><a href="index.html" target="blank"><p>分类</p></a></div>

           
            
        </div>
        <div style="position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);">
            <img src="image/251.jpg" style="width:200px;height:120px;"/>
        </div>
        <div style="width: 100px;float:right;txet-align:right;">
        <a href="login.jsp" target="_blank">登录/注册</a></div>

           
            
        </div>
        <div class="clear"></div>
    
    
<!--搜索框样式
--> 

    <div style="text-align:center" >
    
     <!--  /*** <input
    placeholder="请输入内容"
    prefix-icon="el-icon-search"
    model="input2">
  </input>
  <button type="primary" icon="el-icon-search">搜索</button>
   --> 
   <form action="search.jsp" method="get" class="box">
    <input type="text"  name="search" value="" placeholder="请在这里输入你想要的内容" width:350px;">
    <input type="submit"value="搜索"/>

   </form>
   </div>
   
   <!--轮播图样式
-->
<%
int []picture=new int[10];
String []link=new String[10];
Random r=new Random();
for (int i=0;i<10;i++)
{
	int ranl=(int)(Math.random()*250);
	picture[i]=ranl;
	link[i]="image/"+ranl+".jpg";
	System.out.println(ranl);
}


%> 

<div class="swiper-container" >
    <div class="swiper-wrapper" >
      <div class="swiper-slide" ><a  href="demo.jsp?id=<%=picture[0] %>" target=“parent”><img src=<%=link[0] %>></a></div>
      <div class="swiper-slide" ><a  href="demo.jsp?id=<%=picture[1] %>" target=“parent”><img src=<%=link[1] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[2] %>" target=“parent”><img src=<%=link[2] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[3] %>" target=“parent”><img src=<%=link[3] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[4] %>" target=“parent”><img src=<%=link[4] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[5] %>" target=“parent”><img src=<%=link[5] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[6] %>" target=“parent”><img src=<%=link[6] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[7] %>" target=“parent”><img src=<%=link[7] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[8] %>" target=“parent”><img src=<%=link[8] %>></a></div>
      <div class="swiper-slide"><a  href="demo.jsp?id=<%=picture[9] %>" target=“parent”><img src=<%=link[9] %>></a></div>
    </div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> 
   

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      loop: true,
      autoplay: {
          delay:2500,
          disableOnInteraction: false,
        },
    });
  </script>


</body>
</html>