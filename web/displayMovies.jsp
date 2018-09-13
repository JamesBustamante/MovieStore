<%@page import="uts.wsd.CalcYears"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page import="uts.wsd.Movies"%>
<%@page import="uts.wsd.Movie"%>
<%@page import="java.util.ArrayList"%>

<% String filePath1 = application.getRealPath("WEB-INF/movies.xml"); %>
        <jsp:useBean id="movieApp" class="uts.wsd.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath1%>"/>
            </jsp:useBean>
        
        <jsp:useBean id="searchParam" 
                     class="uts.wsd.SearchParam" scope="application">
                     </jsp:useBean>
        
                    <% Movies movies = movieApp.getMovies();
                    ArrayList<Movie> matches = movies.getMovies();
                    
            %>
            <%= searchParam.getGenre() %>
            <%= searchParam.getTitle() %>
            <%= searchParam.getYears().toString() %>
            
            <% 
                boolean genreHasInput = false;
                boolean titleHasInput = false;
                boolean yearsHasInput = false;
                if (!searchParam.getGenre().equals(""))
                    genreHasInput = true;
                if (!searchParam.getTitle().equals(""))
                    titleHasInput = true;
                if (!searchParam.getYears().isEmpty())
                    yearsHasInput = true;
                        
                if (searchParam.getGenre().equals("Any") || !genreHasInput) {     
                        matches = movies.getMovies();
                }   else {matches = movies.getGenreMatches(searchParam.getGenre()); }
                
                if (titleHasInput)
                    matches = movies.getTitleMatches(searchParam.getTitle());
               
                if (yearsHasInput){
                     CalcYears calcYears = new CalcYears(); 
                            matches = calcYears.getYearMatches(matches,searchParam.getYears(), movies);
                            out.print(matches.toString());
                }
               
                
            %>
            
            <c:set var = "xmltext"> 
            <movies> 
                    <% for (Movie movie: matches) { %>
                    <movie>
                        <title><%= movie.getTitle() %></title>
                        <genre><%= movie.getGenre() %></genre>
                        <releaseDate><%= movie.getReleaseDate()%></releaseDate>
                        <price><%= movie.getPrice()%></price>
                        <picture><%= movie.getPicture() %></picture>
                        <description><%= movie.getDescription() %></description>
                        <availableCopies><%= movie.getAvailableCopies() %></availableCopies>
                    </movie>
                    <%}%>
            </movies>
            </c:set>
<c:import url = "movies.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>