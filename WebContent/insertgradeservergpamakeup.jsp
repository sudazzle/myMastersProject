<%@page import="java.sql.*"%>
<%
try {
	
	int updateQuery = 0;
	int batch_id = 0;
	int student_id = 0;
	int semester = 0;
	int symbolno = 0;
	int subject_id = 0;
	int offer_id = 0;
    String grade;

	student_id = Integer.parseInt(request.getParameter("id"));
	batch_id = Integer.parseInt(request.getParameter("id_batch"));
	symbolno = Integer.parseInt(request.getParameter("symbolno"));
	semester = Integer.parseInt(request.getParameter("semester"));
	subject_id = Integer.parseInt(request.getParameter("subject"));
	grade = request.getParameter("grade");
	 System.out.println(grade);
	  // Connection conaa = null;
	   String urlaa = "jdbc:mysql://localhost:8888/";
	   String dbbb = "onlineresult";
       String driverrrr = "com.mysql.jdbc.Driver";
       String userNameeeee ="root";
       String passwordddddd="SUD@M@N";
       Statement stttt;
	
		Class.forName(driverrrr).newInstance();
		Connection conaan = DriverManager.getConnection(urlaa+dbbb,userNameeeee,passwordddddd);
		Statement getofferidstmt;
		String getofferid = "select offer_id from course_offered where batch_id =" + batch_id + " and subject_id=" +subject_id + " and semester= " + semester;
		getofferidstmt = conaan.createStatement();
		ResultSet offerid = getofferidstmt.executeQuery(getofferid);
		
		while(offerid.next())
		{			
			PreparedStatement pstatement = null;
			String query11 = "INSERT into Marks(student_id, exam_type, symbol_no, grade, offer_id, gradepoint) values(?,?,?,?,?,?)";
			Statement insertstatement = conaan.createStatement();
			pstatement = conaan.prepareStatement(query11);
			pstatement.setInt(1, student_id);
		    pstatement.setString(2, "GPA Makeup");
		    pstatement.setInt(3, symbolno);
		    pstatement.setString(4, grade);
		    pstatement.setInt(5, offerid.getInt(1));
		    if(grade.contentEquals("F")) pstatement.setFloat(6, 0f);
		    else if(grade.contentEquals("D")) pstatement.setFloat(6, 1f);
		    else if(grade.contentEquals("C-")) pstatement.setFloat(6, 1.7f);
		    else if(grade.contentEquals("C")) pstatement.setFloat(6, 2f);
		    else if(grade.contentEquals("C+")) pstatement.setFloat(6, 2.3f);
		    else if(grade.contentEquals("B-")) pstatement.setFloat(6, 2.7f);
		    else if(grade.contentEquals("B")) pstatement.setFloat(6, 3f);
		    else if(grade.contentEquals("B+")) pstatement.setFloat(6, 3.3f);
		    else if(grade.contentEquals("A-")) pstatement.setFloat(6, 3.7f);
		    else pstatement.setFloat(6, 4f);
		    updateQuery = pstatement.executeUpdate();
		 }
		
	
	response.sendRedirect("insertgradegpamakeup.jsp?id="+student_id + "&id_batch=" + batch_id);
}
catch(Exception e){out.println(e); e.printStackTrace();}

%>
		 
		 

        
            			           			
            			
            			
            			
            			
            			
            			
            				