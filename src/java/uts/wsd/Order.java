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

    /**
     *
     */
    public Order() {
    }

    /**
     * creates and instance of parameters
     *
     * @param orderID
     * @param purchases
     * @param ID
     * @param email
     * @param fullName
     * @param paymentMethod
     * @param salesTotal
     * @param orderStatus
     */
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

    /**
     * getter for arrayList purchases
     *
     * @return purchases
     */
    public ArrayList<MoviePurchase> getPurchases() {
        return purchases;
    }

    /**
     * creates an instance of the parameter purchases
     *
     * @param purchases
     */
    public void setPurchases(ArrayList<MoviePurchase> purchases) {
        this.purchases = purchases;
    }

    /**
     * getter for orderID
     *
     * @return orderID
     */
    public String getOrderID() {
        return orderID;
    }

    /**
     * setter for orderID creates an instance of parameter orderID
     *
     * @param orderID
     */
    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    /**
     * getter for email
     *
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * creates and instance for email
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * getter of ID
     *
     * @return ID
     */
    public String getID() {
        return ID;
    }

    /**
     * creates an instance for ID
     *
     * @param ID
     */
    public void setID(String ID) {
        this.ID = ID;
    }

    /**
     * getter for fullName
     *
     * @return fullName
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * creates instance for parameter fullName
     *
     * @param fullName
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * getter for salesTotal
     *
     * @return salesTotal
     */
    public String getSalesTotal() {
        return salesTotal;
    }

    /**
     * creates an instance of salesTotal
     *
     * @param salesTotal
     */
    public void setSalesTotal(String salesTotal) {
        this.salesTotal = salesTotal;
    }

    /**
     * getter for orderStatus
     *
     * @return orderStatus
     */
    public String getOrderStatus() {
        return orderStatus;
    }

    /**
     * creates an instance of orderStatus
     *
     * @param orderStatus
     */
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    /**
     * getter for paymentMethod
     *
     * @return paymentMethod
     */
    public String getPaymentMethod() {
        return paymentMethod;
    }

    /**
     * creates an instance of paymentMethod
     *
     * @param paymentMethod
     */
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    /**
     * returns a boolean for email without whitespace
     *
     * @param email
     * @return boolean
     */
    public boolean matchEmail(String email) {
        return this.email.equals(email.trim());
    }

    /**
     * returns a boolean for orderID without whitespace
     *
     * @param orderID
     * @return boolean
     */
    public boolean matchOrderID(String orderID) {
        return this.orderID.equals(orderID.trim());
    }

    /**
     * returns a boolean for orderStatus without whitespace
     *
     * @param orderStatus
     * @return boolean
     */
    public boolean matchOrderStatus(String orderStatus) {
        return this.orderStatus.equals(orderStatus.trim());
    }

    /**
     * returns a boolean for ID without whitespace
     *
     * @param ID
     * @return boolean
     */
    public boolean matchIDStatus(String ID) {
        return this.ID.equals(ID.trim());
    }

}
