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

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getNoCopies() {
        return NoCopies;
    }

    public void setNoCopies(String NoCopies) {
        this.NoCopies = NoCopies;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    
    public boolean matchTitle(String title) {
        return this.title.equalsIgnoreCase(title.toLowerCase().trim());
    }


}
