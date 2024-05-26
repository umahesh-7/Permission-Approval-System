<%@ page import="java.sql.*" %>
<%
String uname=(String)session.getAttribute("uname");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement p=con.prepareStatement("select * from permission ");
	ResultSet r=p.executeQuery();
	%>
	<h1 align=center>Manager home</h1>
	<h3 align=left>employee permissions</h3>
	<table border=2 align="center" style="height:150px;background-color:'aquamarine'">
	<tr><th>Uname</th><th>Permission ID</th><th>Permission Category</th><th>Start Date</th><th>End Date</th><th>Duration</th><th>Reason</th>
	<th>Status 1</th><th>Status 2</th><th>Final Status</th></tr>
	<%
	while(r.next())
	{
		%><tr>
		<td><%=r.getString("uname") %></td>
		<td><%=r.getString("permission_id") %></td>
		<td><%=r.getString("permission_category") %></td>
		<td><%=r.getString("start_date") %></td>
		<td><%=r.getString("end_date") %></td>
		<td><%=r.getString("duration") %></td>
		<td><%=r.getString("reason") %></td>
		<td><%=r.getString("status1") %></td>
		<td><%=r.getString("status2") %></td>
		<td><%=r.getString("final_status") %></td>
		<td><a href="maccept.jsp?uname=<%=r.getString("uname")%>">Accept</a></td>
		<td><a href="mreject.jsp?uname=<%=r.getString("uname")%>">Reject</a></td></tr>
		
		<%
	}
	%>
	</table>
	<%
	
	
}
catch(Exception e)
{
	System.out.println(e);
}
%>