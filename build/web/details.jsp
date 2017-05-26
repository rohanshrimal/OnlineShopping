<%-- 
    Document   : details
    Created on : 7 Dec, 2016, 12:09:58 AM
    Author     : rohan
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String pcode=request.getParameter("pcode");
    String category=request.getParameter("pcat");
%>
<%
    ResultSet rs1=null;
    ResultSetMetaData rdata1=null;
    int counter1=0;
    try
    {
  Connection con=(Connection)application.getAttribute("datacon"); 
  String qr="select * from products where pcode=?";
  PreparedStatement ps1=con.prepareStatement(qr);
  ps1.setString(1,pcode);
  rs1=ps1.executeQuery();
  rdata1=rs1.getMetaData();
    }
    catch(Exception e)
    {
        out.print(e);
    }
   
 %>

 
 <%
        int n1=rdata1.getColumnCount();
        String header[]=new String[n1+1];
        String detail[]=new String[n1+1];
        for(int i=1;i<=n1;i++)
        {
            header[i]=rdata1.getColumnName(i).toUpperCase()+"\t";
        
        }
        while(rs1.next())
        {
            for(int i=1;i<=n1;i++)
            {
                detail[i]=rs1.getString(i).toUpperCase()+"\t";
            }
        }
        %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLINE SHOPPING</title>
    </head>
    <body>
        <PRE><h1><center>D E T A I L S</center></h1><hr>
            <%
        for(int i=1;i<=n1;i++)
        {
            %>
            <%=header[i]+"\t : \t"+detail[i].trim()%>
            <%
        }
            %>
        <hr>
        <a href="CartManager?pcode=<%=detail[1]%>&pcat=<%=category%>">ADD TO CART</a>
        <hr>
        <a href="BuyerHome.jsp">HOME</a>

        <a href="ProductsList.jsp?qs=<%=category%>">PRODUCT LIST</a>

        <a href="categories.jsp">VIEW CATEGORIES</a>
        <hr>
            
        
        </pre>
    </body>
</html>


