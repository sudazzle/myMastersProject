
<%@page import="java.sql.*"%>
<%
try {
	
	String admin= request.getParameter("admin");
	String password=request.getParameter("password");
	
	if((admin.contentEquals("pravha") && password.contentEquals("khadka"))||(admin.contentEquals("nividita") && password.contentEquals("sharma")))
	{
		response.sendRedirect("adminpage.html");
	}
	else
	{
		response.sendRedirect("error_login.html");
	}
}
		
catch(Exception e){out.println(e);}
%>


