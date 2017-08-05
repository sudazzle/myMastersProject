<%@ page import="java.sql.*" %> 
<%
int id = Integer.parseInt(request.getParameter("id"));
int batch_id = Integer.parseInt(request.getParameter("batch_id"));
try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
           Statement st=con.createStatement();
           int i=st.executeUpdate("delete from student where id="+id);
           response.sendRedirect("addstudent.jsp?id=" + batch_id);
}
catch (Exception e){
System.out.println(e);
}
%>
