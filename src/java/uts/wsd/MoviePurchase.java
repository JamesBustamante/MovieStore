/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author james
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "moviePurchase")
public class MoviePurchase {

    @XmlElement(name = "title")
    private String title;
    @XmlElement(name = "genre")
    private String genre;
    @XmlElement(name = "releaseDate")
    private String releaseDate;
    @XmlElement(name = "price")
    private String price;
    @XmlElement(name = "NoCopies")
    private String NoCopies;

    //****new - testing for xml update****
    /**
     *
     */
    public MoviePurchase() {
    }
    //****new - testing for xml update****

    /**
     *  creates an instance of the parameters
     * 
     * @param title
     * @param genre
     * @param releaseDate
     * @param price
     * @param NoCopies
     */
    public MoviePurchase(String title, String genre, String releaseDate, String price, String NoCopies) {
        this.title = title;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.price = price;
        this.NoCopies = NoCopies;
    }

    /**
     * getter for genre
     * @return genre
     */
    public String getGenre() {
        return genre;
    }

    /**
     * creates an instance of the parameter
     * 
     * @param genre
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     * getter for NoCopies
     * @return NoCopies
     */
    public String getNoCopies() {
        return NoCopies;
    }

    /**
     * creates an instance of the parameter
     * 
     * @param NoCopies
     */
    public void setNoCopies(String NoCopies) {
        this.NoCopies = NoCopies;
    }

    /**
     * getter for title
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * creates an instance of the parameter
     *
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * getter for releaseDate
     * @return releaseDate
     */
    public String getReleaseDate() {
        return releaseDate;
    }

    /**
     * creates an instance of the parameter
     * 
     * @param releaseDate
     */
    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    /**
     * getter for price
     * @return price
     */
    public String getPrice() {
        return price;
    }

    /**
     * creates an instance of the parameter
     * 
     * @param price
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * returns a boolean for title
     * not case sensitive and removes white space
     * 
     * @param title
     * @return title
     */
    public boolean matchTitle(String title) {
        return this.title.equalsIgnoreCase(title.toLowerCase().trim());
    }
}
