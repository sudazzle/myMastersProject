<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
function addRecordsem1(id, id_batch){
   var f = document.form;
	f.method="post";
   f.action='insertgradesem1.jsp?id='+id + '&id_batch=' + id_batch;
     f.submit();
}
function addRecordsem2(id, id_batch){
	   var f = document.form;
		f.method="post";
	   f.action='insertgradesem2.jsp?id='+id + '&id_batch=' + id_batch;
	     f.submit();
}
function addRecordsem3(id, id_batch){
	   var f = document.form;
		f.method="post";
	   f.action='insertgradesem3.jsp?id='+id + '&id_batch=' + id_batch;
	     f.submit();
}
function addRecordsem4(id, id_batch){
	   var f = document.form;
		f.method="post";
	   f.action='insertgradesem4.jsp?id='+id + '&id_batch=' + id_batch;
	     f.submit();
}
function addRecordsem5(id, id_batch){
	   var f = document.form;
		f.method="post";
	   f.action='insertgradesem5.jsp?id='+id + '&id_batch=' + id_batch;
	     f.submit();
}
function addRecordsem6(id, id_batch){
	   var f = document.form;
		f.method="post";
	   f.action='insertgradesem6.jsp?id='+id + '&id_batch=' + id_batch;
	     f.submit();
}
function addRecordsem7(id, id_batch){
	   var f = document.form;
		f.method="post";
	   f.action='insertgradesem7.jsp?id='+id + '&id_batch=' + id_batch;
	     f.submit();
}
function addRecordsem8(id, id_batch){
	   var f = document.form;
		f.method="post";
	   f.action='insertgradesem8.jsp?id='+id + '&id_batch=' + id_batch;
	     f.submit();
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
  String id_batch = null;%>
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
        <ul id="menu"><!-- put class="selected" in the li tag for the selected page - to highlight which page you're on --><li class = "selected"><a href = "MARKSSELECT.jsp">INSERT GRADE</a></li><li><a href = "adminpage.html">admin</a></li><li><a href = "index.html">Sign Out</a></li>
       
        </ul></div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
        <div id="content">
        <!-- insert the page content here -->
        <h1><B>REGULAR EXAM GRADE RECORD</B></h1>
        
             <form method="post" name="form">
          <div class="form_settings">
           <p><span>BATCH</span><input type="text" name="batch" value = "<%
					id_batch = request.getParameter("id");
        			System.out.println(id_batch);
					try {
							
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							String start, end;
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
							String query = "select Start_date, End_date from batch where Batch_id="+ id_batch;
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
					%>"></p>
          	<p><span>PROGRAM</span><input type="text" name="program" value = "<%
					//String id=request.getParameter("id");
        			//out.println(id);
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
					%>">
					            
           </div>
      
        <p></p>
        <p></p>
       
        

<table>
<tr><th width="100" >&nbsp;&nbsp;Reg. No.</th><th width="200">&nbsp;&nbsp;Student Name</th><th>S</th><th>E</th><th>M</th><th>E</th><th>S</th><th>T</th><th>E</th><th>R</th></tr>
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
			String query1 = "select id, Reg_No, Student_Name, Gender, Status from Student where batch_id =" + id_batch;
			st1 = conn.createStatement();
			ResultSet rs1 = st1.executeQuery(query1);
			
			while(rs1.next()){ 
%>
<tr><td>&nbsp;&nbsp;<%=rs1.getString(2)%></td>
<td>&nbsp;&nbsp;<%=rs1.getString(3)%></td>
<td><input type="button" name="sem1" value="1" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecordsem1(<%=rs1.getString(1)%>,<%=id_batch %>);" ></td>
<td><input type="button" name="sem2" value="2" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecordsem2(<%=rs1.getString(1)%>,<%=id_batch %>);" ></td>
<td><input type="button" name="sem3" value="3" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecordsem3(<%=rs1.getString(1)%>,<%=id_batch %>);" ></td>
<td><input type="button" name="sem4" value="4" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecordsem4(<%=rs1.getString(1)%>,<%=id_batch %>);" ></td>
<td><input type="button" name="sem5" value="5" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecordsem5(<%=rs1.getString(1)%>,<%=id_batch %>);" ></td>
<td><input type="button" name="sem6" value="6" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecordsem6(<%=rs1.getString(1)%>,<%=id_batch %>);" ></td>
<td><input type="button" name="sem7" value="7" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecordsem7(<%=rs1.getString(1)%>,<%=id_batch %>);" ></td>
<td><input type="button" name="sem8" value="8" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="addRecordsem8(<%=rs1.getString(1)%>,<%=id_batch %>);" ></td>

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