package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 *
 * @author WILL
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Order implements Serializable {

    @XmlElement(name = "orderID")
    private int orderID;
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
    
    public Order(int orderID, String title, String genre, String releaseDate, String price, String NoCopies) {
        this.orderID = orderID;
        this.title = title;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.price = price;
        this.NoCopies = NoCopies;                
    }
    
    public Order() {}
    
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
    public String getTitle() {
        return title;
    }
    public String getGenre() {
        return genre;
    }
    public String getReleaseDate() {
        return releaseDate;
    }
    public String getPrice() {
        return price;
    }
    public String getNoCopies() {
        return NoCopies;
    }
    

}
