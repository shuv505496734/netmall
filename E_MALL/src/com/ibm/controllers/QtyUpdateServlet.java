package com.ibm.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class QtyUpdateServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		
		String updateBtn = request.getParameter("updateBtn");
		
		int quantity = (int)session.getAttribute("iqty");
		//CartModel cobj = (CartModel)session.getAttribute("cobj");
		//System.out.println(quantity);
		
		if(updateBtn.equals("+"))
		{
			quantity++;
			//request.setAttribute("cqty", quantity);
			//cobj.setItemqty(quantity);
			session.setAttribute("iqty", quantity);
		}
		else
		{
			quantity--;
			//vrequest.setAttribute("cqty", quantity);
			//cobj.setItemqty(quantity);
			session.setAttribute("iqty", quantity);
		}
		
		getServletContext().getRequestDispatcher("/Cart.jsp").forward(request, response);
	}

}
