<%-- 
    Document   : purchaseConfirmation
    Created on : 29/09/2018, 11:38:33 PM
    Author     : WILL
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
        <jsp:include page="header.jsp"  flush="true"/>
        
        <div class="content">
            <div style="text-align: center;">
                <h1>Order Purchase Successful!</h1>
                <p>Your order purchase was successful. Click <a href="index.jsp"> here</a> to return to the main page.</p>
            </div>
        </div>
        <jsp:include page="endNote.jsp" />
    </body>
</html>
