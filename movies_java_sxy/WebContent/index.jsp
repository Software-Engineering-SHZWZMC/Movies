<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"
%>
    
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width"/>
        <title>首页</title>
    <link href="index.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    </head>
    <body>
        
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> 
<!--顶部样式
<div style=" width:100px;height:100px;background:yellow ;float:right;padding-top:200px;position:absolute;">5545</div>
 -->   <div  class="index" style="position: relative;">
        <div style="float:left;">
            [文件]
        
            <div style="width: 50px;float:left"><a href="index.html" target="blank">首页</a></div>
            <div style="width: 50px;float:left"><a href="index.html" target="blank">分类</a></div>

           
            
        </div>
        <div style="position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);">
            <image src="../img/2.jpg" name="图标" width=100px height=100px></image>
        </div>
        <div style="width: 100px;float:right;">
        <a href="login.jsp" target="blank">登录/注册</a></div>

           
            
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
    <input type="text" value="" placeholder="请在这里输入你想要的内容" style="display:table-cell;width:500px;vertical-align:middle">
    <input type="submit"value="搜索"/>

   </form>
   <%!
	

String allmovielink[]=new String[250];	
String picturelink;
String passlink[]=new String[8];

%>




<%  
        try {  
            Class.forName("com.mysql.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/douban?useSSL=false"; //数据库名
            String username = "root";  //数据库用户名
            String password = "sxy000217";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

            if(conn != null)
            {            
                Statement stmt = null;  
                String sql = "SELECT * FROM movies";  //查询语句
                stmt = conn.createStatement();  
                ResultSet rs = stmt.executeQuery(sql);  
                out.print("<br />");  
                int i=0;
                while(rs.next()) 
                { 
              		picturelink=rs.getString(3);
                	out.println();
                	allmovielink[i]="..image/"+picturelink;
                	i++;	
            	}
            }
            else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            out.print(e);  
        } 
	for (int i=0;i<7;i++)
	{
		int r;
		r=(int)(Math.random() * 250);
		passlink[i]=allmovielink[r];
	}
	
 		
%>

   </div>
<!--下面的是滑动图片的动画-->

    <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src=<%=allmovielink[0] %>></div>
      <div class="swiper-slide"><img src="E:/1.jpg"></div>
      <div class="swiper-slide"><img src=https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1082651990.jpg></div>
      <div class="swiper-slide"><img src=https://img3.doubanio.com/view/photo/s_ratio_poster/public/p511118051.jpg></div>
      <div class="swiper-slide"><img src=https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1014542496.jpg></div>
      <div class="swiper-slide"><img src=https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2561305376.jpg></div>
      <div class="swiper-slide"><img src=https://img1.doubanio.com/view/photo/s_ratio_poster/public/p792223507.jpg></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      autoplay: {
        delay: 3500,
        disableOnInteraction: false,
      },
      keyboard: {
        enabled: true,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      
    });
  </script>
  
<!--下面的是一个一个排列组合的DIv-->
    <div style="background:red; height:200px;padding-right:100px;padding-left:100px;">
    <div style=" width:25%;height:100%;background:green ;float:right;" ><img src="../img/2.jpg" width=100px height=100px></div>
    <div style=" width:25%;height:50%;background:yellow ;float:left;"><img src="../img/2.jpg" width=100px height=100px></div>
    <div style=" width:25%;height:50%;background:yellow ;float:left;"><img src="../img/2.jpg" width=100px height=100px></div>
    <div style=" width:25%;height:50%;background:yellow ;float:left;"><img src="../img/2.jpg" width=100px height=100px></div>
    
    </div>



</body>
</html>
