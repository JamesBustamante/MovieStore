/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.*;
import javax.xml.XMLConstants;
import javax.xml.bind.*;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
/**
 *
 * @author james
 */
public class MovieStoreUserApplication {
        private String filePath;
        private Users users;

    public String getFilePath() {
        return filePath;
    }
    
    public MovieStoreUserApplication() {
    }

    public MovieStoreUserApplication(String filePath, Users users) {
        super();
        this.filePath = filePath;
        this.users = users;
    }
    
    

    public void setFilePath(String filePath) throws Exception {
       
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();
        

        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        users = (Users)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }
    
        public void updateXML(Users users, String filePath) throws Exception {
        this.users = users;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(users, fout);
        fout.close();
    }
        
        public void saveUsers() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(users, fout);
        fout.close();
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
        
        
}
