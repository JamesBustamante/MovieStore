<%-- 
    Document   : purchaseOrder
    Created on : 26/09/2018, 11:01:29 PM
    Author     : William
--%>
<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Purchase Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/main.css">
    </head>
    <body>
        <% String filePath1 = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
            <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>  
        <jsp:useBean id="multiMovieOrder"
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>
        <jsp:include page="header.jsp" />

        <%
            User user = (User) session.getAttribute("user");            
            String quantityErr = (String) session.getAttribute("quantityErr");
            String salesTotal = "0.00";
            
            Movies movies = movieApp.getMovies();
            ArrayList<Movie> matches = movies.getMovies();
            ArrayList<Movie> tempArrayList = new ArrayList<Movie>();

            for (String movie : multiMovieOrder.movies) {
                for (Movie movie1 : matches) {
                    if (movie1.getTitle().equals(movie)) {
                        tempArrayList.add(movie1);
                    }
                }
            }
            
            double totalPrice = 0.00;
            for (String movie : multiMovieOrder.movies) {                
                for (Movie movie1 : matches) {
                    if (movie1.getTitle().equals(movie))
                    totalPrice = totalPrice + Double.parseDouble(movie1.getPrice());                    
//                    
//                    String tempString = movie1.getPrice();
//                    
//                    double salesTotalTemp = Double.parseDouble(salesTotal) + Double.parseDouble(tempString);
//
                    salesTotal = String.valueOf(totalPrice);
                }
            }
            //request.setAttribute(salesTotal, "salesTotal");
        %>

        <div class="content">
            <h1 style="text-align: center;">Purchase Order</h1>    
            
            <!--<form action="purchaseOrderCheck.jsp" method="post">-->
            <form action="checkoutAction.jsp" method="get">
                
                <%= quantityErr %>
                
                <h3>Movie details:</h3>
                <table>
                    <% for (Movie movie : tempArrayList) { %>
                    <tr><td><b>Title:</b> <%= movie.getTitle()%></td></tr>
                    <tr><td><b>Genre:</b> <%= movie.getGenre()%></td></tr>
                    <tr><td><b>Price:</b> <%= movie.getPrice()%></td></tr>
                    <tr>
                        <td><b>Quantity:</b> </td>
                        <td><input type="text" name="noCopies" maxlength="3" size="3" value="1"/></td>
                    </tr>                    
                    <% }%>
                </table>
                <h3>Your details:</h3>
                <table>
                    <tr><td><b>Email:</b> <%=user.getEmail()%></tr></td>
                    <tr><td><b>Full Name:</b> <%=user.getfullName()%></tr></td>                
                    <tr><td><b>Order Total:</b> <%=salesTotal%></tr></td>
                    <tr>
                        <td><b>Payment Method:</b></td>
                        <td><select name="paymentMethod">
                            <option value="PayPal">PayPal</option>
                            <option value="MasterCard">MasterCard</option>
                            <option value="Visa">Visa</option>
                        </select></td>
                        <td><input type="submit" value="Purchase Order"></td>
                    </tr>
                </table>
            </form>
        </div>
        <jsp:include page="endNote.jsp"/>
    </body>
</html>