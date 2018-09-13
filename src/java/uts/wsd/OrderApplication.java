package uts.wsd;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.ejb.Stateless;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author WILL
 */
@Stateless
public class OrderApplication {

    private String filePath;
    private Orders orders;
    
    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws Exception {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Orders.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        orders = (Orders) u.unmarshal(fin);
        fin.close();
    }

    public void updateXML(Orders orders, String filePath) throws Exception {
        this.orders = orders;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Orders.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(orders, fout);
        fout.close();
    }

    public void saveOrders() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Orders.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(orders, fout);
        fout.close();
    }

    public Orders getOrder() {
        return orders;
    }
        
}
