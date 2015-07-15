package com.ibm.controllers;

import com.ibm.dao.EMallDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ResetPasswordServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String opwd=request.getParameter("opwd");
		String npwd=request.getParameter("npwd");
		String rnpwd=request.getParameter("rnpwd");
		
		HttpSession session = request.getSession();
		
		String pwd=(String)session.getAttribute("pwd");
		String cid=(String)session.getAttribute("cid");
		
		System.out.println(pwd);
		
		if(!opwd.equals(pwd))
		{
			System.out.println(pwd);
			request.setAttribute("msg", "Old Password doesn't match");
			getServletContext().getRequestDispatcher("/ResetPassword.jsp").forward(request, response);
		}
		
		else if(!npwd.equals(rnpwd))
		{
			request.setAttribute("msg", "Reenter Password does not match");
			getServletContext().getRequestDispatcher("/ResetPassword.jsp").forward(request, response);
		}
		
		else
		{
			String sql="Update Customer set pwd='"+npwd+"' where cid='"+cid+"'";
			
			Connection con =EMallDAO.connect();
			
			try 
			{
				PreparedStatement ps=con.prepareStatement(sql);
				int i = ps.executeUpdate();
				
				if(i!=0)
				{
					session.setAttribute("pwd", npwd);
					request.setAttribute("msg6", "Password changed successfully! Login with your new Credentials.");
					getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
				}
				
				else
				{
					request.setAttribute("msg", "Password doesn't match");
					getServletContext().getRequestDispatcher("/Account.jsp").forward(request, response);
					
				}
				
			} 
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
}
