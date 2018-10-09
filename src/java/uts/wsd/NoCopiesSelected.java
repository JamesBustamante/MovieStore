package uts.wsd;
import java.util.ArrayList;
/**
 *
 * @author William
 */
public class NoCopiesSelected {
    
    /**
     *
     */
    public ArrayList<String> movies = new ArrayList();
    String availableCopies;
    
    /**
     *
     */
    public NoCopiesSelected() {
        availableCopies = "";
    }
    
    /**
     *
     * @return
     */
    public ArrayList<String> getMovies() { return movies; }    
    
    /**
     *
     * @param availableCopies
     */
    public NoCopiesSelected(String availableCopies) {
        this.availableCopies = availableCopies;
    }
    
    /**
     *
     * @param movie
     */
    public void addMovie(String movie) { 
        movies.add(movie); 
    }
    
    /**
     *
     */
    public void emptyMovies() { 
        movies.clear(); 
    }
    
    /**
     *
     */
    public void emptyAvailableCopies(){ 
        availableCopies = ""; 
    }
    
    /**
     *
     * @return
     */
    public String getAvailableCopies() { 
        return availableCopies; 
    }

    /**
     *
     * @param availableCopies
     */
    public void setAvailableCopies(String availableCopies) { 
        this.availableCopies = availableCopies; 
    }
}
