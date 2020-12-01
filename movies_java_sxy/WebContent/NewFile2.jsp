<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>  
        <title>  
            getHref.jsp file  
        </title>  
    </head>  
  
    <body style="background-color:lightblue">  
        <%  
            String link=request.getParameter("link1");  
  			
            out.print("name:"+link);  
        %>  
        <br/>  
       
    </body>  
</html>  