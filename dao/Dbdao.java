package dao;

import java.sql.*;
import java.util.regex.Pattern;


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

	
//用户相关
	/**
	 * @param id
	 * @param logpassword
	 * @return int 账户密码是否正确，返回负1，账号不存在，返回1成功登录，返回0，账号正确密码错误。
	 * @throws SQLException
	 */
	public int query(String id,String logpassword) throws SQLException  //
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
	/**
	 * 
	 * @param id
	 * @return resultset，返回查询结果集，包含了用户的所有信息。
	 * @throws SQLException
	 * 该函数需要在登录成功之后调用。
	 */
	public ResultSet querytoshow(String id)throws SQLException
	{
		Statement stmt = null;  
		try {
			stmt=con.createStatement();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		ResultSet rs = null;
		rs=stmt.executeQuery("select * from users where id='"+id+"' ");
		return rs;
	}
	/**
	 * @param id
	 * @param password
	 * @param refill
	 * @return 返回注册是否成功，返回0，id不是10位数字，返回1，id已经存在，返回2，注册成功，返回3，两次输入密码不一致。
	 */
	public int registered(String id,String password,String refill) {
		Statement stmt=null;
		int result = 0;
		ResultSet rs=null;
		try {
			stmt = con.createStatement();
			rs=stmt.executeQuery("select * from users where id='"+id+"'");
			if (!id.matches("\\d{10}")) {
				return result;
			}
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
	/**
	 * @param term
	 * @return 返回查询电影的rank，名字，链接，国家地区（搜索页面使用)
	 */
	public ResultSet searchmovies(String term) {
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery("select rank,moviename,picturelink,countryordistrict from movies where moviename like '%"+term+"%'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	/**
	 * @param country
	 * @param year
	 * @param type
	 * @return 返回筛选结果，结果包括电影rank,名字，图片链接
	 * @throws SQLException 
	 */
	public ResultSet screen(String country,String year,String type) throws SQLException {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		String term1 = null,term2,term3,term4,term5,term6,term7;
		
		String sql="select rank,moviename,picturelink from movies where countryordistrict like ? and movieyear like ? and movietype1=? or movietype2=?"
				+ "or movietype3=? or movietype4=? or movietype5=?";
		stmt=con.prepareStatement(sql);
		if(country.equals("all"))
		{
			term1="%%";
		}
		else {
			term1="'%"+country+"%'";
		}
		stmt.setString(1, term1);
		if(year.equals("all"))
		{
			term2="%%";
		}
		
		else if (year.equals("00年代")) 
		{
			term2="'"+200+"%'";
		}
		else if (year.contains("年代"))
		{
			year="19"+year.charAt(0);
			term2="'"+year+"%'";
		}
		else
		{
			term2="'"+year+"'";
		}
		if(type.equals("all"))
		{
			term3=term4=term5=term6=term7="%%";
		}
		else {
			term3=term4=term5=term6=term7="'%"+type+"%'";
		}
		try {
			stmt.setString(1, term1);
			stmt.setString(2, term2);
			stmt.setString(3, term3);
			stmt.setString(4, term4);
			stmt.setString(5, term5);
			stmt.setString(6, term6);
			stmt.setString(7, term7);
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rs;
	}

}
