<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
        <ul id="menu"><!-- put class="selected" in the li tag for the selected page - to highlight which page you're on --><li class = "selected"><a href = "">Add Grade</a></li><li><a href = "adminpage.html">admin</a></li><li><a href = "index.html">Sign Out</a></li>
       
        </ul></div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
        <div id="content">
        <!-- insert the page content here -->
        <h4>ADD GRADE</h4>
             <form action="insertgrade.jsp" method="post">
          <div class="form_settings">
          <p><span>BATCH</span><select name="batch"><option value="--Select--">--Select--</option>
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
			%>
    			<option value="<%=str%>"><%=str%></option>
    		<%
					}}
						catch(Exception e){
						e.printStackTrace();
					}
						
			%></select></p>
          	<p><span>SEMESTER</span><select id="id" name="semester"><option value="--Select--">--Select--</option><option value="1">ONE</option><option value="2">TWO</option><option value="3">THREE</option><option value="4">FOUR</option><option value="5">FIVE</option><option value="6">SIX</option><option value="7">SEVEN</option><option value="8">EIGHT</option></select></p>
             	<p><span>EXAM TYPE</span><select id="id" name="EXAM TYPE"><option value="--Select--">--Select--</option><option value="REGULAR">REGULAR</option><option value="BACK PAPER">BACK PAPER</option><option value="GPA MAKEUP">GPA MAKEUP</option></select></p>
              		            
            <p style="padding-top: 15px"><span> </span><input class="submit" type="submit" name="contact_submitted" value="ADD" ></p>
          </div>
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