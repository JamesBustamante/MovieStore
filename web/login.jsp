<%-- 
    Document   : login
    Created on : 05/09/2018, 6:29:36 PM
    Author     : james
--%>

<%@page import="uts.controller.Validator"%>
<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String validEmail = request.getParameter("emailErr");
    String validPassword = (String) request.getAttribute("passErr");

    if (validEmail == null) {
        validEmail = "";
    } else {
        validEmail = "emailErr";
    }

    if (validPassword == null) {
        validPassword = "";
    } else {
        validPassword = "passErr";
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/main.css"> 
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <jsp:useBean id="Validator" class="uts.controller.Validator" scope="application"/>



        <div class="content">
            <h2>Login</h2>
            <form action="loginAction.jsp" method="post">
                <table>
                    <tr>
                        <td>Email</td>
                        <td><input name="email" type="email" value=""></td>


                        <td><%=validEmail%></td>


                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input name="password" type="password" value=""></td>

                        <td><%=validPassword%></td>

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
