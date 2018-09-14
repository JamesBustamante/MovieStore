/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

/**
 *
 * @author james
 * Used to create XML via JAXB annotations 
 * <circle>
 * <area>12.566370614359172</area>
 * <circumference>12.566370614359172</circumference>
 * <diameter>4.0</diameter>
 * <radius>2.0</radius>
 * </circle>
 */
import javax.xml.bind.annotation.*;

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Circle {

    private double radius;

    public Circle() {
        super();
    }

    public Circle(double radius) {
        this.radius = radius;
    }

    @XmlElement
    public double getArea() {
        return Math.PI * Math.pow(radius, 2);
    }

    @XmlElement
    public double getCircumference() {
        return 2 * Math.PI * radius;
    }

    @XmlElement
    public double getDiameter() {
        return 2 * radius;
    }

    @XmlElement
    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

}
