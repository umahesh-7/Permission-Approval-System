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
    <body bgcolor="white">
        <h3 align=center>Welcome&nbsp;&nbsp;<%=uname%></h3>
        <hr color="green"><hr color="green"><br>
        <a href="leaderhome.jsp">Home</a><br>;
        <a href="changeleaderpwd.jsp">Change Password</a><br>;
        <a href="ulogout.jsp">Logout</a>
        <br><br>
<br><fieldset width="150">
      <legend><strong style="color:green"><i>Change Password</i></strong></legend>
  <form method="post" action="changeleaderpwd1.jsp">
      
      <table align="center" width="40%" height="20%">
      
         
          <tr>
              <td><b>Enter Old Password</b></td>
              <td><input type="password" name="opwd" required></td>
          </tr>
           <tr>
              <td><b>Enter New Password</b></td>
              <td><input type="password" name="npwd" required></td>
          </tr>
            <tr>
              <td align="center"><input type="submit" value="Change"></td>
              <td align="center"><input type="reset" value="Clear"></td>
          </tr>
      </table>
      
  </form>  
  </fieldset>





</body>
</html>



