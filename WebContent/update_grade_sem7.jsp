<%@page import="java.sql.*"%>
<%

int marks_id = Integer.parseInt(request.getParameter("marks_id"));
System.out.println(marks_id);
int student_id = Integer.parseInt(request.getParameter("student_id"));
int batch_id = Integer.parseInt(request.getParameter("batch_id"));
float gradepoint = 0;
String grade = request.getParameter("grade");
if(grade.contentEquals("F")) gradepoint = 0f;
else if(grade.contentEquals("D")) gradepoint = 1f;
else if(grade.contentEquals("C-")) gradepoint = 1.7f;
else if(grade.contentEquals("C")) gradepoint = 2f;
else if(grade.contentEquals("C+")) gradepoint = 2.3f;
else if(grade.contentEquals("B-")) gradepoint = 2.7f;
else if(grade.contentEquals("B")) gradepoint = 3f;
else if(grade.contentEquals("B+")) gradepoint = 3.3f;
else if(grade.contentEquals("A-")) gradepoint = 3.7f;
else gradepoint = 4f;

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/onlineresult", "root", "SUD@M@N");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update marks set grade='"+grade+"', gradepoint="+gradepoint+ " where marks_id="+marks_id);
response.sendRedirect("insertgradesem7.jsp?id="+student_id +"&id_batch=" + batch_id);

}
catch(Exception e){
System.out.println(e);
}
%>
