package uts.wsd;
import java.util.ArrayList;
/**
 *
 * @author WILL
 */
public class MultiMovieOrder {
    
    /**
     *
     */
    public ArrayList<String> movies = new ArrayList<>();

    /**
     *
     */
    public ArrayList<String> numOrderSelection = new ArrayList<>();

    /**
     *
     * @return
     */
    
    public String OrderID = "";

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }
    
    public ArrayList<String> getNumOrderSelection() {
        return numOrderSelection;
    }

    /**
     *
     * @param numOrderSelection
     */
    public void setNumOrderSelection(ArrayList<String> numOrderSelection) {
        this.numOrderSelection = numOrderSelection;
    }
    String title;
    
    /**
     *
     */
    public MultiMovieOrder() {
        title = "";
    }
    
    /**
     *
     * @return
     */
    public ArrayList<String> getMovies() { return movies; }    
    
    /**
     *
     * @param title
     */
    public MultiMovieOrder(String title) {
        this.title = title;
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
    public void emptyTitle(){ 
        title = ""; 
    }
    
    /**
     *
     * @return
     */
    public String getTitle() { 
        return title; 
    }

    /**
     *
     * @param title
     */
    public void setTitle(String title) { 
        this.title = title; 
    }
}