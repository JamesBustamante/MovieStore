<%-- 
    Document   : removeMovieAction
    Created on : 07/10/2018, 11:42:58 PM
    Author     : William
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Selected Movie Page</title>
    </head>
    <body>
        <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>

        <%
            //This remove's the selected movie from the checkout list of selected movies
            //by removing it from the multiMovieOrder bean ArrayList
            String id = request.getParameter("id");            
            multiMovieOrder.movies.remove(id);
            
            //redirect to checkout.jsp page
            response.sendRedirect("checkout.jsp");
        %>
    </body>
</html>
