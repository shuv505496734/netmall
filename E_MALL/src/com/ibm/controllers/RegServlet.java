package com.ibm.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.EMallDAO;
import com.ibm.helper.Helper;
import com.ibm.models.RegModel;


public class RegServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//Task 1- Retrieve all values from VIEW(JSP Page)
		String gender = request.getParameter("gender");
		String fname = request.getParameter("fname"); fname=fname.toUpperCase();
		String lname = request.getParameter("lname"); lname=lname.toUpperCase();
		String email = request.getParameter("email"); email=email.toLowerCase();
		String pwd = request.getParameter("pwd");
		String rpwd = request.getParameter("rpwd");		
		String phone = request.getParameter("phone");
		String street = request.getParameter("street"); street=street.toUpperCase();
		String city = request.getParameter("city"); city=city.toUpperCase();
		String state = request.getParameter("state"); state=state.toUpperCase();
		String zip = request.getParameter("zip");
		
		//For captcha code
		String code = request.getParameter("code");
		
		HttpSession session = request.getSession();
		session.setAttribute("code", code);
		
		String captcha = (String)session.getAttribute("captcha");
		boolean status1 = Helper.CheckCaptcha(captcha, code);
		
		
		//Task 2- Set all values in MODEL
		RegModel obj = new RegModel();

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
		
		String sql = "INSERT INTO CUSTOMER(cid, gender, fname, lname, email, pwd, phone, street, city, state, zip)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		String sql1 = "SELECT * FROM CUSTOMER WHERE email'"+email+"'";
		
		if(fname.equals(null)||fname==""||lname.equals(null)||lname==""||email.equals(null)||email==""||pwd.equals(null)||pwd==""||rpwd.equals(null)||rpwd==""||phone.equals(null)||phone==""||street.equals(null)||street==""||city.equals(null)||city==""||state.equals(null)||state==""||zip.equals(null)||zip=="")
		{
			request.setAttribute("fname", fname);
			request.setAttribute("lname", lname);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("street", street);
			request.setAttribute("city", city);
			request.setAttribute("state", state);
			request.setAttribute("zip", zip);
			
			request.setAttribute("msg", "All fields are mandatory!");
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}
		
		else if(status1)
		{
			int j = EMallDAO.UserValidation(sql1);
					
			if(j!=0)
			{
				request.setAttribute("fname", fname);
				request.setAttribute("lname", lname);
				request.setAttribute("email", email);
				request.setAttribute("phone", phone);
				request.setAttribute("street", street);
				request.setAttribute("city", city);
				request.setAttribute("state", state);
				request.setAttribute("zip", zip);
				
				request.setAttribute("msg", "Email ID already registered!");
				getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
			}
			
			else
			{
				int i = EMallDAO.addData(sql, obj);
				
				if(i!=0)
				{
					request.setAttribute("msg5", "Registered Succesfully");
					getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
				}

				else
				{
					response.sendRedirect("Login.jsp");
				}
			}
		}
		
		else
		{
			request.setAttribute("fname", fname);
			request.setAttribute("lname", lname);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("street", street);
			request.setAttribute("city", city);
			request.setAttribute("state", state);
			request.setAttribute("zip", zip);
			
			request.setAttribute("msg2", "Type the same text");
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}
}
