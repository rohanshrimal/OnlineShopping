<%-- 
    Document   : ProductsList
    Created on : 6 Dec, 2016, 11:22:08 PM
    Author     : rohan
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String category=request.getParameter("qs");
%>

<%
    ResultSet rs=null;
    int counter=0;
    try
    {
  Connection con=(Connection)application.getAttribute("datacon"); 
  String qr="select pcode,pname from products where category=?";
  PreparedStatement ps=con.prepareStatement(qr);
  ps.setString(1,category);
  rs=ps.executeQuery();
    }
    catch(Exception e)
    {
        out.print(e);
    }
   
 %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLINE SHOPPING</title>
    </head>
    <body>
        <pre><h1><center>P R O D U C T S   L I S T</center></h1><hr>
        CATEGORY : <%=category.toUpperCase()%>
        <hr>
<%
while(rs.next())
{
    String pcode=rs.getString(1);
    String pname=rs.getString(2);
%>
       <%=++counter + "."%> <a href="details.jsp?pcode=<%=pcode%>&pcat=<%=category%>"><%=pname.toUpperCase()%></a>
<%
}
%>

        <hr>
        <a href="BuyerHome.jsp">HOME</a>

        <a href="displaycart.jsp">VIEW CART</a>

        <a href="categories.jsp">VIEW CATEGORIES</a>
        <hr>
        </pre>
    </body>
</html>
