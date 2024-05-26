<%@ page import="java.sql.*" %>
<% 
String uname = (String)session.getAttribute("uname");
String pwd = (String)session.getAttribute("pwd");
if(uname==null || pwd==null)
{
    response.sendRedirect("usession.html");
}
%>
<%

String opwd = request.getParameter("opwd");
String npwd = request.getParameter("npwd");

try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");  
	 System.out.println("Connection Established");
	  
	  PreparedStatement pstmt = con.prepareStatement("select * from manager where uname=? and pwd=?");
	  pstmt.setString(1,uname);
	  pstmt.setString(2,opwd);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		  PreparedStatement pstmt1 = con.prepareStatement("update manager set pwd=? where uname=?");
		  pstmt1.setString(1,npwd);
		  pstmt1.setString(2,uname);
		  int i = pstmt1.executeUpdate();
		  if(i>0)
		  {
			  %>
				<h3>Password Updated Successfully</h3><br>
		<a href="mlogin.html">Login Again</a>
				<% 
		  }
		  else
		  {
			  %>
			<h3>Password has not been updated</h3><br>
	<a href="changemanagerpwd.jsp">Try Again</a>
				<%   
		  }
	  }
	  else
	  {
		  %>
			<h3>Current Password is incorrect</h3><br>
	<a href="changemanagerpwd.jsp">Try Again</a>
			<% 
	  }
}
catch(Exception e)
{
	out.println(e);
}



%>