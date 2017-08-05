<%@page import="java.sql.*"%>

<%
try {

	String executeCmd ="C:\\Program Files (x86)\\MySQL\\MySQL Server 5.1\\bin\\mysqldump -u root -pSUD@M@N onlineresult -r C:/mysqlbackup/sudaman.sql";	
	Process runtimeProcess =Runtime.getRuntime().exec(executeCmd);
		int processComplete = runtimeProcess.waitFor();
		if(processComplete == 0)
		{
			response.sendRedirect("backupok.html");
		} 
		else 
		{
			response.sendRedirect("backupnotok.html");
		}
	
	//String dbName = “dbName”;
	//String dbUser = “dbUser”;
	//String dbPass = “dbPass”;

	//String executeCmd = “”;
	//executeCmd = new String[]{“/bin/sh”, “-c”, “mysql -u” + dbUser+ ” -p”+dbPass+” ” + dbName+ ” < backup.sql” };
	//}
	//Process runtimeProcess =Runtime.getRuntime().exec(executeCmd);
	//int processComplete = runtimeProcess.waitFor();
	//if(processComplete == 0){
	//out.println(“success”);
	//} else {
	//out.println(“restore failure”);
	//}

	
}
catch(Exception e){out.println(e); e.printStackTrace();}

%>
		 
		 

        
            			           			
            			
            			
            			
            			
            			
            			
            				