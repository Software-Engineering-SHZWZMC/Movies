<%@page import="java.awt.print.Printable"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*,dao.*"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>分类</title>
<link href="fenlei01.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

</head>
<body>
	<!--顶部样式
<div style=" width:100px;height:100px;background:yellow ;float:right;padding-top:200px;position:absolute;">5545</div>-->
	<div class="index" style="position: relative;">
		<div style="float: left; display: flex; flex-direction: row;">


			<div style="width: 50px; float: left">
				<a href="index.html" target="blank">首页</a>
			</div>
			<div style="width: 50px; float: left">
				<a href="index.html" target="blank">分类</a>
			</div>



		</div>
		<div
			style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
			<image src="../img/2.jpg" name="图标" width=100px height=100px></image>
		</div>
		<div style="width: 100px; float: right;">
			<a href="login.jsp" target="blank">登录/注册</a>
		</div>

	</div>
	<div class="clear"></div>
<%!String name="test";
String picture="image/1.jpg";


%>

	<div class="body-contain">
		<div id="all-list"
			style="float: left; display: flex; flex-direction: row;">
			<div class="flow-loader" style="position: relative;">

				<!--分类框-->
				<div class="filter-wrap">
					 <ul class="select">
					 <li class="select-list">
						 <dl id="select1">
							<dt>类型：</dt>
							<dd class="select-all selected">
								<a href="#">全部</a>
							</dd>
							<dd>
								<a href="#">剧情</a>
							</dd>
							<dd>
								<a href="#">喜剧</a>
							</dd>
							<dd>
								<a href="#">动作</a>
							</dd>
							<dd>
								<a href="#">爱情</a>
							</dd>
							<dd>
								<a href="#">科幻</a>
							</dd>
							<dd>
								<a href="#">动画</a>
							</dd>
							<dd>
								<a href="#">悬疑</a>
							</dd>
							<dd>
								<a href="#">惊悚</a>
							</dd>
							<dd>
								<a href="#">历史</a>
							</dd>
							<dd>
								<a href="#">战争</a>
							</dd>
							<dd>
								<a href="#">灾难</a>
							</dd>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select2">
							<dt>年代：</dt>
							<dd class="select-all selected">
								<a href="#">全部</a>
							</dd>
							<dd>
								<a href="#">2020</a>
							</dd>
							<dd>
								<a href="#">2019</a>
							</dd>
							<dd>
								<a href="#">2018</a>
							</dd>
							<dd>
								<a href="#">2017</a>
							</dd>
							<dd>
								<a href="#">2016</a>
							</dd>
							<dd>
								<a href="#">2015</a>
							</dd>
							<dd>
								<a href="#">2014</a>
							</dd>
							<dd>
								<a href="#">2013</a>
							</dd>
							<dd>
								<a href="#">2012</a>
							</dd>
							<dd>
								<a href="#">2011</a>
							</dd>
							<dd>
								<a href="#">2010</a>
							</dd>
							<dd>
								<a href="#">00年代</a>
							</dd>
							<dd>
								<a href="#">90年代</a>
							</dd>
							<dd>
								<a href="#">80年代</a>
							</dd>
							<dd>
								<a href="?year=70年代">70年代</a>
							</dd>
							<dd>
								<a href="#">60年代</a>
							</dd>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select3">
							<dt>地区：</dt>
							<dd class="select-all selected">
								<a href="#">全部</a>
							</dd>
							<dd>
								<a href="#">美国</a>
							</dd>
							<dd>
								<a href="#">英国</a>
							</dd>
							<dd>
								<a href="#">法国</a>
							</dd>
							<dd>
								<a href="#">中国大陆</a>
							</dd>
							<dd>
								<a href="#">中国台湾</a>
							</dd>
							<dd>
								<a href="#country=中国香港">中国香港</a>
							</dd>
							<dd>
								<a href="#">日本</a>
							</dd>
							<dd>
								<a href="#">韩国</a>
							</dd>
							<dd>
								<a href="#">德国</a>
							</dd>
							<dd>
								<a href="#">南非</a>
							</dd>
							<dd>
								<a href="#">印度</a>
							</dd>
							<dd>
								<a href="#">泰国</a>
							</dd>
							<dd>
								<a href="#">其他</a>
							</dd>
						</dl>
					</li>
					<li class="select-result">
						<dl>
							<dt>已选条件：</dt>
							<dd class="select-no">暂时没有选择过滤条件</dd>
							<input type="button" style="width: 70px"onclick="screen()" value="确认选择"> </input>
						</dl>
	
					</li>
					
				</ul>
				<div style="text-align: center; clear: both"></div>
			</div>
				<div class="mixin-list">
					<!---->
					<!---->
					<!---->
					<!---->
					<!---->
					<!---->
					<!---->
					<!---->
					<ul class="video-list clearfix" type="video">
						<li >
						<text id="name1"><%=name%></text>
						<img id="picture1" src=<%=picture %>>
						</li>


					</ul>
						<!---->
					</div>
				</div>
				<div class="flow-loader-state" style="text-align: center;">
					<!---->
				</div>
				<div class="flow-loader-detect"
					style="position: absolute; bottom: 0px; right: 0px; width: 100%; height: 50px; z-index: -1; background: transparent;"></div>
			</div>
			<div class="video-info-module" style="display: none;">
				<div class="v-title"></div>
				<div class="v-info">
					<span class="name"></span><span class="line"></span><span
						class="time"></span>
				</div>
				<div class="v-preview clearfix">
					<div class="lazy-img">
						<img alt="" src="">
					</div>
					<p class="txt"></p>
				</div>
				<div class="v-data">
					<span class="play"><i class="icon"></i>--</span><span class="danmu"><i
						class="icon"></i>--</span><span class="star"><i class="icon"></i>--</span><span
						class="coin"><i class="icon"></i>--</span>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	
	$("#select1 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			
			$("#selectA").remove();
			
		} else {
			
			var copyThisA = $(this).clone();
			
			if ($("#selectA").length > 0) {
				$("#selectA a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisA.attr("id", "selectA"));
			}
			
		}
		
	});
	
	$("#select2 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			var copyThisB = $(this).clone();
			if ($("#selectB").length > 0) {
				$("#selectB a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisB.attr("id", "selectB"));
			}
		}
	});
	
	$("#select3 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectC").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectC").length > 0) {
				$("#selectC a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectC"));
			}
		}

	});
	
	$("#selectA").live("click", function () {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$("#selectB").live("click", function () {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$("#selectC").live("click", function () {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$(".select dd").live("click", function () {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	

function screen(){
	var term1=$("#selectA a").text();
	var term2=$("#selectB a").text();
	var term3=$("#selectC a").text();
	var term=term1+"@"+term2+"@"+term3+"@";
	location.replace(location.href+?term)
// 	$.ajax({
//     		type:"post",
//     		url:"screen.jsp",
//     		data:{"term":term},
//     		alert(data),
//     		success:function(data){
//     			var rank=data.split("@")[0];
//     			var name=data.split("@")[1];
//     			var picture=data.split("@")[2];
//     			alert(newdata);
//     			$("#name1").html(name);
//     			$("#picture1").html(picture);
//     		}
//     	});
	
}
</script>
</body>
</html>
