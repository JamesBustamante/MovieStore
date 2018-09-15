/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
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
    
    public ArrayList<Order> getOrdersEmailMatches(String email) {
  
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : history) {
            if (order.matchEmail(email)) {
                matches.add(order);
            }
        }
        return matches;
    }
    
    public ArrayList<Order> getOrdersStatusMatches(String orderStatus) {
  
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : history) {
            if (order.matchOrderStatus(orderStatus)) {
                matches.add(order);
            }
        }
        return matches;
    }
    
    public Order getOrderIDMatch(String orderID) {

        for (Order order : history) {
            if (order.matchOrderID(orderID)) {
                return order;
            }
        }
        return null;
    }

}
