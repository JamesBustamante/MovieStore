/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.util.ArrayList;

/**
 *
 * @author james
 */
public class SearchParam {
    public ArrayList<String> years = new ArrayList<>();
    String genre;
    String title;

    public SearchParam() {
    }
 
    public ArrayList<String> getYears() {
        return years;
    }

    public SearchParam(String genre, String title) {
        this.genre = genre;
        this.title = title;
    }
    public void addYear(String year) {
        years.add(year);
    }
    
    public void emptyYears(){
        years.clear();
    }
    
    public void emptyGenre(){
        genre = "";
    }
    
    public void emptyTitle(){
        title = "";
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
    
    
}
