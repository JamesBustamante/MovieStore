<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page import="uts.wsd.Movies"%>
<%@page import="uts.wsd.Movie"%>
<%@page import="java.util.ArrayList"%>

<% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
<jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
    <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<% 
    String id = request.getParameter("id");
    Movies movies = movieApp.getMovies();
    
    ArrayList<Movie> matches = movies.getMovies();
%>


<c:set var = "xmltext"> 
    <movies> 
        <% for (Movie movie : matches) 
            if (movie.getTitle().equals(id)){ 
        %>
        <movie>
            <title><%= movie.getTitle()%></title>
            <genre><%= movie.getGenre()%></genre>
            <releaseDate><%= movie.getReleaseDate()%></releaseDate>
            <price><%= movie.getPrice()%></price>
            <picture><%= movie.getPicture()%></picture>
            <description><%= movie.getDescription()%></description>
            <availableCopies><%= movie.getAvailableCopies()%></availableCopies>
        </movie>
        <%}%>
    </movies>
</c:set>
<c:import url = "selectedMovie.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>