/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
/**
 *
 * @author james
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "purchases")
public class Purchases implements Serializable {
    
    @XmlElement(name = "moviePurchase")
    private ArrayList<MoviePurchase> purchases = new ArrayList<MoviePurchase>();

    public Purchases() {
    }

    

    public ArrayList<MoviePurchase> getMovies() {
        return purchases;
    }
    
     public void setMovies(ArrayList<MoviePurchase> purchases) {
        this.purchases = purchases;
    }
    
}
