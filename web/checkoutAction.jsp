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
        
        <%  
            User user = (User) session.getAttribute("user");            
            String id = request.getParameter("id");

            Movies movies = movieApp.getMovies();
            ArrayList<Movie> matchesMovie = movies.getMovies();
            
            //temp values
            String tempPayment = "Credit Card";
            String tempSalesTotal = "555";
            String tempOrderStatus = "Submitted";
            
            //set String values for update          
            int tempRndID = (new Random()).nextInt(999);            
            String orderID = Integer.toString(tempRndID);  
            
            
            MoviePurchase moviePurchase = new MoviePurchase();
            ArrayList<MoviePurchase> tempArrayList = new ArrayList<MoviePurchase>();
                        
            moviePurchase.setTitle("reeeee");
            moviePurchase.setGenre("reeeee");
            moviePurchase.setReleaseDate("reeeee");
            moviePurchase.setPrice("reeeee.96");
            moviePurchase.setNoCopies("1");            
            tempArrayList.add(moviePurchase);
            
            
            for (Movie movie : matchesMovie){
                if (movie.getTitle().equals(id)) {
                    //title = movie.getTitle();
                    //genre = movie.getGenre();
                    //releaseDate = movie.getReleaseDate();
                    //price = movie.getPrice();
                    //NoCopies = movie.getAvailableCopies(); //temp data for now                    
                                       
                    //tempArrayList.add(title = movie.getTitle());
                    //tempArrayList.add(genre = movie.getGenre());
                    //tempArrayList.add(releaseDate = movie.getReleaseDate());
                    //tempArrayList.add(price = movie.getPrice());
                   // tempArrayList.add(NoCopies = movie.getAvailableCopies());
                }
            }
                    
            String ID = user.getID();
            String email = user.getEmail();
            String fullName = user.getfullName();
            String paymentMethod = tempPayment;
            String salesTotal = tempSalesTotal;
            String orderStatus = tempOrderStatus;

            Order newOrder = new Order(orderID, tempArrayList, ID, email, fullName, paymentMethod, salesTotal, orderStatus);
            History history = historyApp.getHistory();
            history.addOrder(newOrder); //Uses addOrder function to add new order.
            historyApp.updateXML(history, filePath1); //Saves the order in XML.
        %>
    </body>
</html>
