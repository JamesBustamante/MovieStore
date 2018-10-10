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
     * getter for arrayList list
     * @return list
     */
    public ArrayList<User> getList() {
        return list;
    }

    /**
     * adds user to the arrayList list
     * @param user
     */
    public void addUser(User user) {
        list.add(user);
    }

    /**
     * removes user from the arrayList list
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
     * checks through list of users in the list and checks email
     * @param email
     * @return boolean
     */
    public boolean getUser(String email) {
        for (User user : list) {
            if (user.matchEmail(email)) { //if user email matches
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
