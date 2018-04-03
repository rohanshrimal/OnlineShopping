<%-- 
    Document   : ReadProductsXML
    Created on : 1 Apr, 2018, 1:18:20 PM
    Author     : rohan
--%>
<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*"%>  
<%
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

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products List</title>
        <link rel="stylesheet" type="text/css" href="ONLINESTYLE.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
         <style>
             table {
                border-collapse: collapse;
                width:1200px;
                font-size: 20px
            }

            td {
                border: 1px solid #008CBA;
                text-align: left;
                padding: 10px;
                width:auto;
                color: #008CBA;
            }
            
            th{
                border: 1px solid #008CBA;
                text-align: left;
                padding: 10px;
                width:auto;
                color: #f2f2f2;
                background-color:#008CBA; 
            }
    
            .deletelinks{
    
                text-decoration: none;
                color: white;
                border:1px solid #f44336;
                padding: 10px;
                margin:24px;
                background-color: #f44336;
            }

            .deletelinks:hover{
                background-color: white;
                color: #f44336;
            }
            .link{
               color: #008CBA;
            }

        </style> 
    </head>
    <body>
        <div class="heading">PRODUCT DETAILS</div>
       
        <center>
            <table id="productList">
                <tr>
                    <th>PCODE</th>
                    <th>PNAME</th>
                    <th>DESCRIPTION</th>
                    <th>PRICE</th>
                    <th>CATEGORY</th>
                    <th>UPDATE</th>
                    <th>DELETE</th>
                </tr>
                <%
                int i=0;
                if(pcode!=null){
                for(i=0; i< pcode.getLength();i++)
                {
                %>
                <tr>
                    <td class="pcode"><%=pcode.item(i).getFirstChild().getNodeValue() %></td>
                    <td class="pname"><%=pname.item(i).getFirstChild().getNodeValue() %></td>
                    <td class="pdesc"><%=pdesc.item(i).getFirstChild().getNodeValue() %></td>
                    <td class="price"><%=price.item(i).getFirstChild().getNodeValue() %></td>
                    <td class="category"><%=category.item(i).getFirstChild().getNodeValue() %></td>
                    <td><a href="ReadyForUpdate?pcode=<%=pcode.item(i).getFirstChild().getNodeValue() %>&pname=<%=pname.item(i).getFirstChild().getNodeValue() %>&pdesc=<%=pdesc.item(i).getFirstChild().getNodeValue() %>&price=<%=price.item(i).getFirstChild().getNodeValue() %>&category=<%=category.item(i).getFirstChild().getNodeValue() %>" onclick="getProductDetails(<%=i%>)" class="link">Update</a></td>
                    <td><a href="DeleteProduct?pid=<%=pcode.item(i).getFirstChild().getNodeValue() %>" class="link">Delete</a></td>
                </tr>
                <%
                }}
                %>
            </table>
        </center>
        
    </body>
</html>
