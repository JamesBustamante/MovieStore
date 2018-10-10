package uts.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author james
 */

/**
 * assigns regular expressions to variables
 */
public class Validator implements Serializable {

    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";
    private String namePattern = "([A-Z][a-z]+[\\s])+[A-Z][a-z]*";
    private String passwordPattern = "[a-z]{6,}[0-9]+";
    private String IDPattern = "[0-9]{5,6}";
    private String yearPattern = "([12]+[0-9]+[0-9]+[0-9])";
    private String quantityPattern = "([0-9]+)";

    /**
     *
     */
    public Validator() {
    }

    /**
     * check if match regular expressions
     * 
     * @param pattern
     * @param input
     * @return
     */
    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    /**
     * if email or password has empty string returns true
     * 
     * @param email
     * @param password
     * @return
     */
    public boolean checkEmpty(String email, String password) {
        return email.isEmpty() || password.isEmpty();
    }

    /**
     * returns true if email is accepted by emailPattern regular expression
     * 
     * @param email
     * @return
     */
    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    /**
     * returns true if ID is accepted by IDPatter regular expression
     * 
     * @param ID
     * @return
     */
    public boolean validateID(String ID) {
        return validate(IDPattern, ID);
    }

    /**
     * returns true if name is accepted by namePattern regular expression
     * 
     * @param name
     * @return
     */
    public boolean validateName(String name) {
        return validate(namePattern, name);
    }

    /**
     * returns true if password is accepted by passwordPattern regular expression
     * 
     * @param password
     * @return
     */
    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }

    /**
     * returns true if year is accepted by yearPattern regular expression
     * 
     * @param year
     * @return
     */
    public boolean validateYear(String year) {
        return validate(yearPattern, year);
    }

    /**
     * returns true if quantity is accepted by quantity regular expression
     * 
     * @param quantity
     * @return
     */
    public boolean validateQuantity(String quantity) {
        return validate(quantityPattern, quantity);
    }
}
