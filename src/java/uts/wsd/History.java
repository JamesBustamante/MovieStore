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
    Purchases purchases;
    
    @XmlElement(name = "order")
    private ArrayList<Order> history = new ArrayList<Order>(); 
    
    public History() {
    }

    public ArrayList<Order> getHistory() {
        return history;
    }
    
    public void addOrder(Order newOrder)
    {
        history.add(newOrder);
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
    
    public ArrayList<Order> getOrdersMovieMatches(String title) {
        MoviePurchase moviePurchase; 
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : history) {
            for (int i = order.getPurchases().size(); i>0; i--) { //Gets Number of purchases
                moviePurchase = order.getPurchases().get(i-1); //Set a single movie purchase
                if (moviePurchase.matchTitle(title)) { //Match movie purchase to a title
                    matches.add(order); 
            }
            }
        }
        return matches;
    }
}
