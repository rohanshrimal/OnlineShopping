<%-- 
    Document   : categories
    Created on : 6 Dec, 2016, 9:39:15 PM
    Author     : rohan
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   Connection con=(Connection)application.getAttribute("datacon"); 
   String qr="select distinct category from products";
   Statement stmt=con.createStatement();
   ResultSet rs=stmt.executeQuery(qr);
 %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLINE SHOPPING</title>
    </head>
    <body>
        <PRE>
        <h1><CENTER>C A T E G O R I E S</CENTER></h1><hr>
        <%
        while(rs.next())
        {
            String s=rs.getString(1);
        %>
        <a href="ProductsList.jsp?qs=<%=s%>"><%=s%></a>
        <%
        }
        %>
        <hr>
        <a href="displaycart.jsp">VIEW CART</a>

        <a href="BuyerHome.jsp">HOME</a>
        <hr>
        </PRE>
    </body>
</html>
