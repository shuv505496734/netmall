<%@ page import="java.sql.*"%>
<%@ page import="com.ibm.dao.EMallDAO"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = EMallDAO.connect();
	
	String cid = (String)session.getAttribute("cid");

	String sql = "Delete from Customer where cid='"+cid+"'";
	PreparedStatement ps = con.prepareStatement(sql);
	int i = ps.executeUpdate();
	
	if(i!=0)
	{
		session.removeAttribute("cid");
		session.removeAttribute("gender");
		session.removeAttribute("fname");
		session.removeAttribute("lname");
		session.removeAttribute("email");
		session.removeAttribute("pwd");
		session.removeAttribute("phone");
		session.removeAttribute("street");
		session.removeAttribute("city");
		session.removeAttribute("state");
		session.removeAttribute("zip");
		session.invalidate();
		
		request.setAttribute("msg9", "Account Deactivated!");
		getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
	}
	
	else
	{
		
	}
%>

</body>
</html>