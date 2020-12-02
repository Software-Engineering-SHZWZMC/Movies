<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"
%>


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
                out.print("数据库连接成功！");  
                out.print("<br />");            
                Statement stmt = null;  
                String sql = "SELECT * FROM movies";  //查询语句
                stmt = conn.createStatement();  
                ResultSet rs = stmt.executeQuery(sql);  
                out.print("查询结果：");  
                out.print("<br />");  
                out.println("排名"+"  "+"名字 "+"  "+"图片");  
                out.print("<br />");  
               	
                int i=0;
                while(rs.next()) 
                { 
                	
              		picturelink=rs.getString(2);
                	out.println();
                	
                	allmovielink[i]=picturelink;
                	 
                	i++;
                	
            	}
                

            }
            else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            out.print(e);  
        } 
	for (int i=0;i<8;i++)
	{
		int r;
		r=(int)(Math.random() * 250);
		passlink[i]=allmovielink[r];
	}
 		
%>

</body>
</html>