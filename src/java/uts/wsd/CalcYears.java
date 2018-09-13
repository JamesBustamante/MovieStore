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
    
//    public ArrayList<Movie> getAllMatches(ArrayList<Movie> moviesList,ArrayList<String> years, String title, String genre, Movies movies){
//        boolean genreHasInput = false;
//                boolean titleHasInput = false;
//                boolean yearsHasInput = false;
//                if (!genre.equals(""))
//                    genreHasInput = true;
//                if (!title.equals(""))
//                    titleHasInput = true;
//                if (!years.isEmpty())
//                    yearsHasInput = true;
//                
//                if (genreHasInput && titleHasInput && yearsHasInput) {
//                
//                } else if (genreHasInput && titleHasInput && !yearsHasInput) {
//                
//                } else if (genreHasInput && !titleHasInput && !yearsHasInput) {
//                
//                } else if (genreHasInput && !titleHasInput && yearsHasInput) {
//                
//                } else if (!genreHasInput && titleHasInput && !yearsHasInput) {
//                
//                } else if (!genreHasInput && !titleHasInput && !yearsHasInput) {
//                
//                } else if (!genreHasInput && !titleHasInput && yearsHasInput) {
//                
//                }
//    }
    
    
}

