package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;

public final class ReadProductsXML_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("  \n");

    String xmlFile=application.getRealPath("Products.xml");
    DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
    Document doc = null;
    
    NodeList pcode=null,pname=null,pdesc=null,price=null,category=null;
  
    if(xmlFile==null)
    {
        doc=docBuilder.newDocument();
    }
    
    else
    {
        doc=docBuilder.parse(xmlFile);    
        pcode = doc.getElementsByTagName("pcode"); 
        pname = doc.getElementsByTagName("pname"); 
        pdesc = doc.getElementsByTagName("pdesc"); 
        price = doc.getElementsByTagName("price");
        category = doc.getElementsByTagName("category");
    }
//    // questionset elements
//    Element rootElement = doc.createElement("questionset");
//    doc.appendChild(rootElement);
//    // question elements
//    Element question = doc.createElement("question");
//    rootElement.appendChild(question);
//    // set attribute to question element
//    Attr attr = doc.createAttribute("category");
//    attr.setValue("graph");
//    question.setAttributeNode(attr);
//    // write the content into xml file        
//
//    TransformerFactory factory = TransformerFactory.newInstance();
//    Transformer transformer = factory.newTransformer();
//
//    transformer.setOutputProperty(OutputKeys.INDENT, "yes");
//
//    StringWriter sw = new StringWriter();
//    StreamResult result = new StreamResult(sw);
//    DOMSource source = new DOMSource(doc);
//    transformer.transform(source, result);
//    String xmlString = sw.toString();
//
//    File file=new File("C:xml/"+str+".xml");
//    BufferedWriter bw = new BufferedWriter(new FileWriter(file));
//    bw.write(xmlString);
//    bw.flush();
//    bw.close();


      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Products List</title>\n");
      out.write("<!--        <link rel=\"stylesheet\" type=\"text/css\" href=\"ONLINESTYLE.css\">\n");
      out.write("        <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>\n");
      out.write("         <style>\n");
      out.write("             table {\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                width:1200px;\n");
      out.write("                font-size: 20px\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            td {\n");
      out.write("                border: 1px solid #008CBA;\n");
      out.write("                text-align: left;\n");
      out.write("                padding: 10px;\n");
      out.write("                width:auto;\n");
      out.write("                color: #008CBA;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            th{\n");
      out.write("                border: 1px solid #008CBA;\n");
      out.write("                text-align: left;\n");
      out.write("                padding: 10px;\n");
      out.write("                width:auto;\n");
      out.write("                color: #f2f2f2;\n");
      out.write("                background-color:#008CBA; \n");
      out.write("            }\n");
      out.write("    \n");
      out.write("            .deletelinks{\n");
      out.write("    \n");
      out.write("                text-decoration: none;\n");
      out.write("                color: white;\n");
      out.write("                border:1px solid #f44336;\n");
      out.write("                padding: 10px;\n");
      out.write("                margin:24px;\n");
      out.write("                background-color: #f44336;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .deletelinks:hover{\n");
      out.write("                background-color: white;\n");
      out.write("                color: #f44336;\n");
      out.write("            }\n");
      out.write("            .link{\n");
      out.write("               color: #008CBA;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style> -->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"heading\">PRODUCT DETAILS</div>\n");
      out.write("       \n");
      out.write("        <center>\n");
      out.write("            <table id=\"productList\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>PCODE</th>\n");
      out.write("                    <th>PNAME</th>\n");
      out.write("                    <th>DESCRIPTION</th>\n");
      out.write("                    <th>PRICE</th>\n");
      out.write("                    <th>CATEGORY</th>\n");
      out.write("                    <th>UPDATE</th>\n");
      out.write("                    <th>DELETE</th>\n");
      out.write("                </tr>\n");
      out.write("                ");

                int i=0;
                if(pcode!=null){
                for(i=0; i< pcode.getLength();i++)
                {
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"pcode\">");
      out.print(pcode.item(i).getFirstChild().getNodeValue() );
      out.write("</td>\n");
      out.write("                    <td class=\"pname\">");
      out.print(pname.item(i).getFirstChild().getNodeValue() );
      out.write("</td>\n");
      out.write("                    <td class=\"pdesc\">");
      out.print(pdesc.item(i).getFirstChild().getNodeValue() );
      out.write("</td>\n");
      out.write("                    <td class=\"price\">");
      out.print(price.item(i).getFirstChild().getNodeValue() );
      out.write("</td>\n");
      out.write("                    <td class=\"category\">");
      out.print(category.item(i).getFirstChild().getNodeValue() );
      out.write("</td>\n");
      out.write("                    <td><a href=\"ReadyForUpdate?pcode=");
      out.print(pcode.item(i).getFirstChild().getNodeValue() );
      out.write("&pname=");
      out.print(pname.item(i).getFirstChild().getNodeValue() );
      out.write("&pdesc=");
      out.print(pdesc.item(i).getFirstChild().getNodeValue() );
      out.write("&price=");
      out.print(price.item(i).getFirstChild().getNodeValue() );
      out.write("&category=");
      out.print(category.item(i).getFirstChild().getNodeValue() );
      out.write("\" onclick=\"getProductDetails(");
      out.print(i);
      out.write(")\" class=\"link\">Update</a></td>\n");
      out.write("                    <td><a href=\"DeleteProduct?pid=");
      out.print(pcode.item(i).getFirstChild().getNodeValue() );
      out.write("\" class=\"link\">Delete</a></td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                }}
                
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </center>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
