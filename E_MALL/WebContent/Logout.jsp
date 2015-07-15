<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout | Net-Mall</title>
</head>
<body>
<%
	if(session.getAttribute("email")!=null)
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
		session.removeAttribute("cobj");
		session.invalidate();
		
		request.setAttribute("msg10", "Logged out Successfully!");
		getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
	}

	else if(session.getAttribute("aemail")!=null)
	{
		session.removeAttribute("aid");
		session.removeAttribute("email");
		session.removeAttribute("pwd");
		session.invalidate();
		request.setAttribute("msg12", "Logged out Successfully!");
		getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
	}
%>
</body>
</html>