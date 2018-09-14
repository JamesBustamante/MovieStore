/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

/**
 *
 * @author james
 */
import java.io.*;
import javax.xml.bind.*;

public class HistoryApplication {
    private String filePath;
    private History history;
    
     public String getFilePath() {
        return filePath;
    }

    public HistoryApplication(String filePath, History history) {
        super();
        this.filePath = filePath;
        this.history = history;
    }

    public HistoryApplication() {
    }
    
    public void setFilePath(String filePath) throws Exception {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(History.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        history = (History)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }
    
        public void updateXML(History history, String filePath) throws Exception {
        this.history = history;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(History.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(history, fout);
        fout.close();
    }
        
        public void saveHistory() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(History.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(history, fout);
        fout.close();
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }
    
}
