package com.ibm.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.helper.Helper;


public class CheckoutServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
		//For captcha code
		String code = request.getParameter("code");
		
		HttpSession session = request.getSession();
		session.setAttribute("code", code);
		
		String captcha = (String)session.getAttribute("captcha");
		boolean status1 = Helper.CheckCaptcha(captcha, code);
		
		if(status1)
		{
			session.removeAttribute("cobj");
			
			request.setAttribute("msg", "Payment Successful!");
			getServletContext().getRequestDispatcher("/Account.jsp").forward(request, response);
		}
		
		else
		{
			request.setAttribute("msg2", "Type the same text");
			getServletContext().getRequestDispatcher("/Cart.jsp").forward(request, response);
		}
	}
}
