/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author rohan
 */
@WebServlet(urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
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
                    
                    NodeList productList = doc.getElementsByTagName("product");
                    
                    int i=0;
                    boolean flag=false;
                    for(i=0;i<productList.getLength();i++)
                    {
                        Node theProduct=productList.item(i);
                        NodeList productDetails=theProduct.getChildNodes();
                        
                        int j=0;
                        for(j=0;j<productDetails.getLength();j++)
                        {
                            Node detail=productDetails.item(j);
                            
                            if(detail.getNodeName().equals("pcode"))
                            {
                                if(detail.getTextContent().equals(pcode))
                                {
                                    products.removeChild(theProduct);
                                    flag=true;
                                    break;
                                }
                            }
                        }
                        if(flag)
                        {
                            break;
                        }
                    }
                    
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
          response.sendRedirect("ReadProductsXML.jsp");
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
