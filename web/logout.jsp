<%-- 
    Document   : logout
    Created on : 07/08/2018, 4:28:47 PM
    Author     : james
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/main.css"> 
        <% session.invalidate(); %>
    </head>
    <body>
        <jsp:include page="header.jsp" />
         <div class="content">
        <p>You have been logged out. Click  <a href="index.jsp"> here </a> to return to the main page.</p>
        <jsp:include page="endNote.jsp" />
        </div>
    </body>
</html>
