/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;

/**
 *
 * @author james
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "movie")
public class Movie implements Serializable {
    @XmlElement(name = "title")
    private String title;
    @XmlElement(name = "genre")
    private String genre;
    @XmlElement(name = "releaseDate")
    private String releaseDate;
    @XmlElement(name = "price")
    private String price;
    @XmlElement(name = "picture")
    private String picture;
    @XmlElement(name = "description")
    private String description;
    @XmlElement(name = "availableCopies")
    private String availableCopies;

    /**
     * calling method Movie() will execute method super()
     */
    public Movie() {
    super();
    }

    /**
     * creates an instance of each of the parameters
     * 
     * @param title
     * @param genre
     * @param releaseDate
     * @param price
     * @param picture
     * @param description
     * @param availableCopies
     */
    public Movie(String title, String genre, String releaseDate, String price, String picture, String description, String availableCopies) {
        this.title = title;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.price = price;
        this.picture = picture;
        this.description = description;
        this.availableCopies = availableCopies;
    }

    /**
     * method returns genre defined above
     * 
     * @return picture
     */
    public String getPicture() {
        return picture;
    }

    /**
     * sets parameter picture to an instance
     * 
     * @param picture
     */
    public void setPicture(String picture) {
        this.picture = picture;
    }

    /**
     * 
     * @return description
     */
    public String getDescription() {
        return description;
    }

    /**
     * sets description to an instance
     * 
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    /**
     *
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * sets parameter title to an instance
     * 
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     *
     * @return genre
     */
    public String getGenre() {
        return genre;
    }

    /**
     * sets genre to an instance
     * 
     * @param genre
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     *
     * @return releaseDate;
     */
    public String getReleaseDate() {
        return releaseDate;
    }

    /**
     * creates instance of releaseDate
     * 
     * @param releaseDate
     */
    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    /**
     *
     * @return price
     */
    public String getPrice() {
        return price;
    }

    /**
     * creates instance of price
     * 
     * @param price
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     *
     * @return availableCopies
     */
    public String getAvailableCopies() {
        return availableCopies;
    }

    /**
     * creates instance of parameter availableCopies
     * 
     * @param availableCopies
     */
    public void setAvailableCopies(String availableCopies) {
        this.availableCopies = availableCopies;
    }
    
    /**
     *
     * @param genre
     * @return boolean genre
     */
    public boolean matchGenre(String genre){
        return this.genre.equalsIgnoreCase(genre.trim()); // Not case sensitive and removes whitespace
    }
    
    /**
     *
     * @param title
     * @return boolean title
     */
    public boolean matchTitle(String title){
        return this.title.equals(title.trim()); // removes whitespace
    }
    
    /**
     * returns a boolean assigning releaseDate to year
     * 
     * @param year
     * @return boolean year
     */
    public boolean matchYear(String year){
        return this.releaseDate.equals(year.trim()); // removes whitespace
    }
    
    /**
     * using above methods, if all parameters are true (accepted)
     * return true
     * 
     * @param title
     * @param year
     * @param genre
     * @return boolean
     */
    public boolean matchAll(String title, String year, String genre){        
        return matchTitle(title)&&matchYear(year)&&matchGenre(genre);
    }
    
    /**
     * if year and genre match return true
     * 
     * @param genre
     * @param year
     * @return boolean
     */
    public boolean matchGenreAndYear(String genre, String year){        
        return matchYear(year)&&matchGenre(genre);
    }
    
    /**
     * if any of the parameters match return true
     * 
     * @param title
     * @param year
     * @param genre
     * @return boolean
     */
    public boolean matchAny(String title, String year, String genre){ 
        return matchTitle(title)||matchYear(year)||matchGenre(genre);
    }
    
    
}
