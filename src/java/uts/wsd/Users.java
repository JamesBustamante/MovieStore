/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

/**
 *
 * @author james
 */
import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;
 
/**
 *
 * @author james
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users")
public class Users implements Serializable {
    
    @XmlElement(name = "user")
    private ArrayList<User> list = new ArrayList<User>();
 
    /**
     *
     * @return
     */
    public ArrayList<User> getList() {
        return list;
    }

    /**
     *
     * @param user
     */
    public void addUser(User user) {
        list.add(user);
    }

    /**
     *
     * @param user
     */
    public void removeUser(User user) {
        list.remove(user);
    }

    /**
     *
     * @param email
     * @param password
     * @return
     */
    public User login(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
    /**
     *
     * @param email
     * @return
     */
    public boolean getUser(String email) {
        for (User user : list) {
            if (user.matchEmail(email)) {
                return true;
            }
        }
        return false;
    }
        
    /**
     *
     * @param id
     * @return
     */
    public User getIDUser(String id) {
        // For each user in the list...
        for (User user : list) {
            if (user.getID().equals(id))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }  
    
}
