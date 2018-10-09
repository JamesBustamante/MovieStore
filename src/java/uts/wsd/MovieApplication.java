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
import javax.xml.XMLConstants;
import javax.xml.bind.*;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

/**
 *
 * @author james
 */
public class MovieApplication {
        private String filePath;
        private Movies movies;
    
    /**
     *
     * @return
     */
    public String getFilePath() {
        return filePath;
    }

    /**
     *
     * @param filePath
     * @param movies
     */
    public MovieApplication(String filePath, Movies movies) {
        super();
        this.filePath = filePath;
        this.movies = movies;
    }
        
    /**
     *
     */
    public MovieApplication() {
    }

    /**
     *
     * @param filePath
     * @throws Exception
     */
    public void setFilePath(String filePath) throws Exception {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        movies = (Movies)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }
    
    /**
     *
     * @param movies
     * @param filePath
     * @throws Exception
     */
    public void updateXML(Movies movies, String filePath) throws Exception {
        this.movies = movies;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(movies, fout);
        fout.close();
    }
        
    /**
     *
     * @throws JAXBException
     * @throws IOException
     */
    public void saveMovies() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(movies, fout);
        fout.close();
    }

    /**
     *
     * @return
     */
    public Movies getMovies() {
        return movies;
    }

    /**
     *
     * @param movies
     */
    public void setMovies(Movies movies) {
        this.movies = movies;
    }
}
