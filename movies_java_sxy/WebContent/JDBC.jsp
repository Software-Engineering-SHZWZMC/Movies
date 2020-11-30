<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<html>
<head>
<title>通过JSP打开数据表</title>
</head>
<body>

 <%  
        try {  
            Class.forName("com.mysql.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/test"; //数据库名
            String username = "root";  //数据库用户名
            String password = "sxy000217";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

            if(conn != null){  
                out.print("数据库连接成功！");  
                out.print("<br />");            
                Statement stmt = null;  
                ResultSet rs = null;  
                String sql = "SELECT *FROM websites;";  //查询语句
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql);  
                out.print("查询结果：");  
                out.print("<br />");  
                out.println("姓名"+"  "+"性别 "+"  "+"年龄");  
                out.print("<br />");  
                while (rs.next()) {  
                 out.println(rs.getInt(1)+rs.getString(2)); //将查询结果输出  
            }  
            }
            else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            out.print(e);  
        }  
%>   
</body>
</html>