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
</head>

<body>
<%!String rank, name, picturelink, director1,director2, type1, type2,type3,type4,type5,country, year, time, summary,movierole1,movierole2,movierole3,movierole4,average_star,comment_num,watcher_num,content_tag1,content_tag2,content_tag3,content_tag4,content_tag5,content_tag6,content_tag7,content_tag8; %>

<%
ResultSet rs=null;
String link=request.getParameter("id");
out.print(link);
Dbdao douban=new Dbdao();
rs=douban.querymovies(link);
while(rs.next())
{
	String data="";
	rank=rs.getString(1);
	name=rs.getString(2);
	picturelink=rs.getString(3);
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
// 	data+="rank:"+rs.getString(1)+"@";
// 	data+="name:"+rs.getString(2)+"@";
// 	data+="picturelink:"+rs.getString(3)+"@";
// 	data+="director:"+rs.getString(13)+"@";
// 	data+="type:"+rs.getString(8)+"@";
// 	data+="country:"+rs.getString(5)+"@";
// 	data+="year:"+rs.getString(6)+"@";
// 	data+="time:"+rs.getString(7)+"@";
// 	data+="summary:"+rs.getString(4)+"@";
// 	rank=data.split("@")[0].split(":")[1];
// 	name=data.split("@")[1].split(":")[1];
// 	picturelink="image/"+data.split("@")[2].split(":")[1];
// 	director=data.split("@")[3].split(":")[1];
// 	type=data.split("@")[4].split(":")[1];
// 	country=data.split("@")[5].split(":")[1];
// 	year=data.split("@")[6].split(":")[1];
// 	time=data.split("@")[7].split(":")[1];
// 	summary=data.split("@")[8].split(":")[1];
	
/* 	out.println(rank);
	
	out.println(name);
	out.println(picturelink);
	out.println(country);
	out.print("---------------"); */
	
}
%>
  <div class="top">
    <!-- <div>首页</div> -->
    <button type="submit">首页</button>
    <!--     <div>分类</div> -->
    <button type="submit">分类</button>
    <div>Logo</div>
    <!--     <div>消息</div> -->
    <button type="submit">消息</button>
    <!--     <div>收藏</div> -->
    <button type="submit">收藏</button>
  </div>
  <div class="content">
    <div class="haibao">
      <div><img src=<%=picturelink %>></div>
      <div>
           <%-- <p>影名：${data.moviename}</p>
           <p>导演：${data.director1}${data.director2 ? '/' + data.director2 : ''}</p>
           <p>类型：${data.movietype1}${data.movietype2 ? '/' + data.movietype2 : ''}${data.movietype3 ? '/' + data.movietype3 : ''} ${data.movietype4 ? '/' + data.movietype4 : ''} ${data.movietype5 ? '/' + data.movietype5 : ''}</p>
           <p>制片国家/地区：${data.countryordistrict}</p>
           <p>上映年份：${data.movieyear}</p>
           <p>片长：${data.movietime}</p> --%>
           <p>影名：<%=name%></p>
           <p>导演：<%=director1%></p>
           <p>类型：<%=type1%></p>
           <p>制片国家/地区：<%=country%></p>
           <p>上映年份：<%=year%></p>
           <p>片长：<%=time%></p>
      </div>
    </div>
    
    <div style="height:100px;"></div>

    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

    <link rel="stylesheet" href="Bubble.css">
    <script type="text/javascript" src="Bubble.js"></script>

    <div class="wrapper">
      <div class="tagcloud">
        <!-- bo大小 co颜色 -->
      </div>
    </div>
    <!--wrapper-->
    <script>
      setLabels();
      setMovie();

      tagcloud({
        selector: ".tagcloud",  //元素选择器
        fontsize: 16,       //基本字体大小, 单位px
        radius: 140,         //滚动半径, 单位px 页面宽度和高度的五分之一
        mspeed: "slow",   //滚动最大速度, 取值: slow, normal(默认), fast
        ispeed: "slow",   //滚动初速度, 取值: slow, normal(默认), fast
        direction: 135,     //初始滚动方向, 取值角度(顺时针360): 0对应top, 90对应left, 135对应right-bottom(默认)...
        keep: false          //鼠标移出组件后是否继续随鼠标滚动, 取值: false, true(默认) 对应 减速至初速度滚动, 随鼠标滚动
      });

//       function setLabels() {
//         $.ajax({
//           url: './label.json',
//           type: 'get',
//           async: false,
//           dataType: "json",
//           success: (res) => {
//             const containerElement = document.getElementsByClassName('tagcloud')[0];

//             Object.keys(res).forEach((key, index) => {
//               const a = document.createElement('a');
//               a.innerText = res[key];
//               a.href = '#';
//               a.classList = `b0${index % 5} co0${index}`;
//               containerElement.appendChild(a);
//             })
//           }
//         })
//       }
/* 
      function setMovie() {
        $.ajax({
          url: './data.json',
          type: 'get',
          async: false,
          dataType: "json",
          success:  (data) => {
            var haibaoHtml = `
              <div><img src="123.jpg"alt=""></div>
              <div>
                    <p>影名：${data.moviename}<span>点评</span></p>
                    <p>导演：${data.director1}${data.director2 ? '/' + data.director2 : ''}</p>
                    <p>类型：${data.movietype1}${data.movietype2 ? '/' + data.movietype2 : ''}${data.movietype3 ? '/' + data.movietype3 : ''} ${data.movietype4 ? '/' + data.movietype4 : ''} ${data.movietype5 ? '/' + data.movietype5 : ''}</p>
                    <p>制片国家/地区：${data.countryordistrict}</p>
                    <p>上映年份：${data.movieyear}</p>
                    <p>片长：${data.movietime}</p>
              </div>
              <div class="introduct">
              剧情介绍：${data.moviesummary}
              </div>
            `
            $(".haibao").html(haibaoHtml)
            $(".introductHtml").html(`${data.moviesummary}`)
          }
        })
      } */

    </script>
    <div style="text-align:center;margin:100px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#ffffff">
    </div>
</body>

</html>