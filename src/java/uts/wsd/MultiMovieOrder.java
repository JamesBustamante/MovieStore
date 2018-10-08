package uts.wsd;
import java.util.ArrayList;
/**
 *
 * @author WILL
 */
public class MultiMovieOrder {
    
    public ArrayList<String> movies = new ArrayList<>();
     public ArrayList<String> numOrderSelection = new ArrayList<>();

    public ArrayList<String> getNumOrderSelection() {
        return numOrderSelection;
    }

    public void setNumOrderSelection(ArrayList<String> numOrderSelection) {
        this.numOrderSelection = numOrderSelection;
    }
    String title;
    
    public MultiMovieOrder() {
        title = "";
    }
    
    public ArrayList<String> getMovies() { return movies; }    
    
    public MultiMovieOrder(String title) {
        this.title = title;
    }
    
    public void addMovie(String movie) { 
        movies.add(movie); 
    }
    
    public void emptyMovies() { 
        movies.clear(); 
    }
    
    public void emptyTitle(){ 
        title = ""; 
    }
    
    public String getTitle() { 
        return title; 
    }
    public void setTitle(String title) { 
        this.title = title; 
    }
}