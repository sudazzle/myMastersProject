<%@page import="java.sql.*"%>
<%
int batch_id = Integer.parseInt(request.getParameter("batch_id"));
int start = Integer.parseInt(request.getParameter("start"));
int  end= Integer.parseInt(request.getParameter("end"));
String program=request.getParameter("program");

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update batch set start_date="+start+", end_date="+end+",program= '"+program+"' where batch_id="+batch_id);
response.sendRedirect("newenroll.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>
