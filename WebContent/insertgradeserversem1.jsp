<%@page import="java.sql.*"%>
<%
try {
	PreparedStatement pstatement = null;
	int updateQuery = 0;
	int batch_id = 0;
	int student_id = 0;
	int semester = 1;
	int symbolno = 0;

	student_id = Integer.parseInt(request.getParameter("id"));
	batch_id = Integer.parseInt(request.getParameter("id_batch"));
	symbolno = Integer.parseInt(request.getParameter("symbolno"));
	

	
	   	
	 Connection conaa = null;
	 String urlaa = "jdbc:mysql://localhost:8888/";
	 String dbbb = "onlineresult";
     String driverrrr = "com.mysql.jdbc.Driver";
      String userNameeeee ="root";
      String passwordddddd="SUD@M@N";
      Statement stttt;

//System.out.println("Sudaman");

	int counter = 1;
	Class.forName(driverrrr).newInstance();
	conaa = DriverManager.getConnection(urlaa+dbbb,userNameeeee,passwordddddd);
	String query2 = "select subject.subject_id, subject_name from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id = "  + batch_id + " and course_offered.semester = "+ semester;
		stttt = conaa.createStatement();
	ResultSet r21s = stttt.executeQuery(query2);
	while(r21s.next()){
		out.println(batch_id);
		out.println(r21s.getString(1));
		Class.forName(driverrrr).newInstance();
		Connection conaan = DriverManager.getConnection(urlaa+dbbb,userNameeeee,passwordddddd);
		Statement getofferidstmt;
		String getofferid = "select offer_id from course_offered where batch_id =" + batch_id + " and subject_id=" + r21s.getString(1) + " and semester= " + semester;
		getofferidstmt = conaan.createStatement();
		ResultSet offerid = getofferidstmt.executeQuery(getofferid);
		
		while(offerid.next())
		{			
			String query11 = "INSERT into Marks(student_id, exam_type, symbol_no, grade, offer_id, gradepoint) values(?,?,?,?,?,?)";
			Statement insertstatement = conaa.createStatement();
			pstatement = conaa.prepareStatement(query11);
			pstatement.setInt(1, student_id);
		    pstatement.setString(2, "Regular");
		    pstatement.setInt(3, symbolno);
		    pstatement.setString(4, request.getParameter(r21s.getString(2)));
		    out.println(request.getParameter(r21s.getString(2)));
		    pstatement.setInt(5, offerid.getInt(1));
		    if(request.getParameter(r21s.getString(2)).contentEquals("F")) pstatement.setFloat(6, 0f);
		    else if(request.getParameter(r21s.getString(2)).contentEquals("D")) pstatement.setFloat(6, 1f);
		    else if(request.getParameter(r21s.getString(2)).contentEquals("C-")) pstatement.setFloat(6, 1.7f);
		    else if(request.getParameter(r21s.getString(2)).contentEquals("C")) pstatement.setFloat(6, 2f);
		    else if(request.getParameter(r21s.getString(2)).contentEquals("C+")) pstatement.setFloat(6, 2.3f);
		    else if(request.getParameter(r21s.getString(2)).contentEquals("B-")) pstatement.setFloat(6, 2.7f);
		    else if(request.getParameter(r21s.getString(2)).contentEquals("B")) pstatement.setFloat(6, 3f);
		    else if(request.getParameter(r21s.getString(2)).contentEquals("B+")) pstatement.setFloat(6, 3.3f);
		    else if(request.getParameter(r21s.getString(2)).contentEquals("A-")) pstatement.setFloat(6, 3.7f);
		    else pstatement.setFloat(6, 4f);
		    updateQuery = pstatement.executeUpdate();
		 }
		System.out.println(request.getParameter(r21s.getString(2)));
		counter++;}
   	response.sendRedirect("MARKSregular.jsp?id="+batch_id);}
catch(Exception e){out.println(e); e.printStackTrace();}
%>
		 
		 

        
            			           			
            			
            			
            			
            			
            			
            			
            			
            			}
				