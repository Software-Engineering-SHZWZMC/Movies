package dao;

import java.sql.*;

public class Dbdao {
	
	private Connection con=null;
	public  Dbdao() 
	{
		String url = "jdbc:mysql://localhost:3306/douban"; 
		String username = "root";  
		String password = "sxy000217";  
		
		try {
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection(url, username, password);
		}
		
		catch(SQLException se)
	    {
	        se.printStackTrace();
	    }
	    catch(Exception e)
	    {
	        // 处理 Class.forName 错误
	        e.printStackTrace();
	    }
	}
//	 public static void main(String[] args){
//	    Dbdao douban=new Dbdao();
//	    System.out.print("success");
//	   }
	public int query(String id,String logpassword) throws SQLException
	{
		
		int result=0;
		Statement stmt = null;  
		try {
			stmt=con.createStatement();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		ResultSet rs = null;
		rs=stmt.executeQuery("select * from users where id='"+id+"' ");
		if(rs.next())
		{	
			rs=stmt.executeQuery("select * from users where id='"+id+"' and password='"+logpassword+"' ");
			if(rs.next()){
					result=1;      
				}else{
					result= 0;
				}
			}else{
				result=-1;
				}
		rs.close();
		stmt.close();
		return result;
		
	}
	public int registered(String id,String password,String refill) {
		Statement stmt=null;
		int result = 0;
		ResultSet rs=null;
		try {
			stmt = con.createStatement();
			rs=stmt.executeQuery("select * from users where id='"+id+"'");
			if(rs.next())
			{
				result=1;//the id already exists
			}
			else{
				if(password.equals(refill)){
	 				stmt.executeUpdate("insert into users(id,password) values('"+id+"','"+ password + "');");
	 				result=2;
				}
				else {
					result=3;
				}
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return result;
	}
	public ResultSet search(String term) {
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery("select rank,moviename,picturelink,countryordistrict from movies where moviename like '"+term+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet screen(String country,String year,String type) {
		Statement stmt=null;
		ResultSet rs=null;
		String term1=null;
		String term2=null;
		String term3=null;
		String sql="select rank,moviename,picturelink from movies";
		if(!country.equals("all"))
		{
			sql+="where country='"+country+"'";
		}
		if(!country.equals("all"))
		{
			sql+="where country='"+country+"'";
		}
		if(!country.equals("all"))
		{
			sql+="where country='"+country+"'";
		}
		return rs;
	}

}
