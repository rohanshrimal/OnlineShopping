

import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;  
import org.xml.sax.SAXException;

public class SaveProduct extends HttpServlet {

    Connection con=null;
    PreparedStatement ps=null;
    String qr=null;
   
    
    @Override
    public void init() throws ServletException {
       try{ 
        con=(Connection)getServletContext().getAttribute("datacon");
        qr="insert into products values(?,?,?,?,?)";
        ps=con.prepareStatement(qr);
       }
       catch(Exception e)
       {
           
       }
//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void destroy() {
        try
        {
       
        }
        catch(Exception e)
        {
        }
        //To change body of generated methods, choose Tools | Templates.
    }
  
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SAXException {
        
        PrintWriter out=null;
        out=response.getWriter();
      
        String pcode=request.getParameter("pcode");
        String pname=request.getParameter("pname");
        String desc=request.getParameter("desc");
        String price=request.getParameter("price");
        String category=request.getParameter("category");
       
        try{
                String xmlFile=getServletContext().getRealPath("Products.xml");
                DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
                Document doc = null;

                if(xmlFile==null)
                {
                    doc=docBuilder.newDocument();
                }
                else
                {
                    doc=docBuilder.parse(xmlFile);
                    Node products = doc.getDocumentElement();

                    Element product = doc.createElement("product");

                    Element ppcode = doc.createElement("pcode");
                    ppcode.appendChild(doc.createTextNode(pcode));
                    product.appendChild(ppcode);

                    Element ppname = doc.createElement("pname");
                    ppname.appendChild(doc.createTextNode(pname));
                    product.appendChild(ppname);

                    Element ppdesc = doc.createElement("pdesc");
                    ppdesc.appendChild(doc.createTextNode(desc));
                    product.appendChild(ppdesc);

                    Element pprice = doc.createElement("price");
                    pprice.appendChild(doc.createTextNode(price));
                    product.appendChild(pprice);

                    Element pcategory = doc.createElement("category");
                    pcategory.appendChild(doc.createTextNode(category));
                    product.appendChild(pcategory);
                    
                    products.appendChild(product);

                    TransformerFactory transformerFactory = TransformerFactory.newInstance();
                    Transformer transformer = transformerFactory.newTransformer();
                    DOMSource source = new DOMSource(doc);
                    StreamResult result = new StreamResult(new File(xmlFile));
                    System.out.print("----------"+result+"------------------");
                    transformer.transform(source, result);

                }
           }catch (ParserConfigurationException pce) {
		pce.printStackTrace();
	   } catch (TransformerException tfe) {
		tfe.printStackTrace();
	   } catch (IOException ioe) {
		ioe.printStackTrace();
	   }catch (SAXException sae) {
		sae.printStackTrace();
	   }
        
        try
        {
        ps.setString(1,pcode);
        ps.setString(2,pname);
        ps.setString(3,desc);
        ps.setString(4,price);
        ps.setString(5,category);
        
        ps.executeUpdate();
        
        out.println("<pre><h1><center>PRODUCT ADDED SUCCESSFULLY</center></h1></pre>");
        
        out.println("<hr>");
        out.println("<pre><a href=\"ProductEntry.jsp\">CLICK HERE TO ADD MORE PRODUCTS</a></pre>");
        out.println("<pre><a href=\"AdminHome.jsp\">ADMIN HOME</A></pre>");
        }
        catch(Exception e)
        {
            out.println(e);
        }
        out.close();    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(SaveProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(SaveProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
