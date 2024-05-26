<%@ page import="java.sql.*" %>
<%

String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");

try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");  
	 System.out.println("Connection Established");
	  
	  PreparedStatement pstmt = con.prepareStatement("select * from manager where uname=? and pwd=?");
	  pstmt.setString(1,uname);
	  pstmt.setString(2,pwd);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		 
		 session.setAttribute("uname", uname);
		 session.setAttribute("pwd", pwd);
		 session.setMaxInactiveInterval(100);
		 response.sendRedirect("managerhome.jsp");
	  }
	  else
	  {
		  %>
			<h3>Login Failed</h3><br>
	<a href="mlogin.html">Try Again</a>
			<% 
	  }
}
catch(Exception e)
{
	out.println(e);
}



%>