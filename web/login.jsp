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
        <link rel="stylesheet" href="CSS/main.css"> 
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="content">
        <h2>Login</h2>
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
            </table>
        </form>
        </div>
        <jsp:include page="endNote.jsp" />
    </body>
</html>
