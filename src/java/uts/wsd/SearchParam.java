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

    /**
     *
     */
    public ArrayList<String> years = new ArrayList<>();
    String genre;
    String title;

    /**
     *
     */
    public SearchParam() {
        genre = "";
        title = "";
    }
 
    /**
     *
     * @return
     */
    public ArrayList<String> getYears() {
        return years;
    }

    /**
     *
     * @param genre
     * @param title
     */
    public SearchParam(String genre, String title) {
        this.genre = genre;
        this.title = title;
    }

    /**
     *
     * @param year
     */
    public void addYear(String year) {
        years.add(year);
    }
    
    /**
     *
     */
    public void emptyYears(){
        years.clear();
    }
    
    /**
     *
     */
    public void emptyGenre(){
        genre = "";
    }
    
    /**
     *
     */
    public void emptyTitle(){
        title = "";
    }

    /**
     *
     * @return
     */
    public String getGenre() {
        return genre;
    }

    /**
     *
     * @param genre
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     *
     * @return
     */
    public String getTitle() {
        return title;
    }

    /**
     *
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }
    
    
    
    
}
