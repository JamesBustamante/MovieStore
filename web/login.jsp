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
    String validEmail = (String) request.getAttribute("emailErr");  //get error reason from loginAction page
    String validPassword = (String) request.getAttribute("passErr");

    if (validEmail == null) {  //validEmail/validPassword by default are null, converted to empty string so it doesn't display on page
        validEmail = "";
    } else {
        validEmail = validEmail;
    }

    if (validPassword == null) {
        validPassword = "";
    } else {
        validPassword = validPassword;
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
                        <td><input name="email" type="text" value=""></td>

                        <td><%=validEmail%></td> <%-- validation error from loginAction if incorrect login --%>

                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input name="password" type="password" value=""></td>

                        <td><%=validPassword%></td> <%-- validation error from loginAction if incorrect login --%>

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
