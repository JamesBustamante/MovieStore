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
     *
     */
    public Movie() {
    super();
    }

    /**
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
     *
     * @return
     */
    public String getPicture() {
        return picture;
    }

    /**
     *
     * @param picture
     */
    public void setPicture(String picture) {
        this.picture = picture;
    }

    /**
     *
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     *
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
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

    /**
     *
     * @return
     */
    public String getGenre() {
        return genre;
    }

    /**
     *
     * @param genre
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     *
     * @return
     */
    public String getReleaseDate() {
        return releaseDate;
    }

    /**
     *
     * @param releaseDate
     */
    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    /**
     *
     * @return
     */
    public String getPrice() {
        return price;
    }

    /**
     *
     * @param price
     */
    public void setPrice(String price) {
        this.price = price;
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
    
    /**
     *
     * @param genre
     * @return
     */
    public boolean matchGenre(String genre){
        return this.genre.equalsIgnoreCase(genre.trim());
    }
    
    /**
     *
     * @param title
     * @return
     */
    public boolean matchTitle(String title){
        return this.title.equals(title.trim());
    }
    
    /**
     *
     * @param year
     * @return
     */
    public boolean matchYear(String year){
        return this.releaseDate.equals(year.trim());
    }
    
    /**
     *
     * @param title
     * @param year
     * @param genre
     * @return
     */
    public boolean matchAll(String title, String year, String genre){        
        return matchTitle(title)&&matchYear(year)&&matchGenre(genre);
    }
    
    /**
     *
     * @param genre
     * @param year
     * @return
     */
    public boolean matchGenreAndYear(String genre, String year){        
        return matchYear(year)&&matchGenre(genre);
    }
    
    /**
     *
     * @param title
     * @param year
     * @param genre
     * @return
     */
    public boolean matchAny(String title, String year, String genre){ 
        return matchTitle(title)||matchYear(year)||matchGenre(genre);
    }
    
    
}
