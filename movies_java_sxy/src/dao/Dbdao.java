package dao;

import java.sql.*;
import java.util.regex.Pattern;


public class Dbdao {
	
	private Connection con=null;
	public  Dbdao() 
	{
		String url = "jdbc:mysql://localhost:3306/douban?useSSL=false"; 
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
	 * @return resultset，返回查询结果集，包含了用户的所有信息，其中@是watched_film的分隔符。
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
	public int registered(String id,String password,String refill,String tel) {
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
	 				stmt.executeUpdate("insert into users(id,password,tel) values('"+id+"','"+ password + "','"+tel+"');");
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
	 * @param rank
	 * @return resultset
	 * 返回了rank电影的所有信息。
	 */
	public ResultSet querymovies(String rank) {
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery("select * from movies where rank='"+rank+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void updateusers(String id,String username,String signature) throws SQLException 
	{
		Statement stmt=null;
		stmt=con.createStatement();
		String sql="update users set netname='"+username+"' where ID='"+id+"'";
		stmt.execute(sql);
		String sql2="update users set signature='"+signature+"' where ID='"+id+"'";
		stmt.execute(sql2);
	
	}
	/**
	 * @param rank
	 * @param userid
	 * 给看过该电影的人数加一，同时用户观看过的电影增加该电影
	 * @throws SQLException 
	 */
	public void updatewatcher_num(String rank,String userid) throws SQLException
	{
		Statement stmt=null;
		stmt=con.createStatement();
		String sql="update movies set watcher_num=watcher_num+1 where rank='"+rank+"'";
		stmt.execute(sql);
		Statement stmt2=null;
		stmt2=con.createStatement();
		ResultSet rs=this.querymovies(rank);
		String moviename="";
		while (rs.next()) {
			moviename=rs.getString(2);
			
		}
		ResultSet rs2=this.querytoshow(userid);
		String watched_film="";
		while (rs2.next()) {
			watched_film=rs2.getString(7);
		}
		if (!watched_film.contains(moviename)) 
		{
			String newwatched_film=watched_film+moviename+"@";//用@作为分隔符
			String sql2="update users set watched_film='"+newwatched_film+"' where id='"+userid+"'";
			stmt.execute(sql2);
		}
		
		
		
	}
	/**
	 * @param rank
	 * @param userid
	 * 给评价电影的人数加1.
	 * @throws SQLException 
	 */
	public void updatecomment_num(String rank,int tagnumber) throws SQLException
	{
		Statement stmt=null;
		stmt=con.createStatement();
		
		ResultSet rs=this.querymovies(rank);
		String content_tag="";
		while(rs.next())
		{
			content_tag=rs.getString(tagnumber+21);
			
		}
		String newtag = "";
		String content=content_tag.split(",")[0];
		String num = content_tag.split(",")[1];
		String newnum=String.valueOf((Integer.parseInt(num)+1));
		newtag=content+","+newnum;
		String column="content_tag"+tagnumber;
		String sql="update movies set "+column+" ='"+newtag+"' where rank='"+rank+"'";
		stmt.execute(sql);
		
		
	}
	/**
	 * @param rank
	 * @param userid
	 * 更新电影打分。
	 * @throws SQLException 
	 */
	public void updateaverage_star(String rank,String star) throws SQLException
	{
		Statement stmt=null;
		stmt=con.createStatement();
		ResultSet rs=this.querymovies(rank);
		float average_star=0;
		float comment_num=0;
		float newaverage=0;
		String newstar = null;
		while (rs.next()) {
			average_star=Float.parseFloat(rs.getString("average_star"));
			comment_num=Float.parseFloat(rs.getString("comment_num"));
			newaverage=(Float.parseFloat(star)+comment_num*average_star)/(comment_num+1);	
			newstar=Float.toString(newaverage);
		}
		String sql="update movies set comment_num=comment_num+1 where rank='"+rank+"'";
		stmt.execute(sql);
		Statement stmt1=null;
		stmt1=con.createStatement();
		String sql1="update movies set average_star='"+newstar+"' where rank='"+rank+"'";
		stmt1.execute(sql1);
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
	public ResultSet screen(String country,String movieyear,String movietype) throws SQLException {
		Statement stmt=null;
		ResultSet rs=null;
		String term1 = null,term2,term3,term4,term5,term6,term7;
		String sql="select rank,moviename,picturelink from movies where 1=1";
		stmt=con.createStatement();
		if(!country.equals("all"))
		{
			sql+=" and countryordistrict like '%"+country+"%'";
		}
		if (!movietype.equals("all")) 
		{
			sql+=" and (movietype1 like '%"+movietype+"%' or movietype2 like '%"+movietype+"%' or movietype3 like '%"+movietype+"%' or movietype4 like '%"+movietype+"%' or movietype5 like '%"+movietype+"%')";
		}
		if(!movieyear.equals("all"))
		{
			if (movieyear.equals("00年代"))
			{
				String year="200";
				sql+=" and movieyear like '"+year+"%'";
			}
			else if (movieyear.contains("年代"))
			{
				String year="19"+movieyear.charAt(0);
				sql+=" and movieyear like '"+year+"%'";
			}
			else {
				sql+=" and movieyear = '"+movieyear+"'";
			}
			
			
		}
		try {
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	

}
