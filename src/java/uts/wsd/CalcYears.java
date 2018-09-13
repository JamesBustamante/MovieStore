/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.util.ArrayList;

/**
 *
 * @author james
 */
public class CalcYears {


    public CalcYears() {
        super();
    }
    
    public ArrayList<Movie> getYearMatches(ArrayList<Movie> moviesList,ArrayList<String> years, Movies movies){
        ArrayList<Movie> match = new ArrayList<>();
        ArrayList<Movie> matches = new ArrayList<>();
        
        for (String year : years) { //go through each year
            match = movies.getYearMatches(year); //match year to movie/s
            
            for (Movie movie : match) { //Add to overall matches list
                matches.add(movie);
            }
        }
        return matches;
    }
    
    
}

