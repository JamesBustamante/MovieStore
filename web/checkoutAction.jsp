<%-- 
    Document   : checkoutAction
    Created on : 11/09/2018, 9:37:07 PM
    Author     : William
--%>
<%@page import="uts.controller.Validator"%>
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
            String paymentMethod = request.getParameter("paymentMethod");
            String salesTotal = request.getParameter("salesTotal");
            String[] noCopies = request.getParameterValues("noCopies");
            
            Validator v = new Validator();
            Boolean invalid = false;
            for (String copy : noCopies) {
                if (!copy.matches("[0-9]+")) {
                   invalid = true;
                }                 
            }   
            
            if (invalid) {
                 session.setAttribute("quantityErr", "Quantity format incorrect, only numbers allowed!");
                    response.sendRedirect("purchaseOrder.jsp");  
            } else {
                Movies movies = movieApp.getMovies();
            ArrayList<Movie> matchesMovie = movies.getMovies();
            ArrayList<Movie> tempMultiMovieOrderAL = new ArrayList<Movie>();

            //set String value for Random Order number          
            int tempRndID = (new Random()).nextInt(999);
            multiMovieOrder.setOrderID(Integer.toString(tempRndID));
            String orderID = Integer.toString(tempRndID);

            //set values for User info
            String ID = user.getID();
            String email = user.getEmail();
            String fullName = user.getfullName();

            //new method with multiple movies in 1 order
            for (String movie : multiMovieOrder.movies) {
                for (Movie movie1 : matchesMovie) {
                    if (movie1.getTitle().equals(movie)) {
                        tempMultiMovieOrderAL.add(movie1);
                    }
                }
            }

            //MoviePurchase moviePurchase = new MoviePurchase("t", "g", "r", "p", "n");
            ArrayList<MoviePurchase> tempMoviePurchaseAL = new ArrayList<MoviePurchase>();
            Double total = 0.00;
            int i = 0;
            for (Movie movie : tempMultiMovieOrderAL) {
                MoviePurchase moviePurchase = new MoviePurchase(movie.getTitle(), movie.getGenre(), movie.getReleaseDate(), movie.getPrice(), noCopies[i]);
//                moviePurchase.setTitle(movie.getTitle());
//                moviePurchase.setGenre(movie.getGenre());
//                moviePurchase.setReleaseDate(movie.getReleaseDate());
//                moviePurchase.setPrice(movie.getPrice());
//                moviePurchase.setNoCopies(noCopies[i]);
                tempMoviePurchaseAL.add(moviePurchase);
                total = total + (Double.parseDouble(movie.getPrice()) * Double.parseDouble(noCopies[i]));
                if (Integer.parseInt(movie.getAvailableCopies()) < Integer.parseInt(noCopies[i])) {
                    //response.sendRedirect("purchaseOrder.jsp"); // Redirect error: too many copies
                    //session.setAttribute("quantityErr", "Too Many Copies");
                    invalid = true;
                }
                i++;
                out.print(moviePurchase.getNoCopies());
            }

            Order newOrder = new Order(orderID, tempMoviePurchaseAL, ID, email, fullName, paymentMethod, Double.toString(total), "Submitted");
            History history = historyApp.getHistory();
            history.addOrder(newOrder); //Uses addOrder function to add new order.
            

            //Decrements the amount of movies now available in movies.xml because of purchase
            ArrayList<MoviePurchase> purchases = newOrder.getPurchases();
            out.print(purchases);
            ArrayList<Movie> matchMovies = movies.getMovies();
            out.print(matchMovies);
            for (MoviePurchase purchase : purchases) {
                for (Movie movie : matchMovies) {
                    if (purchase.getTitle().equals(movie.getTitle())) {
                        int decrement = Integer.parseInt(movie.getAvailableCopies()) - Integer.parseInt(purchase.getNoCopies());
                        movieApp.getMovies().getMoviebyTitle(movie.getTitle()).setAvailableCopies(String.valueOf(decrement));
                    }
                }
            } //historyApp.getHistory().getOrderIDMatch(orderID).setSalesTotal(salesTotal);
             if (!invalid) {
            historyApp.updateXML(history, filePath1); //Saves the order in XML.
            movieApp.saveMovies();
            session.setAttribute("quantityErr", " ");
            response.sendRedirect("purchaseConfirmation.jsp");
             }  else {
                 response.sendRedirect("purchaseOrder.jsp"); // Redirect error: too many copies
                    session.setAttribute("quantityErr", "Too Many Copies");
             }
            }
        
            
            
        %>        
    </body>
</html>
