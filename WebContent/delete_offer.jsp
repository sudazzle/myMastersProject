<%@ page import="java.sql.*" %> 
<%
int id = Integer.parseInt(request.getParameter("id"));
int subject_id = Integer.parseInt(request.getParameter("subject_id"));
try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
           Statement st=con.createStatement();
           int i=st.executeUpdate("delete from course_offered where offer_id="+id);
           response.sendRedirect("courseoffer.jsp?id="+subject_id);
}
catch (Exception e){
System.out.println(e);
}
%>
