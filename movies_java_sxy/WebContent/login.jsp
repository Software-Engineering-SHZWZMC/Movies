<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String background;
int ranl=(int)(Math.random()*166);
background="background/hkp"+ranl+".jpg";

%>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/iconfont.css"/>
        <title>登陆</title>
    </head>
    <body background=<%=background %>>
    <form action="loginCl.jsp" method="post" name=form >
	<ul id="menu">
    
        <li><a href="index.jsp">首页</a></li>
        <li><a href="#">关于</a></li>
    </ul>
    <div id="bigBox">
            <h1>用户登录</h1>
            
            <div class="inputBox">
                <div class="inputText">
                    <span class="iconfont icon-user"></span>
                    <input type="text" placeholder="请输入用户名" value=""name="name">
                </div>
                <div class="inputText">
                    <span class="iconfont icon-mima"></span>
                    <input type="password" placeholder="请输入密码" value="" name="password">   
                </div>
                <input type="submit" class="inputButton" value="登录" />
                <input type="button" class="inputButton" value="注册" onclick="window.location.href='registered.jsp'"/>
            </div>
     </div>
     </form>
     
        
    </body>
</html>