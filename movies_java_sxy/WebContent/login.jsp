<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

  <head>

    <title>login.jsp页面</title>

  </head>

  <body align="center">

    <form action="loginCl.jsp" method="post" name=form >

     <font size="5">登录界面</font><br>

     用户名：<input type="text" value=""name="name"><br>

     密    码：<input type="password"value="" name="password"><br>

     <input type="submit"value="提交"name="submit">

     <input type="reset"value="重置">   

    </form>



  </body>

</html>