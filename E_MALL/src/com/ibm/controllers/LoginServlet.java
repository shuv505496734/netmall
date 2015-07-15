package com.ibm.controllers;

import com.ibm.dao.EMallDAO;
import com.ibm.models.RegModel;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//Task 1- Request all parameters from JSP Page
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		HttpSession session = request.getSession();
		
		
		//Task 2- Set values in Model Class Object
		RegModel obj = new RegModel();
		obj.setEmail(email);
		obj.setPwd(pwd);
		
		
		//Task 3- Call a method in DAO Class to select data
		String sql = "SELECT  * FROM CUSTOMER WHERE email=? AND pwd=?";
		ResultSet rs = EMallDAO.LoginUser(sql, obj);
		
		try 
		{
			if(rs.next())
			{
				session.setAttribute("cid", rs.getString(1));
				session.setAttribute("gender", rs.getString(2));
				session.setAttribute("fname", rs.getString(3));
				session.setAttribute("lname", rs.getString(4));
				session.setAttribute("email", rs.getString(5));
				session.setAttribute("pwd", rs.getString(6));
				session.setAttribute("phone", rs.getString(7));
				session.setAttribute("street", rs.getString(8));
				session.setAttribute("city", rs.getString(9));
				session.setAttribute("state", rs.getString(10));
				session.setAttribute("zip", rs.getString(11));
				
				getServletContext().getRequestDispatcher("/Account.jsp").forward(request, response);
			}
			
			else
			{
				request.setAttribute("msg1", "Please enter valid email id or password!");
				getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		} 
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
