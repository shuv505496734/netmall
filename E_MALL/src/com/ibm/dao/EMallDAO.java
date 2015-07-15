package com.ibm.dao;

import com.ibm.models.RegModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class EMallDAO 
{
	public static Connection connect()
	{
		Connection con=null;
		try 
		{			
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			con=DriverManager.getConnection("jdbc:db2://75.126.155.153:50000/SQLDB","user05654","XtLz75KZh3vW");
		} 
		
		catch (Exception e) 
		{			
			e.printStackTrace();
		}
		
		return con;
	}	
	
	private static String AutoCid(RegModel obj) 
	{
		Connection con=connect();
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		String status = "fail";
		
		try
		{
			String clrsql = "DELETE FROM IDCOUNTER";
			ps2 = con.prepareStatement(clrsql);
			int x = ps2.executeUpdate();
			
			String insql = "INSERT INTO IDCOUNTER VALUES (tid_seq.NEXTVAL)";
			ps2 = con.prepareStatement(insql);
			x = ps2.executeUpdate();
			
			if(x==1)
			{
				String tidsql = "SELECT * FROM IDCOUNTER";
				ps2 = con.prepareStatement(tidsql);
				rs2 = ps2.executeQuery();
				if(rs2.next())
				obj.setCid("C" + rs2.getString(1));
				status = "success";
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return status;
	}
	
	public static int addData(String sql, RegModel obj)
	{
		Connection con=connect();
		int i=0;
		String res = "fail";
		
		try
		{			
			res = AutoCid(obj);
			if(res == "success")
			{
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, obj.getCid());
				ps.setString(2, obj.getGender());
				ps.setString(3, obj.getFname());
				ps.setString(4, obj.getLname());
				ps.setString(5, obj.getEmail());
				ps.setString(6, obj.getPwd());
				ps.setString(7, obj.getPhone());
				ps.setString(8, obj.getStreet());
				ps.setString(9, obj.getCity());
				ps.setString(10, obj.getState());
				ps.setString(11, obj.getZip());
			
				i = ps.executeUpdate();	
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return i;	
	}
	
	public static ResultSet LoginUser(String sql, RegModel obj)
	{
		ResultSet rs=null;
		Connection con=connect();
		
		try
		{
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, obj.getEmail());
			ps.setString(2, obj.getPwd());
			
			rs = ps.executeQuery();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
				
		return rs; 
	}
	
	public static int UpdateUser(String sql, RegModel obj)
	{
		Connection con=connect();
		int i=0;
		
		try
		{
			PreparedStatement ps=con.prepareStatement(sql);
		
			ps.setString(1, obj.getGender());
			ps.setString(2, obj.getFname());
			ps.setString(3, obj.getLname());
			ps.setString(4, obj.getEmail());
			ps.setString(5, obj.getPhone());
			ps.setString(6, obj.getStreet());
			ps.setString(7, obj.getCity());
			ps.setString(8, obj.getState());
			ps.setString(9, obj.getZip());
			ps.setString(10, obj.getCid());
			
			i = ps.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return i;
	}
	
	public static int UserValidation(String sql1)
	{
		Connection con=connect();
		int i=0;
		
		try
		{
			PreparedStatement ps = con.prepareStatement(sql1);
			ResultSet rs = ps.executeQuery();
			
			boolean b = rs.next();
			
			if(b==true)
				i=1;
			
			else
				i=0;				
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return i;
	}
	
	public static int DeleteUser(String sql)
	{
		Connection con = connect();
		int i=0;
		
		try
		{
			PreparedStatement ps = con.prepareStatement(sql);
			i = ps.executeUpdate();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return i;
	}
}
