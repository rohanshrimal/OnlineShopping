<%-- 
    Document   : displaycart
    Created on : 7 Dec, 2016, 6:11:01 PM
    Author     : rohan
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<% 
    ResultSet rs=null;
    ResultSetMetaData rdata=null;
 
    int counter=0,n=0;
    try
    {
  Connection con=(Connection)application.getAttribute("datacon"); 
  String qr="select p.pcode,p.pname,p.description,p.price,p.category,c.qty from products p join cart c where loginid=? and c.pcode=p.pcode";
  
  PreparedStatement ps=con.prepareStatement(qr);
 
  
  String id=session.getAttribute("id").toString();
  
  ps.setString(1,id);
  
  
  rs=ps.executeQuery();
 
  
  rdata=rs.getMetaData();
  
  
  n=rdata.getColumnCount();

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
        <pre>
    <h1><center>C A R T   D E T A I L S</center></h1><HR>
        
        <% 
    if(!rs.next())
    {%>
    <center><h2> YOUR CART IS EMPTY </h2></center><hr>
<a href="categories.jsp">START BUYING</a>
    <%}
        else
    {
        rs.beforeFirst();
    %>
    <table border="1" align="center">
        <thead align="center">
           <tr align="center">
               <%for(int i=1;i<=n;i++)
               {
               %>
               <th align="center"><%=rdata.getColumnName(i).toUpperCase()+"\t"%></th>
               <%
               }
               %>
               <th>REMOVE</th>
           </tr>
           </thead>
           <tbody>
               <%
               while(rs.next())
               {
               %>
               <tr>
               <%
               for(int i=1;i<=n;i++)
               {
               %>
               <td align="right"><%=rs.getString(i).toUpperCase()%></td>
               
               <%
                }
               %>
               <td><a href="Remove?id=<%=rs.getString(1)%>"> X </a></td>
                </tr>
               <%
               }
               %>
           
           
           
           
           </tbody>
    </table>
    <%
    }
        %>
<hr>
    <a href="BuyerHome.jsp">HOME</a>

    <a href="categories.jsp">BUY MORE</a>        
<hr>
        </pre>    

</body>


</html>




