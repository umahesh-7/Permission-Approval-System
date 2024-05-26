<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String uname = request.getParameter("uname");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String pwd = request.getParameter("pwd");

int id = (int)(Math.random() * 99999 + 1);

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");  
	 System.out.println("Connection Established");

	 PreparedStatement ps = con.prepareStatement("select * from employee where uname=? or email=?");
	 ps.setString(1, uname);
	 ps.setString(2, email);
	 
	 ResultSet rs = ps.executeQuery();
	 
	 if(rs.next())
	 {
		 %>
			<h3>Email Id / Username already available</h3><br>
	<a href="reg.html">Try Again</a>
			<%  
	 }
	 else
	 {
		 PreparedStatement pstmt = con.prepareStatement("insert into employee values(?,?,?,?,?,?)");
		 
		 pstmt.setInt(1, id);
		 pstmt.setString(2, name);
		 pstmt.setString(3, uname);
		 pstmt.setString(4, email);
		 pstmt.setString(5, gender);
		 pstmt.setString(6, pwd);
		
		 
		 int i = pstmt.executeUpdate();
		 
		 if(i>0)
		 {
			%>
			<h3>Employee Registration Successful</h3><br>
	<a href="Elogin.html">Go to Login</a>
			<% 
		 }
		 else
		 {
				%>
				<h3>Employee Registration UnSuccessful</h3><br>
		<a href="pa.html">Try to Register Again</a>
				<% 
		 }
		
	 }
	 
	 
	 
	 
}
catch(Exception e)
{
	out.println(e);
}

%>