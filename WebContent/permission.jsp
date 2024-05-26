<%@ page import="java.sql.*" %>

<%
String uname=(String)session.getAttribute("uname");
String category = request.getParameter("category");
String sdate = request.getParameter("sdate");
String edate = request.getParameter("edate");
String duration = request.getParameter("duration");
String reason = request.getParameter("reason");

int permission_id = (int)(Math.random() * 99999 + 1);

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");  
System.out.println("Connection Established");

PreparedStatement pstmt = con.prepareStatement("insert into permission values(?,?,?,?,?,?,?,?,?,?)");

pstmt.setInt(1, permission_id );
pstmt.setString(2, category);
pstmt.setString(3, sdate);
pstmt.setString(4, edate);
pstmt.setString(5, duration);
pstmt.setString(6, reason);
pstmt.setString(7,"PROCESSING");
pstmt.setString(8,"PROCESSING");
pstmt.setString(9, "PROCESSING");
pstmt.setString(10,uname);


int i = pstmt.executeUpdate();

if(i>0)
{
session.setAttribute("permission_id",permission_id);
response.sendRedirect("employeehome.jsp");
}
else
{
%>
<h3>User permission UnSuccessful</h3><br>
<a href="signup.html">Try to Register Again</a>
<%
}

PreparedStatement pstmt1 = con.prepareStatement("select * from permission");
 pstmt1.setInt(1,permission_id);
 
 ResultSet rs = pstmt1.executeQuery();
 if(rs.next())
 {
   
 session.setAttribute("permission_id",permission_id);
 }
}
catch(Exception e)
{
out.println(e);
}

%>
