<%@page import="jdk.nashorn.api.tree.WhileLoopTree"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.Random,dao.*"
%>
    

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="./style.css">
  <link rel="stylesheet" href="Bubble.css">
  <link href="search-css/demo.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="search-js/modernizr-1.5.min.js"></script>
</head>
<style type="text/css">
.starWrapper
{border:1px solid #FFCC00;padding:5px;width:110px;height:25px;} 
.starWrapper img
{cursor:pointer;
 width:15px;
 height:15px;   
    } 
</style>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"> 

function rate(obj,oEvent){ 
//================== 
// 图片地址设置 
//================== 
var imgSrc = '2.png'; 
var imgSrc_2 = '1.png'; 
//--------------------------------------------------------------------------- 
if(obj.rateFlag) return; 
var e = oEvent || window.event; 
var target = e.target || e.srcElement;  
var imgArray = obj.getElementsByTagName("img"); 
for(var i=0;i<imgArray.length;i++){ 
   imgArray[i]._num = i; 
   imgArray[i].onclick=function(){
	 
    if(obj.rateFlag) return; 
    obj.rateFlag=true; 
    if(<%=userid%>==null){
    	alert("请先登录");
    }
    var star=this._num+1;
    var rank=<%= link%>;
    
	$.ajax({
		type:"post",
		url:"update_star.jsp",
		
		data:{"star":star,"rank": rank},
		
		success:function(data){
			
			$("#star").html(data);
		
		}
	});
   }; 
} 

if(target.tagName=="IMG"){ 
   for(var j=0;j<imgArray.length;j++){ 
    if(j<=target._num){ 
     imgArray[j].src=imgSrc_2; 
    } else { 
     imgArray[j].src=imgSrc; 
    } 
   } 
} else { 
   for(var k=0;k<imgArray.length;k++){ 
    imgArray[k].src=imgSrc; 
   } 
} 

  
   


} 
</script> 
<body>
<%!String rank, name, picturelink, director1,director2, type1, type2,type3,type4,type5,country, year, time, summary,movierole1,movierole2,movierole3,movierole4,average_star,comment_num,watcher_num,content_tag1,content_tag2,content_tag3,content_tag4,content_tag5,content_tag6,content_tag7,content_tag8; %>
<%!String userid,link; %>
<%!String content1,content2, content3, content4, content5, content6, content7, content8;  %>
<%
ResultSet rs=null;
link=request.getParameter("id");
userid=request.getParameter("userid");
Dbdao douban=new Dbdao();
rs=douban.querymovies(link);
while(rs.next())
{
	String data="";
	rank=rs.getString(1);
	name=rs.getString(2);
	picturelink="image/"+rs.getString(3);
	summary=rs.getString(4);
	
	country=rs.getString(5);
	year=rs.getString(6);
	time=rs.getString(7);
	type1=rs.getString(8);
	type2=rs.getString(9);
	type3=rs.getString(10);
	type4=rs.getString(11);
	type5=rs.getString(12);
	director1=rs.getString(13);
	director2=rs.getString(14);
	movierole1=rs.getString(15);
	movierole2=rs.getString(16);
	movierole3=rs.getString(17);
	movierole4=rs.getString(18);
	average_star=rs.getString(19);
	comment_num=rs.getString(20);
	watcher_num=rs.getString(21);
	content_tag1=rs.getString(22);
	content_tag2=rs.getString(23);
	content_tag3=rs.getString(24);
	content_tag4=rs.getString(25);
	content_tag5=rs.getString(26);
	content_tag6=rs.getString(27);
	content_tag7=rs.getString(28);
	content_tag8=rs.getString(29);
	content1=content_tag1.split(",")[0];
	content2=content_tag2.split(",")[0];
	content3=content_tag3.split(",")[0];
	content4=content_tag4.split(",")[0];
	content5=content_tag5.split(",")[0];
	content6=content_tag6.split(",")[0];
	content7=content_tag7.split(",")[0];
	content8=content_tag8.split(",")[0];
}
%>
 <%! String id,username,src; %>  
<%
    id=request.getParameter("userid");
	Dbdao db=new Dbdao();
	ResultSet rs2=db.querytoshow(id);
	while(rs2.next())
	{
	 username=rs2.getString(5);
	}
	if(userid==null)
	{
		src="login.jsp";
		username="登录/注册";
		
	}else{
		src="self.jsp";	
	}
%>       
       
<%! String num=null; %>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
function f()
{
if(<%=userid%>==null){
 alert("请先登录");
}
else{
 
 <%
  
  Dbdao douban1=new Dbdao();
  douban1.updatewatcher_num(link, userid);
  ResultSet rs1= douban.querymovies(link);
  
  while (rs1.next())
  {
   num= rs1.getString("watcher_num");
   
  }
  
  %>
  var number=<%=num%>;
 
  $("#like").html(number);
  
}
 
 }

function f2()
{
if(<%=userid %>==null){
 alert("请先登录");
}
else{	
		var link=<%=link%>;
		var num=1;
		$.ajax({
		type:"post",
		
		url:"update_target.jsp",
		
		data:{"link":link,"num":num},
		
		success:function(data){
		
		var newdata=<%=content1%>+data;
		
		$("#001").html(newdata);
		
	}
});
}
location.reload();
 }
function f3()
{
if(<%=userid %>==null){
 alert("请先登录");
}
else{	
		var link=<%=link%>;
		var num=2;
		$.ajax({
		type:"post",
		
		url:"update_target.jsp",
		
		data:{"link":link,"num":num},
		
		success:function(data){
		
		var newdata=<%=content2%>+data;
		
		$("#002").html(newdata);
		
	}
});
}
location.reload();
 }
function f4()
{
if(<%=userid %>==null){
 alert("请先登录");
}
else{	
		var link=<%=link%>;
		var num=3;
		$.ajax({
		type:"post",
		
		url:"update_target.jsp",
		
		data:{"link":link,"num":num},
		
		success:function(data){
		
		var newdata=<%=content3%>+data;
		
		$("#003").html(newdata);
		
	}
});
}
location.reload();
 }
function f5()
{
if(<%=userid %>==null){
 alert("请先登录");
}
else{	
		var link=<%=link%>;
		var num=4;
		$.ajax({
		type:"post",
		
		url:"update_target.jsp",
		
		data:{"link":link,"num":num},
		
		success:function(data){
		
		var newdata=<%=content4%>+data;
		
		$("#004").html(newdata);
		
	}
});
}
location.reload();
 }
function f6()
{
if(<%=userid %>==null){
 alert("请先登录");
}
else{	
		var link=<%=link%>;
		var num=5;
		$.ajax({
		type:"post",
		
		url:"update_target.jsp",
		
		data:{"link":link,"num":num},
		
		success:function(data){
		
		var newdata=<%=content5%>+data;
		
		$("#005").html(newdata);
		
	}
});
}
location.reload();
 }
function f7()
{
if(<%=userid %>==null){
 alert("请先登录");
}
else{	
		var link=<%=link%>;
		var num=6;
		$.ajax({
		type:"post",
		
		url:"update_target.jsp",
		
		data:{"link":link,"num":num},
		
		success:function(data){
		
		var newdata=<%=content6%>+data;
		
		$("#006").html(newdata);
		
	}
});
}
location.reload();
 }
function f8()
{
if(<%=userid %>==null){
 alert("请先登录");
}
else{	
		var link=<%=link%>;
		var num=7;
		$.ajax({
		type:"post",
		
		url:"update_target.jsp",
		
		data:{"link":link,"num":num},
		
		success:function(data){
		
		var newdata=<%=content7%>+data;
		
		$("#007").html(newdata);
		
	}
});
}
location.reload();
 }
function f9()
{
if(<%=userid %>==null){
 alert("请先登录");
}
else{	
		var link=<%=link%>;
		var num=8;
		$.ajax({
		type:"post",
		
		url:"update_target.jsp",
		
		data:{"link":link,"num":num},
		
		success:function(data){
		
		var newdata=<%=content8%>+data;
		
		$("#008").html(newdata);
		
	}
});
}
location.reload();
 }
</script>
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
          <li><a href="index.html">主页</a></li>
          <li><a href="examples.html">分类</a></li>
          <li><a href=<%=src %>><%=username %></a></li>
          
        </ul>
      </nav>
    </header>
</div>
    <div id="haibao">
      <img id ="pic" src=<%=picturelink%> >
      <div>
           <%-- <p>影名：${data.moviename}</p >
           <p>导演：${data.director1}${data.director2 ? '/' + data.director2 : ''}</p >
           <p>类型：${data.movietype1}${data.movietype2 ? '/' + data.movietype2 : ''}${data.movietype3 ? '/' + data.movietype3 : ''} ${data.movietype4 ? '/' + data.movietype4 : ''} ${data.movietype5 ? '/' + data.movietype5 : ''}</p >
           <p>制片国家/地区：${data.countryordistrict}</p >
           <p>上映年份：${data.movieyear}</p >
           <p>片长：${data.movietime}</p > --%>
           <p>影名：<%=name%></p >
           <p>制片国家/地区：<%=country%></p >
           <p>类型：<%=type1%>&nbsp<%=type2%>&nbsp<%=type3%>&nbsp<%=type4%>&nbsp<%=type5%></p >
           <p>导演：<%=director1%>&nbsp<%=director2%></p >
           <p>演员：<%=movierole1%>&nbsp<%=movierole2%>&nbsp<%=movierole3%>&nbsp<%=movierole4%>&nbsp </p >
           <p>上映年份：<%=year%></p >
           <p>片长：<%=time%></p >
           <div id ="littleheart"><a><img style="width: 30px;height: 30px;" src="3.png" onclick="f()" /></a>
           <span></span>
           <p id="like" /><%=watcher_num %>
           <br>
           <p class="starWrapper" onmouseover="rate(this,event)"> 
           <img src="1.png" title="很烂" /><img src="1.png" title="一般" /><img src="1.png" title="还好" /><img src="1.png" title="较好" /><img src="1.png" title="很好" />
           </p>
           </div>
           <p id="star"></p> 
           
    </div>
      </div>
    
    <div style="height:100px;"></div>

    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

    <link rel="stylesheet" href="Bubble.css">
    <script type="text/javascript" src="Bubble.js"></script>

    <script src="/demos/googlegg.js"></script>

<div class="wrapper">
    <div class="tagcloud">
      <!-- bo大小 co颜色 -->
      <a class="b01 co01" href="#" onclick="f2()" id="001"><%=content_tag1%></a>
      <a class="b02 co02" href="#" onclick="f3()" id="002"><%=content_tag2%></a>
      <a class="b03 co05" href="#" onclick="f4()" id="003"><%=content_tag3%></a>
      <a class="b04 co02" href="#" onclick="f5()" id="004"><%=content_tag4%></a>
      <a class="b03 co05" href="#" onclick="f6()" id="005"><%=content_tag5%></a>
      <a class="b02 co06" href="#" onclick="f7()" id="006"><%=content_tag6%></a>
      <a class="b03 co07" href="#" onclick="f8()" id="007"><%=content_tag7%></a>
      <a class="b04 co01" href="#" onclick="f9()" id="008"><%=content_tag8%></a>
      
      
    </div>
</div><!--wrapper-->

<script type="text/javascript">
    /*3D标签云*/
    tagcloud({
        selector: ".tagcloud",  //元素选择器
        fontsize: 16,       //基本字体大小, 单位px
        radius: 140,         //滚动半径, 单位px 页面宽度和高度的五分之一
        mspeed: "slow",   //滚动最大速度, 取值: slow, normal(默认), fast
        ispeed: "slow",   //滚动初速度, 取值: slow, normal(默认), fast
        direction: 135,     //初始滚动方向, 取值角度(顺时针360): 0对应top, 90对应left, 135对应right-bottom(默认)...
        keep: false          //鼠标移出组件后是否继续随鼠标滚动, 取值: false, true(默认) 对应 减速至初速度滚动, 随鼠标滚动
    });
</script>
    <div style="text-align:center;margin:100px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#ffffff">
    </div>
</body>

</html>