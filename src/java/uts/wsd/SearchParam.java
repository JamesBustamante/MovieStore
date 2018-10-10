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
     * creates a new arrayList of strings defines two variables as strings
     */
    public ArrayList<String> years = new ArrayList<>();
    String genre;
    String title;

    /**
     * method sets both variables to empty strings
     */
    public SearchParam() {
        genre = "";
        title = "";
    }

    /**
     * method getYears() returns the arrayList years defined above
     *
     * @return years
     */
    public ArrayList<String> getYears() {
        return years;
    }

    /**
     * creates an instance for each of the parameters
     *
     * @param genre
     * @param title
     */
    public SearchParam(String genre, String title) {
        this.genre = genre;
        this.title = title;
    }

    /**
     * method adds year (as a string) to the arrayList years
     *
     * @param year
     */
    public void addYear(String year) {
        years.add(year);
    }

    /**
     * method removes all elements in arrayList years
     */
    public void emptyYears() {
        years.clear();
    }

    /**
     * sets genre to empty string
     */
    public void emptyGenre() {
        genre = "";
    }

    /**
     * sets title to empty string
     */
    public void emptyTitle() {
        title = "";
    }

    /**
     * returns variable genre
     *
     * @return genre
     */
    public String getGenre() {
        return genre;
    }

    /**
     * creates instance for parameter genre
     *
     * @param genre
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     * method returns variable title
     *
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * creates an instance for the parameter title
     *
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

}
