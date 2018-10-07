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
        
        <jsp:useBean id="multiMovieOrder" 
                     class="uts.wsd.MultiMovieOrder" scope="session">
        </jsp:useBean>
        
                    <% Movies movies = movieApp.getMovies();
                    ArrayList<Movie> matches = movies.getMovies();
                    
                           ArrayList<Movie> moviesSelected = new ArrayList<Movie>();
                 for (String movie : multiMovieOrder.movies) {
                for (Movie movie1 : matches) {
                    if (movie1.getTitle().equals(movie)) {
                        moviesSelected.add(movie1);
                    }
                }
            }
//                 for (Movie movie: matches) { 
//                     for (Movie movie1: moviesSelected) {
//                         if (movie.getTitle().equals(movie1.getTitle())){
//                             matches.remove(movie1);
//                         }
//                     }
//                 }
                    
            %>
            <%//= searchParam.getGenre() %>
            <%//= searchParam.getTitle() %>
            <%//= searchParam.getYears().toString() %>
            
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
                            //out.print(matches.toString());
                }
                
                if (genreHasInput && titleHasInput && yearsHasInput) {
                    matches = movies.getAllMatches(searchParam.getYears().get(0), searchParam.getTitle(), searchParam.getGenre());

                } 

                if (genreHasInput && !titleHasInput && yearsHasInput) {
                    CalcYears calcYears1 = new CalcYears(); 
                            matches = calcYears1.getYearMatches(matches,searchParam.getYears(), movies);

                            if (!searchParam.getGenre().equals("Any")) {
                            matches = movies.getGenreAndYearMatches(matches, searchParam.getGenre()); }
                }
                
                    //SYMMETRIC DIFFERENCE ALGOTHM 
                        ArrayList<Movie> union = new ArrayList<Movie>(matches);
                        union.addAll(moviesSelected);
                        // Prepare an intersection
                        ArrayList<Movie> intersection = new ArrayList<Movie>(matches);
                        intersection.retainAll(moviesSelected);
                        // Subtract the intersection from the union
                        union.removeAll(intersection);
                 
                //Movie movie: matches
            %>
            <c:set var = "xmltext"> 
            <movies> 
                    <% for (Movie movie : union) { 
                    %>
                    <movie>
                        <title><%= movie.getTitle() %></title>
                        <genre><%= movie.getGenre() %></genre>
                        <releaseDate><%= movie.getReleaseDate()%></releaseDate>
                        <price><%= movie.getPrice()%></price>
                        <picture><%= movie.getPicture() %></picture>
                        <description><%= movie.getDescription() %></description>
                        <availableCopies><%= movie.getAvailableCopies() %></availableCopies>
                    </movie>
                    <%}
%>
            </movies>
            </c:set>
<c:import url = "movies.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>
<%! String name;%> 
<%
    if (matches.size() == 0) { 
            if (titleHasInput) {
                name = "Title: " + searchParam.getTitle() + "        ";
            }
            if (genreHasInput)
            name = name + "Genre: " + searchParam.getGenre() + "        ";
            if (yearsHasInput)
            name = name + "Years: " + searchParam.getYears().get(0) + "-" + searchParam.getYears().get(searchParam.getYears().size()-1);
%> 

<h2 style="text-align: center; color:brown;">Error! Movie Not Found</h2>
<p style="text-align: center; color:brown;">Parameters given <%= name %></p>
<% name = ""; %>
<% } %>
