<%-- 
    Document   : login
    Created on : 05/09/2018, 6:29:36 PM
    Author     : james
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="loginAction.jsp" method="post"><table>
            <tr>
            <td>Email</td>
            <td><input name="email" type="text" value=""></td>
              </tr>
       <tr>
            <td>Password</td>
            <td><input name="password" type="password" value=""></td>
        </tr>
       <tr>
        <td></td>
        <td><input value="Login" type="submit"></td>
        </tr>   
      </table></form>
    </body>
</html>
