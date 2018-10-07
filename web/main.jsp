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
        
        <jsp:include page="header.jsp"  flush="true"/>
        <div class="content">
        <form>
            <jsp:include page="editDetails.jsp" flush="true"/>
            <jsp:include page="displayOrder.jsp" flush="true"/>
        </form>
        </div>
    </body>
</html>
