/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;
import uts.wsd.History;
import uts.wsd.HistoryApplication;
import uts.wsd.Order;

/**
 *
 * @author james 
 */
@Path("/historyApp")
public class HistoryService {
    
    @Context
    private ServletContext application;
    
        private HistoryApplication getHistoryApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            HistoryApplication HistoryApp = (HistoryApplication) application.getAttribute("HistoryApp");
            if (HistoryApp == null) {
                HistoryApp = new HistoryApplication();
                HistoryApp.setFilePath(application.getRealPath("WEB-INF/history.xml"));
                application.setAttribute("HistoryApp", HistoryApp);
            }
            return HistoryApp;
        }
    }
        //http://localhost:8080/MovieStore/rest/historyApp/history
        //If no parameters are given, all available orders should be returned.
    @Path("history")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public History getHistory() throws JAXBException, IOException, Exception {
        return getHistoryApp().getHistory();
    }
    
    //http://localhost:8080/MovieStore/rest/historyApp/history/email/"EMAIL"
    //Search via user email
    @Path("history/email/{email}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<Order> getHistory(@PathParam("email") String email) throws JAXBException, IOException, Exception {
            //email = "nathan22@gmail.com";
        return getHistoryApp().getHistory().getOrdersEmailMatches(email);
    }
    
    //http://localhost:8080/MovieStore/rest/historyApp/history/orderID/"ID"
    //Search via order ID
    @Path("history/orderID/{orderID}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Order getHistoryID(@PathParam("orderID") String orderID) throws JAXBException, IOException, Exception {
            //email = "nathan22@gmail.com";
        return getHistoryApp().getHistory().getOrderIDMatch(orderID);
    }
    
    //http://localhost:8080/MovieStore/rest/historyApp/history/orderStatus/"Cancelled||Submitted"
    //Search via order Status
    @Path("history/orderStatus/{orderStatus}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Order> getHistoryStatus(@PathParam("orderStatus") String orderStatus) throws JAXBException, IOException, Exception {
            //email = "nathan22@gmail.com";
        return getHistoryApp().getHistory().getOrdersStatusMatches(orderStatus);
    }
    
    //http://localhost:8080/MovieStore/rest/historyApp/history/movieTitle/"title"
    //Search via movie title ordered
    @Path("history/movieTitle/{title}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Order> getHistoryMovieTitle(@PathParam("title") String title) throws JAXBException, IOException, Exception {
            //email = "nathan22@gmail.com";
        return getHistoryApp().getHistory().getOrdersMovieMatches(title);
    }
    
    
}
