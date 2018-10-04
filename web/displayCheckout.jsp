<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page import="java.util.*"%>
<%@page import="uts.wsd.Movie"%>
<%@page import="uts.wsd.Movies"%>
<%@page import="uts.wsd.MultiMovieOrder"%>
<%@page import="java.util.ArrayList"%>

<% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
<jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
    <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<jsp:useBean id="multiMovieOrder" 
             class="uts.wsd.MultiMovieOrder" scope="session">
</jsp:useBean>

<% 
    String id = request.getParameter("id"); 
    
    Movies movies = movieApp.getMovies();
    ArrayList<Movie> matches = movies.getMovies();
    
    //Movie tempArrayList = (Movie)session.getAttribute("multiOrder");
    //ArrayList<Movie> tempArrayList = (ArrayList<Movie>)session.getAttribute("multiOrder");    
    //List<MultiMovieOrder> list = (List<MultiMovieOrder>) request.getSession().getAttribute("multiOrder");    
    //StringBuilder string = new StringBuilder();
    //for (MultiMovieOrder r : list) {
    //    string.append(list.toString());
    //}    
    
    
    //multiMovieOrder.setTitle(string.toString());
    //for (Movie movie : matches) {
     //   if (movie.getTitle().equals(id)){ 
            //multiMovieOrder.setTitle(movie.getTitle());
           // multiMovieOrder.setGenre(movie.getGenre());
            //multiMovieOrder.setReleaseDate(movie.getReleaseDate());
           // multiMovieOrder.setPrice(movie.getPrice());
           // multiMovieOrder.setPrice(movie.getPicture());
           // multiMovieOrder.setDescription(movie.getDescription());
           // multiMovieOrder.setAvailableCopies(movie.getAvailableCopies());
     //   }
    //}
    
%>

<!-- this calc below needs to run for multiMovieOrder, and then have below is only display MMO -->
<c:set var = "xmltext"> 
    <movies> 
        <% for (Movie movie : matches) 
            if (movie.getTitle().equals(id)){ 
        %>
        <movie>
            <title><%=movie.getTitle()%></title>
            <genre><%=movie.getGenre()%></genre>
            <releaseDate><%=movie.getReleaseDate()%></releaseDate>
            <price><%=movie.getPrice()%></price>
            <picture><%=movie.getPicture()%></picture>
            <description><%=movie.getDescription()%></description>
            <availableCopies><%=movie.getAvailableCopies()%></availableCopies>
        </movie>
        <%}%>
    </movies>        
</c:set>
<c:import url = "selectedMovie.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>