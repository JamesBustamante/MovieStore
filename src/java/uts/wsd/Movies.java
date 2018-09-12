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

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "movies")
public class Movies implements Serializable {
    
    @XmlElement(name = "movie")
    private ArrayList<Movie> movies = new ArrayList<Movie>();
    
    public Movies() {
    }
    public ArrayList<Movie> getMovies() {
        return movies;
    }
    
    
}
