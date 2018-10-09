/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap;

import java.io.IOException;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import uts.wsd.HistoryApplication;
import uts.wsd.Movie;
import uts.wsd.MovieApplication;
import uts.wsd.MoviePurchase;
import uts.wsd.MovieStoreUserApplication;
import uts.wsd.Movies;
import uts.wsd.Order;
//import uts.wsd.Order;
import uts.wsd.User;
import uts.wsd.Users;

/**
 *
 * @author james
 */
@WebService(serviceName = "MovieStoreSOAP")
public class MovieStoreSOAP {
    
    @Resource
private WebServiceContext context;
    
    private MovieApplication getMovieApp() throws JAXBException, IOException, Exception {
        // The web server can haprivatendle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            MovieApplication movieApp = (MovieApplication) application.getAttribute("movieApp");
            if (movieApp == null) {
                movieApp = new MovieApplication();
                movieApp.setFilePath(application.getRealPath("WEB-INF/movies.xml"));
                application.setAttribute("movieApp", movieApp);
            }
            return movieApp;
        }
    }
    
    /**
     *
     * @return
     * @throws JAXBException
     * @throws IOException
     * @throws Exception
     */
    public HistoryApplication getHistoryApp() throws JAXBException, IOException, Exception {
        // The web server can haprivatendle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            HistoryApplication historyApp = (HistoryApplication) application.getAttribute("historyApp");
            if (historyApp == null) {
                historyApp = new HistoryApplication();
                historyApp.setFilePath(application.getRealPath("WEB-INF/history.xml"));
                application.setAttribute("historyApp", historyApp);
            }
            return historyApp;
        }
    }
     
     private MovieStoreUserApplication getUserApp() throws JAXBException, IOException, Exception {
        // The web server can haprivatendle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            MovieStoreUserApplication userApp = (MovieStoreUserApplication) application.getAttribute("userApp");
            if (userApp == null) {
                userApp = new MovieStoreUserApplication();
                userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("userApp", userApp);
            }
            return userApp;
        }
    }

    /**
     * This is a sample web service operation
     * @return 
     * @throws java.io.IOException 
     * @throws java.lang.Exception 
     */
        @WebMethod
    public Users fetchUsers() throws IOException, Exception, NullPointerException {
        return getUserApp().getUsers();
    }
    
    /**
     *
     * @param email
     * @param password
     * @return
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public User fetchLogin(String email, String password) throws IOException, Exception, NullPointerException {
        return getUserApp().getUsers().login(email, password);
    }
    
    /**
     *
     * @return
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public ArrayList<Movie> fetchMovies() throws IOException, Exception, NullPointerException {
        Movies movies = getMovieApp().getMovies();
                    ArrayList<Movie> matches = movies.getMovies();
        return matches;
    }
    
    /**
     *
     * @param user
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public void removeUser(User user) throws IOException, Exception, NullPointerException {
        MovieStoreUserApplication userApp = getUserApp();
        
        userApp.getUsers().removeUser(user);
        userApp.saveUsers();
    }
    
    /**
     *
     * @param OrderID
     * @return
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public Order matchOrderID(String OrderID) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        Order order = historyApp.getHistory().getOrderIDMatch(OrderID);
        return order;
    }
    
    /**
     *
     * @param OrderID
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public void cancelOrder(String OrderID) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        historyApp.getHistory().getOrderIDMatch(OrderID).setOrderStatus("Cancelled");
        historyApp.saveHistory();
        Movies movies = getMovieApp().getMovies();
        Order order = historyApp.getHistory().getOrderIDMatch(OrderID);
                ArrayList<MoviePurchase> purchases = order.getPurchases();
            ArrayList<Movie> matchMovies = movies.getMovies();
                for (MoviePurchase purchase : purchases ) {
                    for (Movie movie : matchMovies) {
                        if (purchase.getTitle().equals(movie.getTitle())){
                            int addBack = Integer.parseInt(movie.getAvailableCopies()) + Integer.parseInt(purchase.getNoCopies());
                            getMovieApp().getMovies().getMoviebyTitle(movie.getTitle()).setAvailableCopies(String.valueOf(addBack));
                        }
                    }
                }//movieApp.getMovies().setMovies(matchMovies);
                getMovieApp().saveMovies();
                historyApp.saveHistory();
    }
    
    /**
     *
     * @param UserID
     * @return
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public ArrayList<Order> getOrdersbyID(String UserID) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        ArrayList<Order> matches = historyApp.getHistory().getUserIDMatches(UserID);
        return matches;
    }
    
    /**
     *
     * @param UserID
     * @param Title
     * @return
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public ArrayList<Order> getOrdersbyTitle(String UserID, String Title) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        ArrayList<Order> matches = historyApp.getHistory().getOrdersMovieMatches(Title,UserID);
        return matches;
    }

    /**
     *
     * @param UserID
     * @param status
     * @return
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public ArrayList<Order> getOrdersbyStatus(String UserID, String status) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        ArrayList<Order> matches = historyApp.getHistory().getOrdersStatusMatches(UserID, status);
        return matches;
    }

    /**
     *
     * @param order
     * @param moviePurchases
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public void addOrder(Order order, ArrayList<uts.wsd.MoviePurchase> moviePurchases) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        order.setPurchases(moviePurchases);
        historyApp.getHistory().addOrder(order);
        historyApp.saveHistory();
     
    }
    
    /**
     *
     * @return
     * @throws IOException
     * @throws Exception
     * @throws NullPointerException
     */
    @WebMethod
    public HistoryApplication getHisApp() throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        return historyApp;
     
    }
    
}

