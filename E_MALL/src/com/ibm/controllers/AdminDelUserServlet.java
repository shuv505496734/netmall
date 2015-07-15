package com.ibm.controllers;

import com.ibm.dao.EMallDAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminDelUserServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String[] ch1 = request.getParameterValues("ch1");
		int j=0;
		
		for(int i=0; i<ch1.length; i++)
		{
			String sql="DELETE FROM CUSTOMER WHERE cid='"+ch1[i]+"'";
			
			j = EMallDAO.DeleteUser(sql);
			
			if(j!=0)
			{
				request.setAttribute("msg", "User Account deleted!");	
				getServletContext().getRequestDispatcher("/AdminAccount.jsp").forward(request, response);
			}
			else
			{
				
			}
		}
	}
}
