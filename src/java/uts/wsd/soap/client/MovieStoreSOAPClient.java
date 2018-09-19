/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap.client;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.wsd.Movie;

/**
 *
 * @author james
 */
public class MovieStoreSOAPClient {

    public static void main(String[] args) throws Exception_Exception, IOException_Exception {
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();

        MovieStoreSOAPClient client = new MovieStoreSOAPClient();

        System.out.println("====Welcome to the Movie Store HQ's SOAP Service====");
        System.out.println("----Login Page ----");

        User user = movieStore.fetchLogin(client.readEmail(), client.readPassword());
        //System.out.println(user);
        if (user != null) {
            System.out.println("Welcome " + user.getFullName());
        } else {
            System.out.println("Login details are invalid or incorrect");
            System.out.println("");
            main(args);
        }

        client.useMenu(client, user);

    }

    public MovieStoreSOAPClient() {

    }

    private String readEmail() {
        System.out.print("Enter your email: ");
        return In.nextLine();
    }

    private String readPassword() {
        System.out.print("Enter your Password: ");
        return In.nextLine();
    }

    private char readMenuChoice() {
        System.out.println("Select from the following: ");
        System.out.println("1. Make a movie order");
        System.out.println("2. Place an  order");
        System.out.println("3. View all of your orders");
        System.out.println("4. Cancel an Order");
        System.out.println("5. Cancel your account");
        System.out.println("6. Logout");
        System.out.print("Selection: ");
        return In.nextChar();
    }
    
    private uts.wsd.soap.client.Movie readMovieChoice() throws Exception_Exception, IOException_Exception {
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();
        int i = 0;
        for (uts.wsd.soap.client.Movie movie:movieStore.fetchMovies()){
            
            System.out.println(i + ". " + movie.getTitle() + "\tGenre: " + movie.getGenre() + "\tCopies: " + movie.getAvailableCopies()) ;
            i++;
        }
        System.out.print("Select Movie to Order [number]: ");
        
        int choice;
        while ((choice = In.nextInt()) > i) {
        System.out.println("-------Invalid Selection------");
            readMovieChoice();
        }
        i = 0;
         for (uts.wsd.soap.client.Movie movie:movieStore.fetchMovies()){
            if (i == choice)
                return movie;
            i++;
        }
         return null;
    }

    private void useMenu(MovieStoreSOAPClient client, User user) throws Exception_Exception  {
        char choice;
        while ((choice = client.readMenuChoice()) != '6') {
            switch (choice) {
                case '1':
            {
                try {
                    orderMovie(client, user);
                } catch (IOException_Exception ex) {
                    Logger.getLogger(MovieStoreSOAPClient.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                    break;
                case '2':
                    break;
                case '3':
                    break;
                case '4':
                    break;
                case '5':
                    break;
                default:
                    System.out.println("Input is invalid. Try again ");
                    break;
            }
        }
    }

    private void orderMovie(MovieStoreSOAPClient client, User user) throws Exception_Exception, IOException_Exception { //1
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();
        System.out.println("Ordering Movie...");
        uts.wsd.soap.client.Movie movieChoice = client.readMovieChoice();
        System.out.println("Amount..");
    }


    private void viewOrders(MovieStoreSOAPClient client, User user) {

    }

    private void cancelOrder(MovieStoreSOAPClient client, User user) {

    }

    private void cancelAccount(MovieStoreSOAPClient client, User user) {
        
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();
        
        System.out.println("Are to you sure you want to close/cancel your account? (enter: 'YES') ");
        String choice = In.nextLine();
        if (choice.endsWith("YES")){
            
        
        } else {System.out.println("Invalid input. Returning you to menu");}

    }

}
