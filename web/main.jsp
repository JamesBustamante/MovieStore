<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : main
    Created on : 05/09/2018, 6:31:03 PM
    Author     : james
--%>

<html>
    <head>
        <title>Main Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/main.css"> 
    </head>
    <body>
        <div class="content">
        <jsp:include page="header.jsp"  flush="true"/>
        <form>
            <jsp:include page="editDetails.jsp" flush="true"/>
            <jsp:include page="displayOrder.jsp" flush="true"/>
            <div><a href="cancel.jsp">Click here to cancel an order</a></div>
        </form>
        </div>
    </body>
</html>
