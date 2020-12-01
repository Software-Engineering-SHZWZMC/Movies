<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page import="java.sql.*"%> 
 

<title>JSP按条件查询数据</title>

    <meta>

 
<%
request.setCharacterEncoding("utf-8");
String order = request.getParameter("order");
String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
String url="jdbc:sqlserver://127.0.0.1:1433;instanceName=MSSQLSERVER08;DatabaseName=web"; 
String username="sa"; 
String password="123";
String sql="";
Connection dbConn;

Class.forName(driverName);
dbConn= DriverManager.getConnection(url,username,password); 
Statement stmt=dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
if(null!=order && !"".equals(order)){
    sql="select * from test1 where " + order;
}else{
    sql="select * from test1";
}
ResultSet rs=stmt.executeQuery(sql); 
%> 

    <div id="menu" style="width: 100%;height:40px;">
    
     <form>
        
      <input type="text" name="order"> 
        
      <input type="submit" value="查询">
    
     </form>

    </div>

    <hr>

    <table border="1"><tbody><tr><td width="100px">id</td><td width="200px">城市</td><td width="200px">经度</td><td width="200px">纬度</td><td width="150px">数值</td></tr></tbody></table>
    <%
    while(rs.next()){
    %>
        
      <table><tbody><tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td></tr></tbody></table>
    <%
    }
    %>
   
     
    
<%
rs.close(); 
stmt.close(); 
dbConn.close(); 
