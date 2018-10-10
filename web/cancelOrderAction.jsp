<%-- 
    Document   : cancelOrderAction
    Created on : 08/10/2018, 1:26:28 AM
    Author     : james
--%>

<%@page import="uts.wsd.Movie"%>
<%@page import="uts.wsd.Movies"%>
<%@page import="uts.wsd.MoviePurchase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.wsd.Order"%>
<%@page import="uts.wsd.History"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
      <%-- This bean gets the information for the xml file provided in the filepath--%>
      <% String filePath1 = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
            <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>
        
      <%-- This bean gets the information for the xml file provided in the filepath--%>  
        <% String filePath = application.getRealPath("WEB-INF/movies.xml"); %>
        <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>

    <body>
        <% String id = request.getParameter("id"); %>
            <%= id %>
            
            <% 
                History history = historyApp.getHistory();
                history.getOrderIDMatch(id).setOrderStatus("Cancelled");
                Order order = history.getOrderIDMatch(id);
                ArrayList<MoviePurchase> purchases = order.getPurchases();
                Movies movies = movieApp.getMovies();
            ArrayList<Movie> matchMovies = movies.getMovies();
                for (MoviePurchase purchase : purchases ) {
                    for (Movie movie : matchMovies) {
                        if (purchase.getTitle().equals(movie.getTitle())){
                            int addBack = Integer.parseInt(movie.getAvailableCopies()) + Integer.parseInt(purchase.getNoCopies());
                            movieApp.getMovies().getMoviebyTitle(movie.getTitle()).setAvailableCopies(String.valueOf(addBack));
                        }
                    }
                }//movieApp.getMovies().setMovies(matchMovies);
                movieApp.saveMovies();
                historyApp.updateXML(history, filePath1); 
        
                

            %>
            <% response.sendRedirect("cancelledConfirmation.jsp"); %>
    </body>
</html>
