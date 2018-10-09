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
    public Order() {}

    /**
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
     *
     * @return
     */
    public ArrayList<MoviePurchase> getPurchases() {
        return purchases;
    }

    /**
     *
     * @param purchases
     */
    public void setPurchases(ArrayList<MoviePurchase> purchases) {
        this.purchases = purchases;
    }

    /**
     *
     * @return
     */
    public String getOrderID() {
        return orderID;
    }

    /**
     *
     * @param orderID
     */
    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    /**
     *
     * @return
     */
    public String getEmail() {
        return email;
    }

    /**
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     *
     * @return
     */
    public String getID() {
        return ID;
    }

    /**
     *
     * @param ID
     */
    public void setID(String ID) {
        this.ID = ID;
    }

    /**
     *
     * @return
     */
    public String getFullName() {
        return fullName;
    }

    /**
     *
     * @param fullName
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     *
     * @return
     */
    public String getSalesTotal() {
        return salesTotal;
    }

    /**
     *
     * @param salesTotal
     */
    public void setSalesTotal(String salesTotal) {
        this.salesTotal = salesTotal;
    }

    /**
     *
     * @return
     */
    public String getOrderStatus() {
        return orderStatus;
    }

    /**
     *
     * @param orderStatus
     */
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    /**
     *
     * @return
     */
    public String getPaymentMethod() {
        return paymentMethod;
    }

    /**
     *
     * @param paymentMethod
     */
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    /**
     *
     * @param email
     * @return
     */
    public boolean matchEmail(String email) {
        return this.email.equals(email.trim());
    }

    /**
     *
     * @param orderID
     * @return
     */
    public boolean matchOrderID(String orderID) {
        return this.orderID.equals(orderID.trim());
    }

    /**
     *
     * @param orderStatus
     * @return
     */
    public boolean matchOrderStatus(String orderStatus) {
        return this.orderStatus.equals(orderStatus.trim());
    }
    
    /**
     *
     * @param ID
     * @return
     */
    public boolean matchIDStatus(String ID) {
        return this.ID.equals(ID.trim());
    }

}
