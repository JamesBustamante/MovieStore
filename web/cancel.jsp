<%-- 
    Document   : cancel
    Created on : 05/09/2018, 6:31:35 PM
    Author     : james
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="CSS/main.css"> 
        <title>Cancel Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"  flush="true"/><%-- The header page which is consistent across all pages--%>
        <div class="content"><%-- CSS class that contains all the elements of the page--%>
            <% String id = request.getParameter("id"); %>
            <%-- This form checks what button user clicks and directs user to another jsp page--%>
            <form action="cancelOrderAction.jsp" style="text-align: center">
                <h2>Are you sure you want to cancel this order?</h2>
                <input type="submit" value="Yes"/>                
                <input type="hidden" name="id" value="<%= id%>"/>
            </form>
            <br>
            <form action="main.jsp" style="text-align: center">
                <input type="submit" value="No"/>
            </form>
            <jsp:include page="endNote.jsp" />
        </div>
        <h1></h1>
    </body>
</html>
