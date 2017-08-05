<%@page import="java.sql.*"%>
<%
int batch_id = Integer.parseInt(request.getParameter("batch_id"));
int id = Integer.parseInt(request.getParameter("id"));
String reg_no=request.getParameter("Reg_No");
String std_name=request.getParameter("Student_Name");
String gender=request.getParameter("Gender");
String status=request.getParameter("Status");
try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update Student set Reg_No='"+reg_no+"',Student_Name='"+std_name+"',Gender= '"+gender+"', Status='"+status+"' where id="+id);
response.sendRedirect("addstudent.jsp?id=" + batch_id);
}
catch(Exception e){
System.out.println(e);
}
%>
