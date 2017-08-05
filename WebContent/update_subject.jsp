<%@page import="java.sql.*"%>
<%

int id = Integer.parseInt(request.getParameter("id"));
String subject_code=request.getParameter("subject_code");
String subject_Name=request.getParameter("Subject_Name");
int subject_credit= Integer.parseInt(request.getParameter("Subject_credit"));

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update Subject set subject_code='"+subject_code+"',Subject_Name='"+subject_Name+"',Subject_credit= "+subject_credit+ " where subject_id="+id);
response.sendRedirect("addsubject.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>
