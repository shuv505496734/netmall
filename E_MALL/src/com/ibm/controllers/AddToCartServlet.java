package com.ibm.controllers;

import com.ibm.dao.EMallDAO;
import com.ibm.models.CartModel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddToCartServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
  
    public AddToCartServlet() 
    {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		if(session.getAttribute("email") != null)
		{
			String item = request.getParameter("item");
			
			String rvsql = "select * from ItemDb where itemname='"+item+"'";
			
			CartModel cobj = new CartModel();
			Connection con = EMallDAO.connect();
			PreparedStatement ps=null;
			ResultSet rsd = null;
			try
			{
				ps = con.prepareStatement(rvsql);
				rsd = ps.executeQuery();
				
				if(rsd.next())
				{
					cobj.setCartid("CT"+session.getAttribute("cid"));
					cobj.setItemid(rsd.getString(1));
					cobj.setItemname(rsd.getString(2));
					cobj.setItemprice(Integer.parseInt(rsd.getString(3)));
					cobj.setItemqty(1);
					
					session.setAttribute("cobj", cobj);
					
					getServletContext().getRequestDispatcher("/Cart.jsp").forward(request, response);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}
}
