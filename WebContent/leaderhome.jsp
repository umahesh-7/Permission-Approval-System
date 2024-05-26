<%
String uname = (String)session.getAttribute("uname");
String pwd = (String)session.getAttribute("pwd");
if(uname==null || pwd==null)
{
    response.sendRedirect("usession.html");
}
%>
<html>
    <head>
        
    </head>
    <body bgcolor="aquamarine">
        <h3 align=center>Welcome&nbsp;&nbsp;<%=uname%></h3>
        <hr color="green"><hr color="green"><br><br><br><br>
        <a href="leaderhome.jsp">Home</a><br><br><br><br>
        <a href="changeleaderpwd.jsp">Change Password</a><br><br><br><br>
       <a href="lperm.jsp">View permissions</a><br><br><br><br>
        <a href="ulogout.jsp">Logout</a>
        <br><br>
    </body>
</html>