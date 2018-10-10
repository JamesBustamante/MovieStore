/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.wsd.Movie;
import uts.wsd.soap.client.Order.Purchases;



/**
 *
 * @author james
 */
public class MovieStoreSOAPClient {

    /**
     *
     * @param args
     * @throws Exception_Exception
     * @throws IOException_Exception
     * @throws JAXBException_Exception
     */
    public static void main(String[] args) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
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

    /**
     *
     */
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

    private String readOrderID() {
        System.out.print("Enter your Order ID you would like to cancel: ");
        return In.nextLine();
    }

    private int readAmount() {
        System.out.print("Enter No of copies: ");
        return In.nextInt();
    }

    private String readOrderIDSearch() {
        System.out.print("Enter your Order ID: ");
        return In.nextLine();
    }

    private String readTitle() {
        System.out.print("Enter title: ");
        return In.nextLine();
    }

    private String readStatus() {
        System.out.print("Selected Status: ");
        System.out.print("1. Cancelled ");
        System.out.print("2. Submitted");
        return In.nextLine();
    }

    private char readMenuChoice() {
        System.out.println("Select from the following: ");
        System.out.println("1. Make a movie order");
        System.out.println("2. View orders");
        System.out.println("3. Cancel an Order");
        System.out.println("4. Cancel your account");
        System.out.println("5. Logout");
        System.out.print("Selection: ");
        return In.nextChar();
    }

    private char readContinue() {
        System.out.print("Selection (y/n): ");
        return In.nextChar();
    }

    private char readViewOrdersByChoice() {
        System.out.println("View your order by: ");
        System.out.println("1. View all orders");
        System.out.println("2. Order ID");
        System.out.println("3. Movie Title");
        System.out.println("4. Order Status");
        System.out.print("Selection: ");
        return In.nextChar();
    }

    private uts.wsd.soap.client.Movie readMovieChoice() throws Exception_Exception, IOException_Exception {
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();
        int i = 0;
        for (uts.wsd.soap.client.Movie movie : movieStore.fetchMovies()) {

            System.out.println(i + ". " + movie.getTitle() + "\tGenre: " + movie.getGenre() + "\tCopies: " + movie.getAvailableCopies());
            i++;
        }
        System.out.print("Select Movie to Order [number]: ");

        int choice;
        while ((choice = In.nextInt()) > i) {
            System.out.println("-------Invalid Selection------");
            readMovieChoice();
        }
        i = 0;
        for (uts.wsd.soap.client.Movie movie : movieStore.fetchMovies()) {
            if (i == choice) {
                return movie;
            }
            i++;
        }
        return null;
    }

    private void useMenu(MovieStoreSOAPClient client, User user) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        char choice;
        while ((choice = client.readMenuChoice()) != '6') {
            switch (choice) {
                case '1': {
                    try {
                        orderMovie(client, user);
                    } catch (IOException_Exception ex) {
                        Logger.getLogger(MovieStoreSOAPClient.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
                case '2':
                    viewOrders(client, user);
                    break;
                case '3':
                    cancelOrder(client, user);
                    break;
                case '4': {
                    try {
                        cancelAccount(client, user);
                    } catch (IOException_Exception ex) {
                        Logger.getLogger(MovieStoreSOAPClient.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
                case '5':
                    logout(client, user);
                    break;
                default:
                    System.out.println("Input is invalid. Try again ");
                    break;
            }
        }
    }

    private void orderMovie(MovieStoreSOAPClient client, User user) throws Exception_Exception, IOException_Exception, JAXBException_Exception { //1
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();
        boolean contin = true;
        ArrayList<uts.wsd.soap.client.Movie> movies = new ArrayList<uts.wsd.soap.client.Movie>();
        while (contin) {
            System.out.println("Ordering Movie...");
            uts.wsd.soap.client.Movie movieChoice = client.readMovieChoice();
            
            movies.add(movieChoice);
            
            System.out.println("Amount..");
            int amount = client.readAmount();
            System.out.println("Added to order------");
            System.out.println("Added another movie?");
            char choice = client.readContinue();
            if (choice == 'y') {
                contin = true;
            } else {
                contin = false;
            }
        }
        System.out.println("Checkout?");
        char choice = client.readContinue();
        if (choice == 'y') {
            Random random = new Random();
            int x = random.nextInt(900) + 100;
            ArrayList<uts.wsd.MoviePurchase> purchases = new ArrayList<>();
            uts.wsd.Order newOrder = new uts.wsd.Order(Integer.toString(x), purchases, user.getID(), user.getEmail(), user.getFullName(), "card", "0.0", "Submitted");
            //Integer.toString(x),purchases,user.getID(),user.getEmail(), user.getFullName(), "Card", "0.00", "Submitted"
//            newOrder.setID(user.getID());
//            newOrder.setEmail(user.getEmail());
//            newOrder.setFullName(user.getFullName());
//            newOrder.setOrderID(Integer.toString(x));
//            newOrder.setOrderStatus("Submitted");
//            newOrder.setPaymentMethod("Card");
//            newOrder.setSalesTotal("0.00");
//            uts.wsd.Purchases total = new uts.wsd.Purchases();
//            newOrder.setPurchases(total);
            //List<MoviePurchase> moviePurchases = total.moviePurchase;
            List<MoviePurchase> moviePurchases = new ArrayList<>();
            double total = 0.00;
            for (uts.wsd.soap.client.Movie movie: movies){
                //uts.wsd.MoviePurchase moviePurchase = new uts.wsd.MoviePurchase("d","r","d","d","d");
                MoviePurchase moviePurchase1 = movieStore.matchOrderID("122").getPurchases().moviePurchase.get(0);
                moviePurchase1.setGenre(movie.getGenre());
                moviePurchase1.setNoCopies("1");
                moviePurchase1.setPrice(movie.getPrice());
                moviePurchase1.setReleaseDate(movie.getReleaseDate());
                moviePurchase1.setTitle(movie.getTitle());
                moviePurchases.add(moviePurchase1);
                total = total + Double.parseDouble(movie.getPrice());
                
                 //purchases.add(moviePurchase);
            }
           
            //total.getMoviePurchase().add((MoviePurchase) moviePurchases);
            //newOrder.setPurchases(purchases);
            Order order = movieStore.matchOrderID("122");
            order.setEmail(newOrder.getEmail());
            order.setID(user.getID());
            order.setEmail(user.getEmail());
            order.setFullName(user.getFullName());
            order.setOrderID(Integer.toString(x));
            order.setOrderStatus("Submitted");
            order.setPaymentMethod("PayPal");
            order.setSalesTotal(Double.toString(total));
           movieStore.addOrder(order, moviePurchases);
           
           
           
            System.out.print("Order Confimed");
           
        }
    }

    private void viewOrders(MovieStoreSOAPClient client, User user) throws Exception_Exception, IOException_Exception {
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();
        char selection = client.readViewOrdersByChoice();
        switch (selection) {
            case '1': {
                ArrayList<Order> matches = (ArrayList<Order>) movieStore.getOrdersbyID(user.getID());
                for (Order order : matches) {
                    System.out.println("Order ID: " + order.getOrderID());
                    System.out.println("Payment Method: " + order.getPaymentMethod());
                    System.out.println("Order Status: " + order.getOrderStatus());
                    System.out.println("Sales Total: " + order.getSalesTotal());
                    System.out.println("MOVIES PRUCHASE: ++++++++");
                    int movies = order.getPurchases().getMoviePurchase().size();
                    System.out.println(order.getPurchases().getMoviePurchase().size());
                    for (int i = 0; i < movies; i++) {
                        MoviePurchase purchase = order.getPurchases().getMoviePurchase().get(i);
                        System.out.println("Title: " + purchase.getTitle());
                        System.out.println("Price: " + purchase.getPrice());
                        System.out.println("Copies: " + purchase.getNoCopies());
                        System.out.println();
                    }
                    System.out.println("----------------------------------------------------------");
                }
            }
            break;
            case '2': {
                String orderID = client.readOrderIDSearch();
                Order order = movieStore.matchOrderID(orderID);
                System.out.println("Order ID: " + order.getOrderID());
                System.out.println("Payment Method: " + order.getPaymentMethod());
                System.out.println("Order Status: " + order.getOrderStatus());
                System.out.println("Sales Total: " + order.getSalesTotal());
                System.out.println("MOVIES PRUCHASE: ++++++++");
                int movies = order.getPurchases().getMoviePurchase().size();
                for (int i = 0; i < movies; i++) {
                    MoviePurchase purchase = order.getPurchases().getMoviePurchase().get(i);
                    System.out.println("Title: " + purchase.getTitle());
                    System.out.println("Price: " + purchase.getPrice());
                    System.out.println("Copies: " + purchase.getNoCopies());
                    System.out.println();
                }
                System.out.println("----------------------------------------------------------");

            }
            break;
            case '3': {
                String title = client.readTitle();
                ArrayList<Order> matches = (ArrayList<Order>) movieStore.getOrdersbyTitle(user.getID(), title);
                for (Order order : matches) {
                    System.out.println("Order ID: " + order.getOrderID());
                    System.out.println("Payment Method: " + order.getPaymentMethod());
                    System.out.println("Order Status: " + order.getOrderStatus());
                    System.out.println("Sales Total: " + order.getSalesTotal());
                    System.out.println("MOVIES PRUCHASE: ++++++++");
                    int movies = order.getPurchases().getMoviePurchase().size();
                    for (int i = 0; i < movies; i++) {
                        MoviePurchase purchase = order.getPurchases().getMoviePurchase().get(i);
                        System.out.println("Title: " + purchase.getTitle());
                        System.out.println("Price: " + purchase.getPrice());
                        System.out.println("Copies: " + purchase.getNoCopies());
                        System.out.println();
                    }
                    System.out.println("----------------------------------------------------------");
                }

            }
            break;
            case '4': {
                String status = client.readStatus();
                if (status.equals("1")) {
                    status = "Cancelled";
                } else {
                    status = "Submitted";
                }
                ArrayList<Order> matches = (ArrayList<Order>) movieStore.getOrdersbyStatus(user.getID(), status);
                for (Order order : matches) {
                    System.out.println("Order ID: " + order.getOrderID());
                    System.out.println("Payment Method: " + order.getPaymentMethod());
                    System.out.println("Order Status: " + order.getOrderStatus());
                    System.out.println("Sales Total: " + order.getSalesTotal());
                    System.out.println("MOVIES PRUCHASE: ++++++++");
                    int movies = order.getPurchases().getMoviePurchase().size();
                    for (int i = 0; i < movies; i++) {
                        MoviePurchase purchase = order.getPurchases().getMoviePurchase().get(i);
                        System.out.println("Title: " + purchase.getTitle());
                        System.out.println("Price: " + purchase.getPrice());
                        System.out.println("Copies: " + purchase.getNoCopies());
                        System.out.println();
                    }
                    System.out.print("----------------------------------------------------------");
                }
            }
            break;
            default:
                break;
        }
    }

    private void cancelOrder(MovieStoreSOAPClient client, User user) throws Exception_Exception, IOException_Exception {
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();

        String orderID = readOrderID();
        Order order = movieStore.matchOrderID(orderID);
        System.out.println(order.getOrderID());
        if (order != null) {
            System.out.println(order.getID());
            System.out.println(user.getID());
            if (order.getID().equals(user.getID()) && order.getOrderStatus().equals("Submitted")) {
                System.out.print("Order " + orderID + " has been cancelled.");
                movieStore.cancelOrder(orderID);
            } else {
                System.out.print("Invalid Order ID. Returning to Menu.");
            }
        }
    }

    private void cancelAccount(MovieStoreSOAPClient client, User user) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        MovieStoreSOAP_Service locator = new MovieStoreSOAP_Service();
        MovieStoreSOAP movieStore = locator.getMovieStoreSOAPPort();

        System.out.println("Are to you sure you want to close/cancel your account? (enter: 'YES') ");
        String choice = In.nextLine();
        if (choice.endsWith("YES")) {
            System.out.print(user.getFullName());
            movieStore.removeUser(user);
            System.out.println("Account has been deleted. Restarting Program");
            String[] args = {};
            client.main(args);

        } else {
            System.out.println("Invalid input. Returning you to menu");
        }
    }

    private void logout(MovieStoreSOAPClient client, User user) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        System.out.println("Account has been logged out. Restarting Program");
        String[] args = {};
        client.main(args);
    }

}
