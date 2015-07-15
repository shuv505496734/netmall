package com.ibm.controllers;

import com.ibm.dao.EMallDAO;
import com.ibm.models.RegModel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateInfoServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//Task1- Retrieve all values from JSP
		String cid = request.getParameter("cid");
		String gender = request.getParameter("gender");
		String fname = request.getParameter("fname"); fname=fname.toUpperCase();
		String lname = request.getParameter("lname"); lname=lname.toUpperCase();
		String email = request.getParameter("email"); email=email.toLowerCase();
		String pwd = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		String street = request.getParameter("street"); street=street.toUpperCase();
		String city = request.getParameter("city"); city=city.toUpperCase();
		String state = request.getParameter("state"); state=state.toUpperCase();
		String zip = request.getParameter("zip");
		
		//Task2- Set all values in Model
		HttpSession session = request.getSession();
		RegModel obj = new RegModel();
		
		obj.setCid(cid);
		obj.setGender(gender);
		obj.setFname(fname);
		obj.setLname(lname);
		obj.setEmail(email);
		obj.setPwd(pwd);
		obj.setPhone(phone);
		obj.setStreet(street);
		obj.setCity(city);
		obj.setState(state);
		obj.setZip(zip);
		
		String sql = "UPDATE CUSTOMER SET gender=?,fname=?,lname=?,email=?,phone=?,street=?,city=?,state=?,zip=? where cid=?";
		
		int i = EMallDAO.UpdateUser(sql, obj);
		
		if(i!=0)
		{
			session.setAttribute("cid", cid);
			session.setAttribute("gender", gender);
			session.setAttribute("fname", fname);
			session.setAttribute("lname", lname);
			session.setAttribute("email", email);
			session.setAttribute("pwd", pwd);
			session.setAttribute("phone", phone);
			session.setAttribute("street", street);
			session.setAttribute("city", city);
			session.setAttribute("state", state);
			session.setAttribute("zip", zip);
			
			request.setAttribute("msg1", "Updated Succesfully!");
			getServletContext().getRequestDispatcher("/Account.jsp").forward(request, response);
		}
		
		else
		{
			request.setAttribute("msg", "Please enter valid inputs!");
			getServletContext().getRequestDispatcher("/UpdateUser.jsp").forward(request, response);
		}
	}
}
