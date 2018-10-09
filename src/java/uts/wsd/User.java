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
    public User() {}
      
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
    public void setId(String ID) {
        this.ID = ID;
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
    public String getPassword() {
        return password;
    }

    /**
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     *
     * @return
     */
    public String getfullName() {
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
    public String getPhone() {
        return phone;
    }

    /**
     *
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     *
     * @return
     */
    public String getAddress() {
        return address;
    }

    /**
     *
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }
    
    /**
     *
     * @param email
     * @return
     */
    public boolean matchEmail(String email) {
        return this.email.equals(email.trim());
    }

    
}
