<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="WEB-INF/movies.xsl"?>

<%@page import="uts.wsd.Movies"%>
<%@page import="uts.wsd.Movie"%>
<%@page import="java.util.ArrayList"%>

<% String filePath = application.getRealPath("WEB-INF/movies.xml"); %>
        <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>
        
                    <% Movies movies = movieApp.getMovies();
                    ArrayList<Movie> matches = movies.getMovies();
                    
            %>
            
            <movies> 
                    <% for (Movie movie: matches) { %>
                    <movie>
                        <title><% movie.getTitle(); out.println(movie.getGenre()); %></title>
                        <genre><% movie.getGenre(); %></genre>
                        <releaseDate><% movie.getReleaseDate();%></releaseDate>
                        <price><% movie.getPrice();%></price>
                        <picture><% movie.getPicture(); %></picture>
                        <description><% movie.getDescription(); %></description>
                        <availableCopies><% movie.getAvailableCopies(); %></availableCopies>
                    </movie>
                    <%}%>
            </movies>