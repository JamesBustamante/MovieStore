<%-- 
    Document   : purchaseOrderUserCheck
    Created on : 07/10/2018, 9:13:10 PM
    Author     : William
--%>
<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/main.css"> 
        <title>Import</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieStoreUserApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
            <jsp:setProperty name="movieStoreUserApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>         
        <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>        
        <jsp:include page="header.jsp" />

        <% User user = (User) session.getAttribute("user");
            if (user != null) {
                response.sendRedirect("purchaseOrder.jsp");
            } else { %>

            <div class="content">
                <h2>Login</h2>
                <p>You must be logged in before continuing with your purchase. Please log in below.</p>

                <form action="loginCheckoutAction.jsp" method="post">
                    <table>
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
            <% } %>  
        <jsp:include page="endNote.jsp" />    
    </body>
</html>
