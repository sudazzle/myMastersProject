<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">

</script>
<%@ page import="java.sql.*" %>
<head>
<style>
#report
{
  width: 117px;
  float: left;
  padding: 5px 5 5px 5px;
  }
  #content1
{ text-align: justify;
  width: 830px;
  float: left;
  padding: 20px 0 15px 60px;}
</style>
<title>ONLINE RESULT SYSTEM</title><meta name="description" content="website description"><meta name="keywords" content="website keywords, website keywords"><meta http-equiv="content-type" content="text/html; charset=windows-1252"><link rel="stylesheet" type="text/css" href="style.css" title="style"></head><body>
  <div id="main">
    <div id="header">
      <div id="logo">
       <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <img src ="sudaman1.png">
          <h2>Online Result System</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu"><!-- put class="selected" in the li tag for the selected page - to highlight which page you're on --><li class = "selected"><a href = "displaygpamakeup_select.jsp">GPA-MAKEUP INFO</a></li><li><a href = "adminpage.html">admin</a></li><li><a href = "index.html">Sign Out</a></li>
       
        </ul></div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
        <div id="content">
        <!-- insert the page content here -->
       <div class="form_settings">
        <%! 
    	int batch_id = 0; 
    	int student_id = 0;
    	String program = null;
    	
    	%>
    	<%batch_id= Integer.parseInt(request.getParameter("id_batch")); 
    	  student_id = Integer.parseInt(request.getParameter("id"));  
    	
    	  %>
    	  
    	  <p><span><b>BATCH:</b></span><%
					
        			try {						
        				    Class.forName("com.mysql.jdbc.Driver").newInstance();
							String start, end;
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
							String query = "select Start_date, End_date from batch where Batch_id="+ batch_id;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next())
							{
								start = rs.getString(1);
								end = rs.getString(2);
								out.println(start + "-" + end);
								//out.println(student_id);
								//out.println(batch_id);
							}
							conn.close();
						}catch(Exception e){out.println(e);} 
					%></p>
          	<p><span><b>PROGRAM:</b></span><%
							try {
							
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							String start, end;
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
							String query = "select program from batch where Batch_id="+ batch_id;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next()){
								out.println(rs.getString(1));
								program = rs.getString(1);
							}
							conn.close();
						}
						catch(Exception e){out.println(e);} 
					%></p>
					 <p><span><b>NAME:</b></span><%
							
					 		Connection con = null;
            	            String url = "jdbc:mysql://localhost:8888/";
            	            String db = "onlineresult";
            				String driver = "com.mysql.jdbc.Driver";
            				String userName ="root";
            				String password="SUD@M@N";
            				Statement st;
            
            	try{
            			
            		Class.forName(driver).newInstance();
            			con = DriverManager.getConnection(url+db,userName,password);
                		String query = "select student_name from student where id="+ student_id;
           				st = con.createStatement();
            			ResultSet rs = st.executeQuery(query);
            			while(rs.next()){
            			String str = rs.getString(1);            			
						out.println(str);
					}}
						catch(Exception e){
						e.printStackTrace();
				}
			%></p>
    	  <p></p>
    	  <p>=================================================================================================================</p>
    	  <p></p>
    	  </div>
        <div id ="allsemgradedisplay">
        <h4>1st SEMESTER</h4>
        <table>
        <tr><th width = "50">&nbsp;&nbsp;CODE</th><th width="150">&nbsp;&nbsp;SUBJECT NAME</th><th>CREDIT</th><th>GRADE</th></tr>
<%
	
	try{	
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con_sem1 = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
		Statement sem1_st = con_sem1.createStatement();
		String sem1_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  batch_id + " and semester = " + 1;
		ResultSet sem1_offer_result = sem1_st.executeQuery(sem1_offer_query);
		while(sem1_offer_result.next())
		{
			
			
		    	Statement stmt1 = con_sem1.createStatement();
				String sem1_query = "select subject.subject_code, subject.subject_name, subject_credit, marks.grade, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and course_offered.offer_id = " + sem1_offer_result.getInt(1) + " and marks.exam_type = 'GPA Makeup'";
				ResultSet sem1_result = stmt1.executeQuery(sem1_query);
			
				while(sem1_result.next())
				{  						
				%>
<tr>
	<td>&nbsp;<%=sem1_result.getString(1)%></td>
	<td>&nbsp;&nbsp;<%=sem1_result.getString(2)%></td>
	<td>&nbsp;&nbsp;<%=sem1_result.getString(3)%></td>
	<td>&nbsp;&nbsp;<%=sem1_result.getString(4)%></td>
</tr>
<%
				}
%>

<%
		}}
catch(Exception e){
e.printStackTrace();
} 
%>

</table>
</div>
<div id = "allsemgradedisplay">
<h4>2nd SEMESTER</h4>
<table>
<tr><th width = "50">&nbsp;&nbsp;CODE</th><th width="150">&nbsp;&nbsp;SUBJECT NAME</th><th>CREDIT</th><th>GRADE</th></tr>
<%
try{	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con_sem2 = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	Statement sem2_st = con_sem2.createStatement();
	String sem2_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  batch_id + " and semester = " + 2;
	ResultSet sem2_offer_result = sem2_st.executeQuery(sem2_offer_query);
	while(sem2_offer_result.next())
	{
	
		System.out.println("The offer id is " + sem2_offer_result.getInt(1));
	    	Statement stmt2 = con_sem2.createStatement();
	    	String sem2_query = "select subject.subject_code, subject.subject_name, subject_credit, marks.grade, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and course_offered.offer_id = " + sem2_offer_result.getInt(1) + " and marks.exam_type = 'GPA Makeup'";	
	    	ResultSet sem2_result = stmt2.executeQuery(sem2_query);
			while(sem2_result.next())
			{  
					
			%>
<tr>
<td>&nbsp;<%=sem2_result.getString(1)%></td>
<td>&nbsp;&nbsp;<%=sem2_result.getString(2)%></td>
<td>&nbsp;&nbsp;<%=sem2_result.getString(3)%></td>
<td>&nbsp;&nbsp;<%=sem2_result.getString(4)%></td>
</tr>
<%
			}
%>

<%
	}}
catch(Exception e){
e.printStackTrace();
} 
%>

</table>
        </div>
        
        <div id = "allsemgradedisplay">
<h4>3rd SEMESTER</h4>
<table>
<tr><th width = "50">&nbsp;&nbsp;CODE</th><th width="150">&nbsp;&nbsp;SUBJECT NAME</th><th>CREDIT</th><th>GRADE</th></tr>
<%
	
try{	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con_sem3 = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	Statement sem3_st = con_sem3.createStatement();
	String sem3_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  batch_id + " and semester = " + 3;
	ResultSet sem3_offer_result = sem3_st.executeQuery(sem3_offer_query);
	while(sem3_offer_result.next())
	{
		
		
	    	Statement stmt3 = con_sem3.createStatement();
	    	String sem3_query = "select subject.subject_code, subject.subject_name, subject_credit, marks.grade, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and course_offered.offer_id = " + sem3_offer_result.getInt(1) + " and marks.exam_type = 'GPA Makeup'";			ResultSet sem3_result = stmt3.executeQuery(sem3_query);
		
			while(sem3_result.next())
			{  
					
			%>
<tr>
<td>&nbsp;<%=sem3_result.getString(1)%></td>
<td>&nbsp;&nbsp;<%=sem3_result.getString(2)%></td>
<td>&nbsp;&nbsp;<%=sem3_result.getString(3)%></td>
<td>&nbsp;&nbsp;<%=sem3_result.getString(4)%></td>
</tr>
<%
			}
%>

<%
	}}
catch(Exception e){
e.printStackTrace();
} 
%>

</table>
        
        </div>
        <div id = "allsemgradedisplay">
        <h4>4th SEMESTER</h4>
<table>
<tr><th width = "50">&nbsp;&nbsp;CODE</th><th width="150">&nbsp;&nbsp;SUBJECT NAME</th><th>CREDIT</th><th>GRADE</th></tr>
<%
	
try{	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con_sem4 = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	Statement sem4_st = con_sem4.createStatement();
	String sem4_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  batch_id + " and semester = " + 4;
	ResultSet sem4_offer_result = sem4_st.executeQuery(sem4_offer_query);
	while(sem4_offer_result.next())
	{
		
		
	    	Statement stmt4 = con_sem4.createStatement();
	    	String sem4_query = "select subject.subject_code, subject.subject_name, subject_credit, marks.grade, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and course_offered.offer_id = " + sem4_offer_result.getInt(1) + " and marks.exam_type = 'GPA Makeup'";			ResultSet sem4_result = stmt4.executeQuery(sem4_query);
		
			while(sem4_result.next())
			{  
					
			%>
<tr>
<td>&nbsp;<%=sem4_result.getString(1)%></td>
<td>&nbsp;&nbsp;<%=sem4_result.getString(2)%></td>
<td>&nbsp;&nbsp;<%=sem4_result.getString(3)%></td>
<td>&nbsp;&nbsp;<%=sem4_result.getString(4)%></td>
</tr>
<%
			}
%>

<%
	}}
catch(Exception e){
e.printStackTrace();
} 
%>

</table>
        
        </div>
        <div id = "allsemgradedisplay">
        <h4>5th SEMESTER</h4>
<table>
<tr><th width = "50">&nbsp;&nbsp;CODE</th><th width="150">&nbsp;&nbsp;SUBJECT NAME</th><th>CREDIT</th><th>GRADE</th></tr>
<%
	
try{	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con_sem5 = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	Statement sem5_st = con_sem5.createStatement();
	String sem5_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  batch_id + " and semester = " + 5;
	ResultSet sem5_offer_result = sem5_st.executeQuery(sem5_offer_query);
	while(sem5_offer_result.next())
	{
			
		
	    	Statement stmt5 = con_sem5.createStatement();
	    	String sem5_query = "select subject.subject_code, subject.subject_name, subject_credit, marks.grade, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and course_offered.offer_id = " + sem5_offer_result.getInt(1) + " and marks.exam_type = 'GPA Makeup'";			ResultSet sem5_result = stmt5.executeQuery(sem5_query);
		
			while(sem5_result.next())
			{  
					
			%>
<tr>
<td>&nbsp;<%=sem5_result.getString(1)%></td>
<td>&nbsp;&nbsp;<%=sem5_result.getString(2)%></td>
<td>&nbsp;&nbsp;<%=sem5_result.getString(3)%></td>
<td>&nbsp;&nbsp;<%=sem5_result.getString(4)%></td>
</tr>
<%
			}
%>

<%
	}}
catch(Exception e){
e.printStackTrace();
} 
%>

</table>
        
        </div>
        
        <div id = "allsemgradedisplay">
        <h4>6th SEMESTER</h4>
<table>
<tr><th width = "50">&nbsp;&nbsp;CODE</th><th width="150">&nbsp;&nbsp;SUBJECT NAME</th><th>CREDIT</th><th>GRADE</th></tr>
<%

try{	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con_sem6 = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	Statement sem6_st = con_sem6.createStatement();
	String sem6_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  batch_id + " and semester = " + 6;
	ResultSet sem6_offer_result = sem6_st.executeQuery(sem6_offer_query);
	while(sem6_offer_result.next())
	{
		
		
	    	Statement stmt6 = con_sem6.createStatement();
	    	String sem6_query = "select subject.subject_code, subject.subject_name, subject_credit, marks.grade, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and course_offered.offer_id = " + sem6_offer_result.getInt(1) + " and marks.exam_type = 'GPA Makeup'";			ResultSet sem6_result = stmt6.executeQuery(sem6_query);
		
			while(sem6_result.next())
			{  
					
			%>
<tr>
<td>&nbsp;<%=sem6_result.getString(1)%></td>
<td>&nbsp;&nbsp;<%=sem6_result.getString(2)%></td>
<td>&nbsp;&nbsp;<%=sem6_result.getString(3)%></td>
<td>&nbsp;&nbsp;<%=sem6_result.getString(4)%></td>
</tr>
<%
			}
%>

<%
	}}
catch(Exception e){
e.printStackTrace();
} 
%>

</table>
        
        </div>
        <div id = "allsemgradedisplay">
        <h4>7th SEMESTER</h4>
<table>
<tr><th width = "50">&nbsp;&nbsp;CODE</th><th width="150">&nbsp;&nbsp;SUBJECT NAME</th><th>CREDIT</th><th>GRADE</th></tr>
<%

try{	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con_sem7 = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	Statement sem7_st = con_sem7.createStatement();
	String sem7_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  batch_id + " and semester = " + 7;
	ResultSet sem7_offer_result = sem7_st.executeQuery(sem7_offer_query);
	while(sem7_offer_result.next())
	{
			
		
	    	Statement stmt7 = con_sem7.createStatement();
	    	String sem7_query = "select subject.subject_code, subject.subject_name, subject_credit, marks.grade, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and course_offered.offer_id = " + sem7_offer_result.getInt(1) + " and marks.exam_type = 'GPA Makeup'";			ResultSet sem7_result = stmt7.executeQuery(sem7_query);
		
			while(sem7_result.next())
			{  
				
			%>
<tr>
<td>&nbsp;<%=sem7_result.getString(1)%></td>
<td>&nbsp;&nbsp;<%=sem7_result.getString(2)%></td>
<td>&nbsp;&nbsp;<%=sem7_result.getString(3)%></td>
<td>&nbsp;&nbsp;<%=sem7_result.getString(4)%></td>
</tr>
<%
			}
%>

<%
	}}
catch(Exception e){
e.printStackTrace();
} 
%>

</table>
        
        </div>
        
        <div id = "allsemgradedisplay">
        <h4>8th SEMESTER</h4>
<table>
<tr><th width = "50">&nbsp;&nbsp;CODE</th><th width="150">&nbsp;&nbsp;SUBJECT NAME</th><th>CREDIT</th><th>GRADE</th></tr>
<%
try{	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con_sem8 = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
	Statement sem8_st = con_sem8.createStatement();
	String sem8_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  batch_id + " and semester = " + 8;
	ResultSet sem8_offer_result = sem8_st.executeQuery(sem8_offer_query);
	while(sem8_offer_result.next())
	{
		
	    	Statement stmt8 = con_sem8.createStatement();
	    	String sem8_query = "select subject.subject_code, subject.subject_name, subject_credit, marks.grade, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and course_offered.offer_id = " + sem8_offer_result.getInt(1) + " and marks.exam_type = 'GPA Makeup'";			ResultSet sem8_result = stmt8.executeQuery(sem8_query);
		
			while(sem8_result.next())
			{  					
			%>
<tr>
<td>&nbsp;<%=sem8_result.getString(1)%></td>
<td>&nbsp;&nbsp;<%=sem8_result.getString(2)%></td>
<td>&nbsp;&nbsp;<%=sem8_result.getString(3)%></td>
<td>&nbsp;&nbsp;<%=sem8_result.getString(4)%></td>
</tr>
<%
			}
%>

<%
	}}
catch(Exception e){
e.printStackTrace();
} 
%>

</table>
        
        </div>
    </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
       Copyright © sudaman | <a href="http://www.lacm.edu.np">LACM</a> 
</div>
  </div>


</body>
</html>