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
public class YearsCalc {
    public ArrayList<String> years = new ArrayList<>();

    public YearsCalc() {
    }
 
    public ArrayList<String> getYears() {
        return years;
    }
    public void addYear(String year) {
        years.add(year);
    }
    
    public void emptyYears(){
        years.clear();
    }
    
    
}
