<%-- 
    Document   : cancelledConfirmation
    Created on : 07/10/2018, 3:28:44 PM
    Author     : WILL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Concelled Order Confirmation Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/MovieStore/CSS/main.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>

        <div class="content">
            <% multiMovieOrder.movies.clear(); %>
            
            <div style="text-align: center;">
                <h1>Order had been cancelled. </h1>
                <p>Your order has been cancelled. Click <a href="index.jsp"> here</a> to return to the main page.</p>
            </div>
        </div>
        <jsp:include page="endNote.jsp" />
    </body>
</html>
