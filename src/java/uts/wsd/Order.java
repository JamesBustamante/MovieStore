/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author james
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "order")
public class Order {

    @XmlElement(name = "orderID")
    private String orderID;
    @XmlElementWrapper(name = "purchases")
    @XmlElement(name = "moviePurchase")
    private ArrayList<MoviePurchase> purchases;
    @XmlElement(name = "ID") //USER ID
    private String ID;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "fullName")
    private String fullName;
    @XmlElement(name = "paymentMethod")
    private String paymentMethod;
    @XmlElement(name = "salesTotal")
    private String salesTotal;
    @XmlElement(name = "orderStatus")
    private String orderStatus;

    public Order() {}

    public Order(String orderID, ArrayList<MoviePurchase> purchases, String ID, String email, String fullName, String paymentMethod, String salesTotal, String orderStatus) {
        this.orderID = orderID;
        this.purchases = purchases;
        this.ID = ID;
        this.email = email;
        this.fullName = fullName;
        this.paymentMethod = paymentMethod;
        this.salesTotal = salesTotal;
        this.orderStatus = orderStatus;
    }

    public ArrayList<MoviePurchase> getPurchases() {
        return purchases;
    }

    public void setPurchases(ArrayList<MoviePurchase> purchases) {
        this.purchases = purchases;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getSalesTotal() {
        return salesTotal;
    }

    public void setSalesTotal(String salesTotal) {
        this.salesTotal = salesTotal;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public boolean matchEmail(String email) {
        return this.email.equals(email.trim());
    }

    public boolean matchOrderID(String orderID) {
        return this.orderID.equals(orderID.trim());
    }

    public boolean matchOrderStatus(String orderStatus) {
        return this.orderStatus.equals(orderStatus.trim());
    }

}
