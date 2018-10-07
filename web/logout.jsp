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
    
    </head>
    <body>
        <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>
        <jsp:useBean id="searchParam" 
                     class="uts.wsd.SearchParam" scope="application"> <!-- This bean calculates all the  years between what the user inputs -->
        </jsp:useBean>
           <% multiMovieOrder.movies.clear(); 
           searchParam.years.clear();
           %>
        <% session.invalidate(); %>
        <jsp:include page="header.jsp" />
         <div class="content">
        <p>You have been logged out. Click  <a href="index.jsp"> here </a> to return to the main page.</p>
        <jsp:include page="endNote.jsp" />
        </div>
    </body>
</html>
