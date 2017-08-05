<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
function editMarks(student_id, offer_id, batch_id){
    var f=document.form;
    f.method="post";
    f.action='edit_sem1.jsp?student_id='+student_id + '&offer_id='+ offer_id + '&batch_id='+ batch_id;
    f.submit();
}
function validateForm()
{
	var symbolno =document.forms["sem_1"]["symbolno"].value
	
	if (symbolno=="" || symbolno==null)
	{
		alert("PLEASE ENTER THE SYMBOL NUMBER");
		return false;
	}
	

}
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
<title>Online Result System</title><meta name="description" content="website description"><meta name="keywords" content="website keywords, website keywords"><meta http-equiv="content-type" content="text/html; charset=windows-1252"><link rel="stylesheet" type="text/css" href="style.css" title="style"></head>
<body>
<%String program = null;
  String id_batch = null;
  String id = null;
  int semester = 1;%>
  
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
        		<ul id="menu"><!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
        		<li class = "selected"><a href = "MARKSSELECT.jsp">INSERT GRADE</a></li>
        		<li><a href = "adminpage.html">admin</a></li>
        		<li><a href = "index.html">Sign Out</a></li></ul>
        	</div>
    	</div>
    	<div id="content_header"></div>
    	<div id="site_content">
        	<div id="content">
        	<!-- insert the page content here -->
        	<h1><B>1st SEMESTER: REGULAR</B></h1>
            <form name ="sem_1" action="insertgradeserversem1.jsp?id_batch=<%=request.getParameter("id_batch")%>&id=<%=request.getParameter("id") %>" method="post" onsubmit="return validateForm()">
          	<div class="form_settings">
           	<p><span>BATCH</span><input type="text" name="batch" value = "<%
					id_batch=request.getParameter("id_batch");
        			try {						
        				    Class.forName("com.mysql.jdbc.Driver").newInstance();
							String start, end;
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
							String query = "select Start_date, End_date from batch where Batch_id="+ id_batch;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next())
							{
								start = rs.getString(1);
								end = rs.getString(2);
								out.println(start + "-" + end);
							}
							conn.close();
						}catch(Exception e){out.println(e);} 
					%>"></p>
          	<p><span>PROGRAM</span><input type="text" name="program" value = "<%
							try {
							
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							String start, end;
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
							String query = "select program from batch where Batch_id="+ id_batch;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next()){
								out.println(rs.getString(1));
								program = rs.getString(1);
							}
							conn.close();
						}
						catch(Exception e){out.println(e);} 
					%>"></p>
					 <p><span>NAME</span><input type="text" name="name" value = "<%
							id=request.getParameter("id");
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
                		String query = "select student_name from student where id="+ id;
           				st = con.createStatement();
            			ResultSet rs = st.executeQuery(query);
            			while(rs.next()){
            			String str = rs.getString(1);            			
						out.println(str);
					}}
						catch(Exception e){
						e.printStackTrace();
				} con.close();
			%>"></p>
			<p><span>SYMBOL NO.</span><input type="text" name="symbolno"></p>
			</div>
			<div class = "form_settings2">
			<table>
<tr><th width="30" >S.No.</th><th width="200">&nbsp;&nbsp;SUBJECT</th><th>&nbsp;GRADE</th></tr>
<%
		 Connection conaa = null;
		 String urlaa = "jdbc:mysql://localhost:8888/";
		 String dbbb = "onlineresult";
         String driverrrr = "com.mysql.jdbc.Driver";
          String userNameeeee ="root";
          String passwordddddd="SUD@M@N";
          Statement stttt;

//System.out.println("Sudaman");

try{
		int counter = 1;
		Class.forName(driverrrr).newInstance();
		con = DriverManager.getConnection(urlaa+dbbb,userNameeeee,passwordddddd);
		String query = "select subject_name from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id = "  + id_batch + " and course_offered.semester = "+ semester;
			stttt = con.createStatement();
		ResultSet r21s = stttt.executeQuery(query);
		while(r21s.next()){
		
		 
	    //System.out.println(counter);%>
	    <tr>
	    	<td><%=counter %></td>
	    	<td>&nbsp;&nbsp;<%=r21s.getString(1)%></td>
	    	<td><select id="id" name="<%=r21s.getString("subject_name") %>">
	    				<option value="--Select--">----</option>
	    				<option value="F">F</option>
	    				<option value="D">D</option>
	    				<option value="C-">C-</option>
	    				<option value="C">C</option>
	    				<option value="C+">C+</option>
	    				<option value="B-">B-</option>
	    				<option value="B">B</option>
	    				<option value="B+">B+</option>
	    				<option value="A-">A-</option>
	    				<option value="A">A</option>
	    		</select>
			</td></tr>
	   		   			<%counter++;}
		 }
catch(Exception e){ e.printStackTrace();} con.close();%>
</table>
<p style="padding-top: 15px"><span> </span><input class="submit" type="submit" name="contact_submitted" value="ADD" ></p>
		    </div>
		        </form>
       		<P></P>
			<P></P>
	<form method="post" name="form">
	<table>
		<tr><th width="60" >&nbsp;&nbsp;Code</th><th width="200">&nbsp;&nbsp;Subject Name</th><th width="50">&nbsp;Grade</th><th>&nbsp;Exam Type</th><th></th></tr>
			<%
				
			try{	
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con_sem = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
				Statement sem_st = con_sem.createStatement();
				String sem_offer_query = "Select course_offered.offer_id from subject join course_offered on subject.subject_id = course_offered.subject_id where course_offered.batch_id ="+  id_batch + " and semester = " + 1;
				ResultSet sem_offer_result = sem_st.executeQuery(sem_offer_query);
				while(sem_offer_result.next())
				{
					
					   	Statement stmnt = con_sem.createStatement();
						String sem_query = "select subject.subject_code, subject.subject_name, marks.grade, marks.exam_type, marks.gradepoint from subject join course_offered on subject.subject_id = course_offered.subject_id join marks on course_offered.offer_id = marks.offer_id where marks.student_id =" + id + " and marks.exam_type = 'Regular' and course_offered.offer_id = " + sem_offer_result.getInt(1);
						ResultSet sem_result = stmnt.executeQuery(sem_query);
					
						while(sem_result.next())
						{  
								
						%>
			<tr>
			<td>&nbsp;<%=sem_result.getString(1)%></td>
			<td>&nbsp;&nbsp;<%=sem_result.getString(2)%></td>
			<td>&nbsp;&nbsp;<%=sem_result.getString(3)%></td>
			<td>&nbsp;&nbsp;<%=sem_result.getString(4)%></td>
			<td><input type="button" name="edit" value="Edit" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="editMarks(<%=id%>, <%=sem_offer_result.getInt(1) %>, <%=id_batch %>);" ></td>
			</tr>
			<%
						}}}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</form>		       
         
          </div>
   
        
        </div>
    </div>   
    <div id="content_footer"></div>
    <div id="footer">
       Copyright © sudaman | <a href="http://www.lacm.edu.np">LACM</a> 
</div>

</body>
</html>