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
@XmlRootElement(name = "history")
public class History implements Serializable {

    @XmlElement(name = "order")
    private ArrayList<Order> history= new ArrayList<Order>();
    
    public History() {
    }

    public ArrayList<Order> getMovies() {
        return history;
    }

}
