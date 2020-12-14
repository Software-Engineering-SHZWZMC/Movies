<%@page import="java.sql.ResultSet"%>
<%@page import="dao.Dbdao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylez.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css11/style.css"/>
    <link rel="stylesheet" href="css11/iconfont.css"/>
    <title>Personal Center</title>

</head>

<body>
<%! String userid,username,gexing,sex;%>
<%
   userid=request.getParameter("userid");
   Dbdao db=new Dbdao();
   ResultSet rs=db.querytoshow(userid);
   while(rs.next())
   {
	   username=rs.getString(5);
	   gexing=rs.getString(6);
	   sex=rs.getString(4);
   }
   
%>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
<%! String src1="1.png",newusername,newgexing; %>
function dianji(){
	
	
	<%
	newusername=request.getParameter("name");
	newgexing=request.getParameter("intro");
	if(newusername!=null && newgexing!=null)
	{
		username=newusername;
		gexing=newgexing;
		Dbdao db2=new Dbdao();
	    db2.updateusers(userid, username, gexing);
	}
	
	%> 
	
}
	
		
</script>

    <!-- 这里是个人信息界面 -->
    <div class="box" id="mybox">
        <!-- 这里是你放头像的地方 -->
        <img src=<%=src1 %> id="h_img" >
        <!-- 这里写你的名字 -->
        <h4 >您的个人信息</h4>
        <h1 id="nichen"><%=username %></h1>
        <!-- 这里写你的技能标签 -->
        <h5><%=gexing %></h5>
        <!-- 这里写你的说明(简介) -->
        <p>
           	 太喜欢编程了~ 软工人，软工魂，软工使我快乐┗|｀O′|┛ 嗷~~!
            
        </p>
       
			<div id="nb" onClick="show('sb','nb')" style=" width:33px;cursor:pointer"><b>👇</b></div>
		<div id="sb" style="background:rgba(0, 0, 0, .5);width:100%;height:200px;display:none;">
			<div id="bigBox">
			   <h4>修改个人信息</h4>
			   <form  method="post"  >
			   		<div class="inputText">
                    	<span class="iconfont icon-user"></span>
                    	<input id="nichen1" type="text" placeholder="您的昵称" value="" name="name">
                	
                	
                   		 <span class="iconfont icon-mima"></span>
                    	<input type="text" placeholder="您的个性签名" value="" name="intro">  
                	 </div>
                	 
                	 <input id="c1" type="submit" class="inputButton" name="name" value="提交" onClick=dianji()></input>
                	 <input id="c2" type="button" class="inputButton" name="back" value="退出" onClick="window.location.href='login.jsp'"></input>
               </form> 
             </div>
		</div>
	</div>
			<!--  <form action="#" method="post">
			     <div class="form_settings myhidden" id="d1">
				<p>
					<span>您的昵称</span><input type="text" name="name" value="" />
				</p>
				<p>
					<span>您的个性签名</span><br/>
					<textarea rows="5" cols="70" name="name"></textarea>
				</p>
				<p>您的性别<input type="radio" name="sex" value="男" />男
					<input type="radio" name="sex" value="女" />女
				<p style="padding-top: 15px">
					<input class="submit" type="submit" name="name" value="提交" /> <a
						href="login.jsp"><input class="submit"
						type="button" name="name" value="退出" /></a>
				</p>
			</div>
		</form>
		</div>

       
    </div>
		
		-->
	
	
<script>
function show(num,a)
{
     var box = document.getElementById(num);
     var message = document.getElementById(a);
     if(box.style.display != "block")
     {
     box.style.display = "block";
     message.innerHTML = '👆';
     }
     else
     {
     box.style.display = "none"; 
     message.innerHTML = '👇';
     }
}
</script>   
</body>

</html>
