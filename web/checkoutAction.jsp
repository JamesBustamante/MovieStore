<%-- 
    Document   : checkoutAction
    Created on : 11/09/2018, 9:37:07 PM
    Author     : WILL
--%>
<%@page import="java.util.Random"%>
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
        <% String filePath1 = application.getRealPath("WEB-INF/history.xml");%>
        <% String filePath2 = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
            <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>
        
        <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
            <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath2%>"/>
        </jsp:useBean>
        
        <jsp:useBean id="multiMovieOrder"
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>
        
        <%  
            //Get parameters from previous page for Order details
            User user = (User) session.getAttribute("user");            
            String id = request.getParameter("id");
            String paymentMethod = request.getParameter("paymentMethod");
            String noCopies = request.getParameter("noCopies");
            String salesTotal = request.getParameter("salesTotal");
            
            Movies movies = movieApp.getMovies();
            ArrayList<Movie> matchesMovie = movies.getMovies();
            
            //set String value for Random Order number          
            int tempRndID = (new Random()).nextInt(999);            
            String orderID = Integer.toString(tempRndID);
            
            //set values for User info
            String ID = user.getID();
            String email = user.getEmail();
            String fullName = user.getfullName();
            //String salesTotal = "555";  //***********************temp********
            
            MoviePurchase moviePurchase = new MoviePurchase();
            ArrayList<MoviePurchase> tempArrayList = new ArrayList<MoviePurchase>();            
            for (Movie movie : matchesMovie){
                if (movie.getTitle().equals(id)) {                    
                    moviePurchase.setTitle(movie.getTitle());
                    moviePurchase.setGenre(movie.getGenre());
                    moviePurchase.setReleaseDate(movie.getReleaseDate());
                    moviePurchase.setPrice(movie.getPrice());
                }
            }
            moviePurchase.setNoCopies(noCopies);
            tempArrayList.add(moviePurchase); 
            
            Order newOrder = new Order(orderID, tempArrayList, ID, email, fullName, paymentMethod, salesTotal, "Submitted");
            History history = historyApp.getHistory();
            history.addOrder(newOrder); //Uses addOrder function to add new order.
            historyApp.updateXML(history, filePath1); //Saves the order in XML.
        %>
    </body>
</html>
