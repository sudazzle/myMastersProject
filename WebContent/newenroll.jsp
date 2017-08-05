<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='editbatch.jsp?id='+id;
    f.submit();
}
function addRecord(id){
    var f=document.form;
    f.method="post";
    f.action='addstudent.jsp?id='+id;
    f.submit();
}
function validateForm()
{
	var start=document.forms["new_batch"]["start"].value
	var end = document.forms["new_batch"]["end"].value
	var program = document.forms["new_batch"]["program"].value
	if (start==null || start=="")
  	{
		if (end==null || end=="")
		{
			if (program=="" || program==null)
			{
				alert("PLEASE FILL ALL THE REQUIRED FIELD");
				return false;
			}
			
			alert("PLEASE ENTER START AND END YEAR OF THE BATCH");
			return false;
		}
		alert("PLEASE ENTER THE START YEAR OF THE BATCH");
  		return false;
  		
  	}
	if (end==null || end=="")
	{
		if (program=="" || program==null)
		{
			alert("PLEASE ENTER END YEAR AND PROGRAM");
			return false;
		}
		
		alert("PLEASE ENTER THE END YEAR OF THE BATCH");
		return false;
	}
	if (program=="" || program==null)
	{
		alert("PLEASE SELECT THE PROGRAM");
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
<title>Online Result System</title><meta name="description" content="website description"><meta name="keywords" content="website keywords, website keywords"><meta http-equiv="content-type" content="text/html; charset=windows-1252"><link rel="stylesheet" type="text/css" href="style.css" title="style"></head><body>
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
        <h4>ADD NEW BATCH</h4>
             <form name = "new_batch" action="insertbatch.jsp" method="post" onsubmit="return validateForm()">
             <div class="form_settings1">
            <p><span>START YEAR</span><input type="text" name="start"></p>
            <p><span>END YEAR</span><input type="text" name="end"></p>
            <p><span>PROGRAM</span><select id="id" name="program"><option value="">Select</option><option value="BBA">BBA</option><option value="BBIS">BBIS</option><option value="BHTM">BHTM</option></select></p>
            <p style="padding-top: 15px"><span> </span><input class="submit" type="submit" name="contact_submitted" value="ADD" ></p>
          </div>
        </form>
        
        
<form method="post" name="form">
	<table>
		<tr><th width="40" >&nbsp;&nbsp;Start</th><th width="40">&nbsp;&nbsp;End</th><th width="50">&nbsp;Program</th><th></th><th></th>
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
						String query = "select * from  batch order by Batch_Id desc";
						st = con.createStatement();
						ResultSet rs = st.executeQuery(query);
						while(rs.next()){
			%>
<tr><td>&nbsp;&nbsp;<%=rs.getString(2)%></td>
<td>&nbsp;&nbsp;<%=rs.getString(3)%></td>
<td>&nbsp;&nbsp;<%=rs.getString(4)%></td>

<td><input type="button" name="edit" value="Edit" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
<td><input type="button" name="enroll" value="Enroll Student" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecord(<%=rs.getString(1)%>);" ></td>

</tr>
<%
}
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