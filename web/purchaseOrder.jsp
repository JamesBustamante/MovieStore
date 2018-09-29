<%-- 
    Document   : purchaseOrder
    Created on : 26/09/2018, 11:01:29 PM
    Author     : WILL
--%>
<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Purchase Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/MovieStore/CSS/main.css">
    </head>
    <body>
        <% String filePath1 = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
            <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>        
        <jsp:include page="header.jsp" />
        
        <%
            User user = (User) session.getAttribute("user");            
            String id = request.getParameter("id");

            Movies movies = movieApp.getMovies();
            ArrayList<Movie> matchesMovie = movies.getMovies();
        %>
               
        <div class="content">
            <h1 style="text-align: center;">Purchase Order</h1>                 

            <% for (Movie movie : matchesMovie) 
                if (movie.getTitle().equals(id)){ %>
                    <p>Movie details:
                    <p>Title: <%= movie.getTitle()%></p>
                    <p>Genre: <%= movie.getGenre()%></p>
                    <p>Price: <%= movie.getPrice()%></p>
                    <p>No Copies: <%= movie.getAvailableCopies()%> make this a drop down SELECT</p>
                <% } %>
            <br>
            <p>Your details: 
            <p>Email: <%=user.getEmail()%></p>
            <p>Full Name: <%=user.getfullName()%></p>                
            <p>Sales Total: $price calculate</p>
            <p>Payment Method: drop down</p>

            <form action="checkoutAction.jsp" method="get">
                <tr><td><input type="button" onclick="location.href='purchaseConfirmation.jsp'" value="Purchase Order"></td></tr>
            </form>
        </div>
        <jsp:include page="endNote.jsp"/>
    </body>
</html>
