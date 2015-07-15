package com.ibm.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ibm.dao.EMallDAO;
import com.ibm.email.EmailUtility;
import com.ibm.models.RegModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ForgotPasswordServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	private String host = "smtp.gmail.com";
	private String port = "587";
	private String user = "ibmtest13@gmail.com";
	private String pass = "testingmail";
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("email");
		String recipient = email;
		String subject = "Password Recovery of"+email;
		
		RegModel obj = new RegModel();
		obj.setEmail(email);
		
		String sql = "SELECT * FROM CUSTOMER WHERE email='"+email+"'";
		Connection con = EMallDAO.connect();
		ResultSet rs = null;
		
		try
		{
			PreparedStatement ps=con.prepareStatement(sql);
			ps = con.prepareStatement(sql);			
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				try
				{
					String content = "Hello"+rs.getString(3)+"! Your NETMALL Account Password is"+rs.getString(6);
					EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
				}
				
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
				request.setAttribute("msg", "An Email has been sent to you! Please check to Login");
				getServletContext().getRequestDispatcher("/ForgotPassword.jsp").forward(request, response);
			}
			
			else
			{
				request.setAttribute("msg", "Email Id not Registered!");
				getServletContext().getRequestDispatcher("/ForgotPassword.jsp").forward(request, response);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
