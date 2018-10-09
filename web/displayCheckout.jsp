<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page import="java.util.*"%>
<%@page import="uts.wsd.*"%>

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
    ArrayList<Movie> matchesMovie = movies.getMovies();
    ArrayList<Movie> tempArrayList = new ArrayList<Movie>();

    multiMovieOrder.movies.add(id);

    for (String movie : multiMovieOrder.movies) {
        for (Movie movie1 : matchesMovie) {
            if (movie1.getTitle().equals(movie)) {
                tempArrayList.add(movie1);
            }
        }
    }
%>

<c:set var = "xmltext"> 
    <movies> 
        <% for (Movie movie : tempArrayList) { %>
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