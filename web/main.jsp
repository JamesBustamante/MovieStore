<%@page import="uts.wsd.User"%>
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
        <jsp:include page="header.jsp"  flush="true"/> <%-- The header page which is consistent across all pages--%>
        <div class="content"> <%-- CSS class that contains all the elements of the page--%>
            <form>
                <jsp:include page="editDetails.jsp" flush="true"/> <%-- This JSP page allows users to edit their account or delete it--%>
                <jsp:include page="displayOrder.jsp" flush="true"/> <%-- This JSP page displays a list of orders that the user has made--%>
                <jsp:include page="endNote.jsp"/>
            </form>
        </div>
    </body>
</html>
