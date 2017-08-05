<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
function editsubject(id){
   var f = document.form;
	f.method="post";
   f.action='editsubject.jsp?id='+id;
     f.submit();
}
function courseoffer(id){
    var f=document.form;
    f.method="post";
    f.action='courseoffer.jsp?id='+id;
    f.submit();
}
function validateForm()
{
	var subjectcode =document.forms["subject"]["subjectcode"].value
	var subjectname = document.forms["subject"]["subjectname"].value
	var credithour = document.forms["subject"]["credithour"].value
	if (subjectcode==null || subjectcode=="")
  	{
		if (subjectname==null || subjectname=="")
		{
			if (credithour=="" || credithour==null)
			{
				alert("PLEASE FILL ALL THE REQUIRED FIELD");
				return false;
			}
			
			alert("PLEASE ENTER CODE AND THE SUBJECT NAME");
			return false;
		}
		alert("PLEASE ENTER THE SUBJECT CODE");
  		return false;
  		
  	}
	if (subjectname==null || subjectname=="")
	{
		if (credithour=="" || credithour==null)
		{
			alert("PLEASE ENTER NAME OF THE SUBJECT AND ITS CREDIT HOURS");
			return false;
		}
		
		alert("PLEASE ENTER THE NAME OF THE SUBJECT");
		return false;
	}
	if (credithour=="" || credithour==null)
	{
		alert("PLEASE ENTER THE CREDIT HOURS");
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
  padding: Spx 5 5px 5px;
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
        <ul id="menu"><!-- put class="selected" in the li tag for the selected page - to highlight which page you're on --><li class = "selected"><a href = "addsubject.jsp">ADD SUBJECT</a></li><li><a href = "adminpage.html">admin</a></li><li><a href = "index.html">Sign Out</a></li>
       
        </ul></div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
        <div id="content">
        <!-- insert the page content here -->
        <h4>ADD NEW SUBJECT</h4>
             <form name = "subject" action="insertsubject.jsp" method="post" onsubmit = "return validateForm()">
          <div class="form_settings">
          	<p><span>SUBJECT CODE</span><input type="text" name="subjectcode"></p>
            <p><span>SUBJECT NAME</span><input type="text" name="subjectname"></p>
            <p><span>CREDIT HOURS</span><input type="text" name="credithour"></p>
            <p style="padding-top: 15px"><span> </span><input class="submit" type="submit" name="contact_submitted" value="ADD" ></p>
          </div>
        </form>
        
        
<form method="post" name="form">
<table>
<tr><th width="80" >&nbsp;&nbsp;CODE</th><th width="300">&nbsp;&nbsp;SUBJECT NAME</th><th width="70">&nbsp;&nbsp;CR. HRS</th><th></th><th></th>
<%
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
			String query = "select * from Subject order by subject_id desc";
			st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()){ 
%>
<tr><td>&nbsp;&nbsp;<%=rs.getString(2)%></td>
<td>&nbsp;&nbsp;<%=rs.getString(3)%></td>
<td>&nbsp;&nbsp;<%=rs.getString(4)%></td>
<td><input type="button" name="edit" value="Edit" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="editsubject(<%=rs.getString(1)%>);"></td>
<td><input type="button" name="offer" value="Offer" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="courseoffer(<%=rs.getString(1)%>);" ></td>
</tr>
<%
}con.close();
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