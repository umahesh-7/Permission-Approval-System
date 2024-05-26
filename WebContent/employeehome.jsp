<%
String name = (String)session.getAttribute("name");
String uname = (String)session.getAttribute("uname");
String pwd = (String)session.getAttribute("pwd");
if(name==null || uname==null || pwd==null)
{
    response.sendRedirect("usession.html");
}
%>
<html>
    <head>
        
    </head>
    <body bgcolor="aquamarine">
        <h3 align=center>Welcome&nbsp;&nbsp;<%=uname%></h3>
        <hr color="green"><hr color="green"><br>
        <a href="employeehome.jsp">Home</a><br><br><br><br>
        <a href="changepwd.jsp">Change Password</a><br><br><br><br>
       <a href="permissionform.html" >Raise permission</a><br><br><br><br>
        <a href="eperm.jsp">View permissions</a><br><br><br><br>
        <a href="ulogout.jsp">Logout</a><br>
        <br><br>
    </body>
</html>