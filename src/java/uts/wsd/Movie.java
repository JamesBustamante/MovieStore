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

    public Movie() {
    super();
    }

    public Movie(String title, String genre, String releaseDate, String price, String picture, String description, String availableCopies) {
        this.title = title;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.price = price;
        this.picture = picture;
        this.description = description;
        this.availableCopies = availableCopies;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getAvailableCopies() {
        return availableCopies;
    }

    public void setAvailableCopies(String availableCopies) {
        this.availableCopies = availableCopies;
    }
    
    public boolean matchGenre(String genre){
        return this.genre.equalsIgnoreCase(genre.toLowerCase().trim());
    }
    
    public boolean matchTitle(String title){
        return this.title.equals(title.toLowerCase().trim());
    }
    
    public boolean matchYear(String year){
        return this.releaseDate.equals(year.trim());
    }
    
    public boolean matchAll(String title, String year, String genre){        
        return matchTitle(title)&&matchYear(year)&&matchGenre(genre);
    }
    
    public boolean matchGenreAndYear(String genre, String year){        
        return matchYear(year)&&matchGenre(genre);
    }
    
    public boolean matchAny(String title, String year, String genre){ 
        return matchTitle(title)||matchYear(year)||matchGenre(genre);
    }
    
    
}
