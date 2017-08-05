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
        <h4>EDIT STUDENT INFORMATION</h4>
<form method="post" action="update_student.jsp">
<table>
<tr><th>Reg. No.</th><th>Student Name</th><th width = "10">Gender</th><th>Status<th></th></tr>
<%
String id=request.getParameter("id");
String batch_id = request.getParameter("batch_id");

try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
String query = "select id, Reg_no, Student_Name, Gender, Status from  Student where id="+id;
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>

<td><input type="text" name="Reg_No" value="<%=rs.getString("Reg_No")%>"></td>
<td><input type="text" name="Student_Name" value="<%=rs.getString("Student_Name")%>"></td>
<td><input type="text" name="Gender" value="<%=rs.getString("Gender")%>"></td>
<td><input type="text" name="Status" value="<%=rs.getString("Status")%>"></td>

<td><input type="submit" name="Submit" value="Edit" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px;" ></td>
<td><input type="hidden" name="id" value="<%=rs.getString("id")%>"></td>
<td><input type="hidden" name="batch_id" value="<%=batch_id%>"></td>
</tr>
<%
}conn.close();
}
catch(Exception e){}

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

