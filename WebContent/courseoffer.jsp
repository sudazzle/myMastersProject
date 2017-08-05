<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">

function deleteRecord(id, subject_id){
    var f=document.form;
    f.method="post";
    f.action='delete_offer.jsp?id='+id + '&subject_id='+subject_id;
    f.submit();
}
function validateForm()
{
	var semester =document.forms["offer"]["semester"].value
	var batch = document.forms["offer"]["batch"].value
	  
	if (batch==null || batch=="")
	{
		if (semester=="" || semester==null)
		{
			alert("PLEASE ENTER ALL THE REQUIRED FIELDS");
			return false;
		}
		
		alert("PLEASE SELECT THE BATCH");
		return false;
	}
	if (semester=="" || semester==null)
	{
		alert("PLEASE SELECT THE SEMESTER");
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
        <h4>OFFER COURSE</h4>
             <form name = "offer" action="insertoffer.jsp" method="post" onsubmit = "return validateForm()">
          <div class="form_settings">
          
          <p><span><b>SUBJECT</b></span><b><input type="text" name="subject" value="<%
					String id=request.getParameter("id");
        			try {
							
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
							String query = "select subject_name from subject where subject_id="+ id;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next()){
								out.println(rs.getString(1));
							}
							conn.close();
						}
						catch(Exception e){out.println(e);} 
					%>"></b></p>
          	<p><span>BATCH</span><select name="batch"><option value="">--SELECT--</option>
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
            			String str = rs.getString("Start_Date") + "-"+ rs.getString("End_Date") + " (" + rs.getString("Program") + ")";
            			System.out.println(str);
			%>
    			<option value="<%=str%>"><%=str%></option>
    		<%
					}}
						catch(Exception e){
						e.printStackTrace();
					} con.close();
						
			%></select></p>
			<p><span>SEMESTER</span><select id="id" name="semester"><option value="">--SELECT--</option><option value="1">ONE</option><option value="2">TWO</option><option value="3">THREE</option><option value="4">FOUR</option><option value="5">FIVE</option><option value="6">SIX</option><option value="7">SEVEN</option><option value="8">EIGHT</option></select></p>
            <p style="padding-top: 15px"><span> </span><input class="submit" type="submit" name="contact_submitted" value="OFFER" ></p>
          </div>
        </form>
        
<form method="POST" name="form">
<table>
<tr><th width="100" >&nbsp;&nbsp;BATCH</th><th width="100" >&nbsp;&nbsp;PROGRAM</th><th width="100">&nbsp;&nbsp;SEMESTER</th><th width="300">&nbsp;&nbsp;SUBJECT</th><th></th>
<%
	Connection conn = null;
	String url2 = "jdbc:mysql://localhost:8888/";
	String db2 = "resultmgmt";
	String driver2 = "com.mysql.jdbc.Driver";
	String userName2 ="root";
	String password2="SUD@M@N";
	Statement st1;
	try{
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url+db,userName,password);
			String query1 = "select START_DATE, END_DATE, PROGRAM, SEMESTER, SUBJECT_NAME, offer_id from BATCH, COURSE_OFFERED, subject where batch.batch_id = course_offered.batch_id and subject.subject_id = course_offered.subject_id ";
			st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(query1);
			
			while(rs1.next()){ 
%>
<tr><td>&nbsp;&nbsp;<%=rs1.getString(1)%>-<%=rs1.getString(2)%></td>
<td>&nbsp;&nbsp;<%=rs1.getString(3)%></td>
<td>&nbsp;&nbsp;<%=rs1.getString(4)%></td>
<td>&nbsp;&nbsp;<%=rs1.getString(5)%></td>
<td><input type="button" name="delete" value="Delete" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="deleteRecord(<%=rs1.getString(6)%>, <%=id %>);" ></td>
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