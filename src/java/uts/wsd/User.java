/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;

/**
 *
 * @author james
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "user")
public class User implements Serializable {

    @XmlElement(name = "ID")
    private String ID;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "fullName")
    private String fullName;
    @XmlElement(name = "phone")
    private String phone;
    @XmlElement(name = "address")
    private String address;
    @XmlElement(name = "gender")
    private String gender;

    /**
     * creates an instance for each of the parameters
     *
     * @param ID
     * @param email
     * @param password
     * @param fullName
     * @param phone
     * @param address
     * @param gender
     */
    public User(String ID, String email, String password, String fullName, String phone, String address, String gender) {
        this.ID = ID;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
    }

    /**
     *
     */
    public User() {
    }

    /**
     * getter for ID
     * @return ID
     */
    public String getID() {
        return ID;
    }

    /**
     * creates instance of parameter
     *
     * @param ID
     */
    public void setId(String ID) {
        this.ID = ID;
    }

    /**
     * getter for email
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * creates instance of parameter
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * getter for password
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * creates instance of parameter
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * getter for fullName
     * @return fullName
     */
    public String getfullName() {
        return fullName;
    }

    /**
     * creates instance of parameter
     *
     * @param fullName
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * getter for phone
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * creates instance of parameter
     *
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * getter for address
     * @return address
     */
    public String getAddress() {
        return address;
    }

    /**
     * creates instance of parameter
     *
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * creates instance of parameter and removes whitespace
     *
     * @param email
     * @return email
     */
    public boolean matchEmail(String email) {
        return this.email.equals(email.trim());
    }
}
