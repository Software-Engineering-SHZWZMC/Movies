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
   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
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
        <a href="self.html" target="blank" value=>登录</a></div>

           
            
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
<!--下面的是滑动图片的动画-->
<div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide">Slide 1</div>
      <div class="swiper-slide">Slide 2</div>
      <div class="swiper-slide">Slide 3</div>
      <div class="swiper-slide">Slide 4</div>
      <div class="swiper-slide">Slide 5</div>
      <div class="swiper-slide">Slide 6</div>
      <div class="swiper-slide">Slide 7</div>
      <div class="swiper-slide">Slide 8</div>
      <div class="swiper-slide">Slide 9</div>
      <div class="swiper-slide">Slide 10</div>
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
          delay: 400,
          disableOnInteraction: false,
        },
    });
  </script>
    


</body>
</html>