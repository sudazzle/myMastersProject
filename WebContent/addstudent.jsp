<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
function editstudent(id1, id){
   var f = document.form;
	f.method="post";
   f.action='editstudent.jsp?id='+id1 + '&batch_id=' + id;
     f.submit();
}
function deleteRecord(id1, id){
    var f=document.form;
    f.method="post";
    f.action='delete_student.jsp?id='+id1 + '&batch_id=' + id;
    f.submit();
}
function validateForm()
{
	var registration =document.forms["student"]["registration"].value
	var name = document.forms["student"]["name"].value
	var gender = document.forms["student"]["gender"].value
	if (registration==null || registration=="")
  	{
		if (name==null || name=="")
		{
			if (gender=="" || gender==null)
			{
				alert("PLEASE FILL ALL THE REQUIRED FIELD");
				return false;
			}
			
			alert("PLEASE REGISTRATION NUMBER AND NAME OF THE STUDENT");
			return false;
		}
		alert("PLEASE ENTER THE REGISTRATION NUMBER");
  		return false;
  		
  	}
	if (name==null || name=="")
	{
		if (gender=="" || gender==null)
		{
			alert("PLEASE ENTER THE NAME OF THE STUDENT AND HIS/HER GENDER");
			return false;
		}
		
		alert("PLEASE ENTER THE NAME OF STUDENT");
		return false;
	}
	if (gender=="" || gender==null)
	{
		alert("PLEASE SELECT THE GENDER OF THE STUDENT");
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
  String id = null;%>
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
        <ul id="menu"><!-- put class="selected" in the li tag for the selected page - to highlight which page you're on --><li class = "selected"><a href = "newenroll.jsp">Enroll Student</a></li><li><a href = "adminpage.html">admin</a></li><li><a href = "index.html">Sign Out</a></li>
       
        </ul></div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
        <div id="content">
        <!-- insert the page content here -->
        <h4>ADD NEW STUDENT</h4>
             <form name = "student" action="insertstudent.jsp" method="post" onsubmit="return validateForm()">
          <div class="form_settings">
           <p><span><b>BATCH</b></span><b><input type="text" name="batch" value="<%
					id=request.getParameter("id");
        			System.out.println(id);
					try {
							
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							String start, end;
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
							String query = "select Start_date, End_date from batch where Batch_id="+ id;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next()){
								start = rs.getString(1);
								end = rs.getString(2);
								out.println(start + "-" + end);
							}
							conn.close();
						}
						catch(Exception e){out.println(e);} 
					%>"></b></p>
          	<p><span><b>PROGRAM</b></span><b><input type="text" name="program" value="<%
					//String id=request.getParameter("id");
        			//out.println(id);
					try {
							
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							String start, end;
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
							String query = "select program from batch where Batch_id="+ id;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next()){
								out.println(rs.getString(1));
								program = rs.getString(1);
							}
							conn.close();
						}
						catch(Exception e){out.println(e);} 
					%>"></b></p>
					<p><span>REG. NO.</span><input type="text" name="registration"></p>
            		<p><span>NAME</span><input type="text" name="name"></p>
            		<p><span>GENDER</span><select id="id" name="gender"><option value="">-Select-</option><option value="MALE">MALE</option><option value="FEMALE">FEMALE</option></select></p>
           
            
            <p style="padding-top: 15px"><span> </span><input class="submit" type="submit" name="contact_submitted" value="ADD" ></p>
          </div>
        </form>
    <P></P>
    <P></P>
    <P></P>
<form method="post" name="form">
<table>
<tr><th width="100" >&nbsp;&nbsp;Reg. No.</th><th width="200">&nbsp;&nbsp;Student Name</th><th width="70">&nbsp;&nbsp;Gender</th><th width="70">&nbsp;&nbsp;Status</th><th></th><th></th>
<%
	Connection conn = null;
	String url2 = "jdbc:mysql://localhost:8888/";
	String db2 = "onlineresult";
	String driver2 = "com.mysql.jdbc.Driver";
	String userName2 ="root";
	String password2="SUD@M@N";
	Statement st1;
	try{
			Class.forName(driver2).newInstance();
			conn = DriverManager.getConnection(url2+db2,userName2,password2);
			String query1 = "select id, Reg_No, Student_Name, Gender, Status from Student where batch_id =" + id;
			st1 = conn.createStatement();
			ResultSet rs1 = st1.executeQuery(query1);
			
			while(rs1.next()){ 
%>
<tr><td>&nbsp;&nbsp;<%=rs1.getString(2)%></td>
<td>&nbsp;&nbsp;<%=rs1.getString(3)%></td>
<td>&nbsp;&nbsp;<%=rs1.getString(4)%></td>
<td>&nbsp;&nbsp;<%=rs1.getString(5)%></td>
<td><input type="button" name="edit" value="Edit" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="editstudent(<%=rs1.getString(1)%>, <%=id%>);"></td>
<td><input type="button" name="delete" value="Delete" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="deleteRecord(<%=rs1.getString(1)%>, <%=id%>);" ></td>
</tr>
<%
}conn.close();
%>
<%
}
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