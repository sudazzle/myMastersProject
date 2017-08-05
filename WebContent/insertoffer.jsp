
<%@page import="java.sql.*"%>
<%
try {
	int updateQuery = 0;
	int batch_id=0;
	int subject_id=0;
	String fullbatch = request.getParameter("batch");
    String sem = request.getParameter("semester");
    int semester = Integer.parseInt(sem);
	String substrbatchstart = fullbatch.substring(0, 4).toString();
	out.println(substrbatchstart);
	String substrbatchend = fullbatch.substring(5, 9).toString();
	out.println(substrbatchend);
	String program = fullbatch.substring(11, 15).toString();
	if(program.contentEquals("BBA)")){program = "BBA";}
	System.out.println(program);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	PreparedStatement pstatement1 = null;
	String query1 ="Select Batch_Id from batch where Start_Date = " + substrbatchstart + " and End_Date = " + substrbatchend + " and Program ='"+program+"'" ;
	Statement st = conn.createStatement();
	pstatement1 = conn.prepareStatement(query1);
	ResultSet rs = st.executeQuery(query1);
	while(rs.next()){
	batch_id = rs.getInt(1);}
	String subjectname = request.getParameter("subject");
	out.println(subjectname);
	PreparedStatement pstatement2 = null;
	String query2 ="Select subject_id from subject where subject_name= '"+subjectname+"'";
	Statement st2 = conn.createStatement();
	pstatement2 = conn.prepareStatement(query2);
	ResultSet rs2 = st2.executeQuery(query2);
	while(rs2.next()){
		subject_id = rs2.getInt(1);}
	out.println(subject_id);
	
	
	PreparedStatement pstatement3 = null;
	String query3 = "INSERT INTO COURSE_OFFERED(batch_id, semester, subject_id) VALUES (?, ?, ?)";
	Statement st3 = conn.createStatement();
	pstatement3 = conn.prepareStatement(query3);
	pstatement3.setInt(1, batch_id);
    pstatement3.setInt(2, semester);
    pstatement3.setInt(3, subject_id);
    updateQuery = pstatement3.executeUpdate();
   	response.sendRedirect("courseoffer.jsp?id="+subject_id);
	}
catch(Exception e){out.println(e);}
%>


