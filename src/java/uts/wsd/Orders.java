package uts.wsd;

/**
 *
 * @author WILL
 */

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "orders")
public class Orders implements Serializable{
    @XmlElement(name = "orders")
    private final ArrayList<Order> list = new ArrayList<Order>();
    
    public ArrayList<Order> getList() {
        return list;
    }
    
    public void addOrder(Order newOrder) {
        list.add(newOrder);
    }
}
