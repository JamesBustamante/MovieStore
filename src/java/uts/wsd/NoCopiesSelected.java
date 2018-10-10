package uts.wsd;

import java.util.ArrayList;

/**
 *
 * @author William
 */
public class NoCopiesSelected {

    /**
     * creates new arrayList of String defines availableCopies as a String
     */
    public ArrayList<String> movies = new ArrayList();
    String availableCopies;

    /**
     * sets availableCopies to an empty string
     */
    public NoCopiesSelected() {
        availableCopies = "";
    }

    /**
     * getter for arrayList movies
     * 
     * @return movies
     */
    public ArrayList<String> getMovies() {
        return movies;
    }

    /**
     * creates instance of parameter availableCopies
     * 
     * @param availableCopies
     */
    public NoCopiesSelected(String availableCopies) {
        this.availableCopies = availableCopies;
    }

    /**
     * adds movie to the arrayList movies
     * 
     * @param movie
     */
    public void addMovie(String movie) {
        movies.add(movie);
    }

    /**
     * clears the arrayList movies
     */
    public void emptyMovies() {
        movies.clear();
    }

    /**
     * sets variable availableCopies to an empty string
     */
    public void emptyAvailableCopies() {
        availableCopies = "";
    }

    /**
     * getter for availableCopies
     * @return availableCopies
     */
    public String getAvailableCopies() {
        return availableCopies;
    }

    /**
     * creates instance for availableCopies
     * 
     * @param availableCopies
     */
    public void setAvailableCopies(String availableCopies) {
        this.availableCopies = availableCopies;
    }
}
