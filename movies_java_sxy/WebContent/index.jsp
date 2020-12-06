<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"
%>
    

<html lang="zh-CN">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width"/>
        <title>首页</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="index.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/swiper-bundle.min.css">
       </head>
    <body>
        
        
<!--顶部样式
<div style=" width:100px;height:100px;background:yellow ;float:right;padding-top:200px;position:absolute;">5545</div>
 -->   <div  class="index" style="position: relative;">
        <div style="float:left;">
           
        
            <div style="width: 50px;float:left"><a href="index.html" target="blank">首页</a></div>
            <div style="width: 50px;float:left"><a href="index.html" target="blank">分类</a></div>

           
            
        </div>
        <div style="position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);">
            <image src="../img/2.jpg" name="图标" width=100px height=100px></image>
        </div>
        <div style="width: 100px;float:right;">
        <a href="index2.jsp" target="blank">登录/注册</a></div>

           
            
        </div>
        <div class="clear"></div>
    
    </div>
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
   <form action="" method="get" class="box">
    <input type="text" value="" placeholder="请在这里输入你想要的内容" width:350px;">
    <input type="submit"value="搜索"/>

   </form>
   </div>
<jsp:include page="index.html" />


</body>
</html>