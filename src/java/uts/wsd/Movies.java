/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

/**
 *
 * @author james
 */
import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "movies")
public class Movies implements Serializable {
    
    @XmlElement(name = "movie")
    private ArrayList<Movie> movies = new ArrayList<Movie>();
    
    public Movies() {
    }
    
    
    public ArrayList<Movie> getMovies() {
        return movies;
    }
    public ArrayList<Movie> getGenreMatches(String genre){
        ArrayList<Movie> matches = new ArrayList<>();
        for(Movie movie:movies)
            if(movie.matchGenre(genre))
                matches.add(movie);
        return matches;
    }
    
    public ArrayList<Movie> getTitleMatches(String title){
        ArrayList<Movie> matches = new ArrayList<>();
        for(Movie movie:movies)
            if(movie.matchTitle(title))
                matches.add(movie);
        return matches;
    }
    
    public Movie getMoviebyTitle(String title){
        for(Movie movie:movies)
            if(movie.matchTitle(title))
                return movie;
        return null;
    }
    
    public ArrayList<Movie> getYearMatches(String year){
        ArrayList<Movie> matches = new ArrayList<>();
        for(Movie movie:movies)
            if(movie.matchYear(year))
                matches.add(movie);
        return matches;
    }
    
    public ArrayList<Movie> getAllMatches(String year,String title, String genre){
        ArrayList<Movie> matches = new ArrayList<>();
        for(Movie movie:movies)
            if(movie.matchAll(title, year, genre))
                matches.add(movie);
        return matches;
    }
    
    public ArrayList<Movie> getGenreAndYearMatches(Iterable<Movie> movieList, String genre){
        ArrayList<Movie> matches = new ArrayList<>();
        for(Movie movie:movieList)
            if(movie.matchGenre(genre))
                matches.add(movie);
        return matches;
    }
    
    
}
