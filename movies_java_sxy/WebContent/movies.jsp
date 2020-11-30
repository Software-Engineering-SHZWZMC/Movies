<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>


<%!
	
int rank;
	
String picturelink;
String moviename;
String moviesummary;
String countryordistrict;
String movieyear;
String movietime;
String movietype1;
String movietype2;
String movietype3;
String movietype4;
String movietype5;
String director1;
String director2;
String movierole1;
String movierole2;
String movierole3;
String movierole4;
String average_star;;
String comment_num;
String watcher_num;
String content_tag1;
String content_tag2;
String content_tag3;
String content_tag4;
String content_tag5;
String content_tag6;
String content_tag7;
String content_tag8;
%>


%>

<%  
        try {  
            Class.forName("com.mysql.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/douban?useSSL=false"; //数据库名
            String username = "root";  //数据库用户名
            String password = "sxy000217";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
//             movies allmovie[]=new movies[250];
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
                	
	               	
	               	rank=rs.getInt(1);
              		picturelink=rs.getString(2);
                	moviename=rs.getString(3);
                	moviesummary=rs.getString(4);
                	countryordistrict=rs.getString(5);
                	movieyear=rs.getString(6);
                	movietime=rs.getString(7);
                	movietype1=rs.getString(8);
                	movietype2=rs.getString(9);
                	movietype3=rs.getString(10);
                	movietype4=rs.getString(11);
                	movietype5=rs.getString(12);
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
                	out.print(rank+moviename+picturelink);
                	out.println();
                	i++;
                	
            	}  
//                 for (int j=0;j<20;j++)
//          		{
//          			out.print(allmovie[j]);
//          		}
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