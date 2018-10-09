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
    public MoviePurchase(){}
    //****new - testing for xml update****

    /**
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
    public String getNoCopies() {
        return NoCopies;
    }

    /**
     *
     * @param NoCopies
     */
    public void setNoCopies(String NoCopies) {
        this.NoCopies = NoCopies;
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
     * @param title
     * @return
     */
    public boolean matchTitle(String title) {
        return this.title.equalsIgnoreCase(title.toLowerCase().trim());
    }
}
