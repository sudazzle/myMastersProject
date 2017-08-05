<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
function displaybackpaperinfo(id){
    var f=document.form;
    f.method="post";
    f.action='displaybackpaperinfo_student_select.jsp?id='+id;
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
        <ul id="menu"><!-- put class="selected" in the li tag for the selected page - to highlight which page you're on --><li class = "selected"><a href = "displaybackpaper_select.jsp">BACKPAPER INFO</a></li><li><a href = "adminpage.html">admin</a></li><li><a href = "index.html">Sign Out</a></li>
       
        </ul></div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
        <div id="content">
        <!-- insert the page content here -->
        <h4>SELECT BATCH</h4>
              
<form method="post" name="form">
	<table>
		<tr><th width="40" >START</th><th width="40">END</th><th width="50">PROGRAM</th><th></th></tr>
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

<td><input type="button" name="SELECT" value="SELECT" style="background-image:url(logo1.jpg);color:black; padding:2px 10px 2px 10px" onclick="displaybackpaperinfo(<%=rs.getString(1)%>);" ></td>

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