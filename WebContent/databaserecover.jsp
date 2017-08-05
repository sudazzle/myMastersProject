<%@page import="java.sql.*"%>

<%
try {


	String executeCmd ="C:\\Program Files (x86)\\MySQL\\MySQL Server 5.1\\bin\\mysql --user= root --password = SUD@M@N onlineresult < source C:/mysqlbackup/sudaman.sql";	
	Process runtimeProcess =Runtime.getRuntime().exec(executeCmd);
		int processComplete = runtimeProcess.waitFor();
		if(processComplete == 0){
			out.println("success");
			} else {
			out.println("restore failure");
			}


	
	
}
catch(Exception e){out.println(e); e.printStackTrace();}

%>
		 
		 

        
            			           			
            			
            			
            			
            			
            			
            			
            				