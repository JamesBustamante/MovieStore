<%-- 
    Document   : main
    Created on : 05/09/2018, 6:31:03 PM
    Author     : james
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <link rel="stylesheet" href="CSS/main.css"> 
    </head>
    <body>
        <div class="contet">
        <jsp:include page="header.jsp"  flush="true"/>
        <form>
            <jsp:include page="editDetails.jsp" flush="true"/>
            <h2 style="text-align: center">Order History</h2>
            <jsp:include page="displayOrder.jsp" flush="true" />
            <div><a href="cancel.jsp">Click here to cancel an order</a></div>
        </form>
        </div>
    </body>
</html>
