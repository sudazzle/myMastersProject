<%@page import="java.sql.*"%>
<%
try {
		int updateQuery = 0;
		int batch_id=0;
		String fullbatch = request.getParameter("batch");
		
		int substrbatchstart = Integer.parseInt(fullbatch.substring(0, 4).toString());
		System.out.println(substrbatchstart);
		out.println(substrbatchstart);
		int substrbatchend = Integer.parseInt(fullbatch.substring(5, 9).toString());
		out.println(substrbatchend);
		System.out.println(substrbatchend);
		String program=request.getParameter("program");
		String reg=request.getParameter("registration");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	PreparedStatement pstatement = null;
	String query1 ="Select * from batch where Start_Date = " + substrbatchstart + " and End_Date = " + substrbatchend + " and Program ='"+program+"'" ;
	Statement st = conn.createStatement();
	pstatement = conn.prepareStatement(query1);
	ResultSet rs = st.executeQuery(query1);
	while(rs.next()){
	batch_id = rs.getInt(1);}
	System.out.println("The batch is: " + batch_id);
	String query2 = "INSERT INTO student(Reg_No, Student_Name, Batch_Id, Status, Gender) VALUES(?, ?, ?, ?, ?)";
	pstatement = conn.prepareStatement(query2);
	pstatement.setString(1, reg);
    pstatement.setString(2, name);
    pstatement.setInt(3, batch_id);
    pstatement.setString(4,"Continue");
    pstatement.setString(5, gender);
    updateQuery = pstatement.executeUpdate();
   	response.sendRedirect("addstudent.jsp?id=" + batch_id);
   	conn.close();
	}
catch(Exception e){out.println(e);}
%>


