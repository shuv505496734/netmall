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


public class AdminLoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//Task1- Retrieve all parameters from JSP Page
		String aemail = request.getParameter("aemail");
		String apwd = request.getParameter("apwd");
		
		HttpSession session = request.getSession();		
		
		//Task2- Set all values to Model Class
		RegModel obj = new RegModel();
		obj.setEmail(aemail);
		obj.setPwd(apwd);
		
		//Task3- Call a method in DAO Class to select data
		String sql = "SELECT * FROM ADMIN WHERE email=? AND pwd=?";
		ResultSet rs = EMallDAO.LoginUser(sql, obj);
		
		try
		{
			if(rs.next())
			{
				session.setAttribute("aid", rs.getString(1));
				session.setAttribute("aemail", rs.getString(2));
				session.setAttribute("apwd", rs.getString(3));	
				
				getServletContext().getRequestDispatcher("/AdminAccount.jsp").forward(request, response);
			}
			
			else
			{
				request.setAttribute("msg3", "Please enter valid email id or password!");
				getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
