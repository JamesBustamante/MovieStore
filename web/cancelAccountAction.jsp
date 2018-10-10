<%-- 
    Document   : cancelAccountAction
    Created on : 10/10/2018, 1:34:42 AM
    Author     : Ciaran
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Account</title>
        <link rel="stylesheet" href="CSS/main.css"
    </head>
    <%-- This bean takes the information from the xml file provided in the filepath--%>
    <%String filePath = application.getRealPath("WEB-INF/movies.xml");%>
    <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <%-- This bean takes the information from the xml file provided in the filepath--%>
    <%String filePath1 = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="uts.wsd.MovieStoreUserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath1%>"/>
    </jsp:useBean>
    
    <%-- This bean takes the information from the xml file provided in the filepath--%>
    <% String filePath2 = application.getRealPath("WEB-INF/history.xml");%>
    <jsp:useBean id="historyApp" class="uts.wsd.HistoryApplication" scope="application">
        <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath2%>"/>
    </jsp:useBean>    
    
    <body>
        
        <%
            User user = (User)session.getAttribute("user");
            String id = user.getID();
            String email = user.getEmail();            
            Users users = userApp.getUsers();
            Movies movies = movieApp.getMovies();
            History history = historyApp.getHistory();
            ArrayList<Order> orders = history.getOrdersEmailMatches(email);
            ArrayList<Movie> allMovies = movies.getMovies();
            for(Order order : orders){
                ArrayList<MoviePurchase> matches = order.getPurchases();
                for(MoviePurchase mp : matches){
                    for(Movie movie : allMovies){
                        if(mp.getTitle().equals(movie.getTitle())){
                            int addBack = Integer.parseInt(movie.getAvailableCopies()) + Integer.parseInt(mp.getNoCopies());
                            movieApp.getMovies().getMoviebyTitle(movie.getTitle()).setAvailableCopies(String.valueOf(addBack));
                        }
                        
                    }
                }
                
            }
            movieApp.saveMovies();
            orders.removeAll(history.getOrdersEmailMatches(email));
            historyApp.updateXML(history, filePath2);
            
            users.removeUser(user);
            userApp.updateXML(users, filePath1);
            
        %>
        
        <%
            response.sendRedirect("index.jsp");
            session.invalidate();
        %>
        
               
    </body>
</html>
