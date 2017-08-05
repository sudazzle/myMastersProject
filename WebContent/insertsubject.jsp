
<%@page import="java.sql.*"%>
<%
try {
	int updateQuery = 0;
	String subjectcode= request.getParameter("subjectcode");
	String subjectname=request.getParameter("subjectname");
	String credithour = request.getParameter("credithour");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	PreparedStatement pstatement = null;
	String query = "INSERT INTO subject(subject_code, subject_name, subject_credit) VALUES (?, ?, ?)";
	Statement st = conn.createStatement();
	pstatement = conn.prepareStatement(query);
	pstatement.setString(1, subjectcode);
    pstatement.setString(2, subjectname);
    pstatement.setString(3, credithour);
    updateQuery = pstatement.executeUpdate();
   	response.sendRedirect("addsubject.jsp");
	}
catch(Exception e){out.println(e);}
%>


