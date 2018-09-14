/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;
import uts.wsd.History;
import uts.wsd.HistoryApplication;

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
        
    @Path("history")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public History getUsers() throws JAXBException, IOException, Exception {
        return getHistoryApp().getHistory();
    }
    
}
