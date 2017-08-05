<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.sql.*"%>
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
<title>Online Result System</title><meta name="description" content="website description"><meta name="keywords" content="website keywords, website keywords"><meta http-equiv="content-type" content="text/html; charset=windows-1252"><link rel="stylesheet" type="text/css" href="style.css" title="style"></head>
<body>
  
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
        <ul id="menu"><!-- put class="selected" in the li tag for the selected page - to highlight which page you're on --><li class = "selected"><a href = "#">Enroll Student</a></li><li><a href = "adminpage.html">admin</a></li><li><a href = "index.html">Sign Out</a></li>
       
        </ul></div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
        <div id="content">
        <!-- insert the page content here -->
        <%
        int student_id = Integer.parseInt(request.getParameter("student_id"));
        int offer_id = Integer.parseInt(request.getParameter("offer_id"));
        int batch_id = Integer.parseInt(request.getParameter("batch_id"));
        
        %>
        <h4>EDIT GRADE</h4>
        <p></p>
        
         <p><span><B>NAME:</B></span>&nbsp;&nbsp;&nbsp;<%
							
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
				} con.close();
			%></p>
<form method="post" action="update_grade_sem1.jsp">
<table>
		<tr><th width="60" >&nbsp;&nbsp;Code</th><th width="200">&nbsp;&nbsp;Subject Name</th><th width="20PX">&nbsp;Grade</th><th>&nbsp;Exam Type</th><th></th></tr>
			<%
				
			try{	
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con_sem = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
					   	Statement stmnt = con_sem.createStatement();
						String sem_query = "select subject.subject_code, subject.subject_name, marks.grade, marks.exam_type, marks.marks_id, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + student_id + " and marks.exam_type = 'Regular' and course_offered.offer_id = " + offer_id;
						ResultSet sem_result = stmnt.executeQuery(sem_query);
					
						while(sem_result.next())
						{  
								
						%>
			<tr>
			<td>&nbsp;<%=sem_result.getString(1)%></td>
			<td>&nbsp;&nbsp;<%=sem_result.getString(2)%></td>
			<td><input type="text" name="grade" value="<%=sem_result.getString(3)%>"></td>
			<td>&nbsp;&nbsp;<%=sem_result.getString(4)%></td>
			<td><input type="submit" name="Submit" value="Edit" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px;" ></td>
	        <td><input type="hidden" name="marks_id" value="<%=sem_result.getInt(5)%>"></td>
	        <td><input type="hidden" name="student_id" value="<%=student_id%>"></td>
	        <td><input type="hidden" name="batch_id" value="<%=batch_id%>"></td>
	</tr>
			<%
						}}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</form>

 </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
       Copyright © sudaman | <a href="http://www.lacm.edu.np">LACM</a> 
</div>
  </div>
</body>
</html>



