
<%@page import="java.sql.*"%>
<%
try {
	int updateQuery = 0;
	String start= request.getParameter("start");
	String end=request.getParameter("end");
	String program = request.getParameter("program");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	PreparedStatement pstatement = null;
	String query = "INSERT INTO batch(start_date, end_date, program) VALUES (?, ?, ?)";
	Statement st = conn.createStatement();
	pstatement = conn.prepareStatement(query);
	pstatement.setString(1, start);
    pstatement.setString(2, end);
    pstatement.setString(3, program);
    updateQuery = pstatement.executeUpdate();
   	response.sendRedirect("newenroll.jsp");
	}
catch(Exception e){out.println(e);}
%>


