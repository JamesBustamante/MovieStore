package uts.wsd;
import java.util.ArrayList;
/**
 *
 * @author WILL
 */
public class MultiMovieOrder {
    
    public ArrayList<String> movies = new ArrayList<>();
    String title;
    //String genre;
    //String releaseDate;
    ////String price;
    //String picture;
    //String description;
    //String availableCopies;
    
    public MultiMovieOrder() {
        title = "";
        //genre = "";
        //releaseDate = "";
        //price = "";
        //picture = "";
        //description = "";
        //availableCopies = "";
    }
    
    public ArrayList<String> getMovies() { return movies; }
    
    //public MultiMovieOrder(String title, String genre, String releaseDate, String price, String picture, String description, String availableCopies) {
    public MultiMovieOrder(String title) {
        this.title = title;
        //this.genre = genre;
        //this.releaseDate = releaseDate;
        //this.price = price;
        //this.picture = picture;
        //this.description = description;
        //this.availableCopies = availableCopies;
    }
    
    public void addMovie(String movie) { movies.add(movie); }
    //////////////////////////////////////////////
    public void emptyMovies() { movies.clear(); }
    
    public void emptyTitle(){ title = ""; }
    
   // public void emptyGenre() { genre = ""; }
    
    //public void emptyReleaseDate() { releaseDate = ""; }
    
    //public void emptyPrice() { price = ""; }
    
    //public void emptyPicture() { picture = ""; }
    
    //public void emptyDescription() { description = ""; }
    
    //public void emptyavailableCopies() { availableCopies = ""; }
    //////////////////////////////////////////////
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    //public String getGenre() { return genre; }
    //public void setGenre(String genre) { this.genre = genre; }
    
    //public String getReleaseDate() { return releaseDate; }
    //public void setReleaseDate(String releaseDate) { this.releaseDate = releaseDate; }
    
    //public String getPrice() { return price; }
    //public void setPrice(String price) { this.price = price; }
    
    //public String getPicture() { return picture; }
    //public void setPicture(String picture) { this.picture = picture; }
    
    //public String getDescription() { return description; }
    //public void setDescription(String description) { this.description = description; }
    
    //public String getAvailableCopies() { return availableCopies; }
    //public void setAvailableCopies(String availableCopies) { this.availableCopies = availableCopies; } 
}