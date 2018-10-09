package uts.wsd;
import java.util.ArrayList;
/**
 *
 * @author William
 */
public class NoCopiesSelected {
    
    public ArrayList<String> movies = new ArrayList();
    String availableCopies;
    
    public NoCopiesSelected() {
        availableCopies = "";
    }
    
    public ArrayList<String> getMovies() { return movies; }    
    
    public NoCopiesSelected(String availableCopies) {
        this.availableCopies = availableCopies;
    }
    
    public void addMovie(String movie) { 
        movies.add(movie); 
    }
    
    public void emptyMovies() { 
        movies.clear(); 
    }
    
    public void emptyAvailableCopies(){ 
        availableCopies = ""; 
    }
    
    public String getAvailableCopies() { 
        return availableCopies; 
    }
    public void setAvailableCopies(String availableCopies) { 
        this.availableCopies = availableCopies; 
    }
}
