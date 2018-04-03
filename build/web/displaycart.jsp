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
String s=(String)session.getAttribute("name");
if(s!=null)
s=s.toUpperCase();
%>

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
        <link rel="stylesheet" type="text/css" href="ONLINESTYLE.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
        <style>
             table {
                border-collapse: collapse;
                width:1200px;
                font-size: 20px
            }

            th,td {
                border: 1px solid #008CBA;
                text-align: left;
                padding: 10px;
                width:auto;
                color: #008CBA;
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

        </style>
    </head>
    <body>
        <div class="heading">CART DETAILS</div><br>
     <span class="user">WELCOME :<%="\t"+s%></span>
     <a href="logOut" class="links" style="float: right; padding-right:38px;padding-left: 38px;">LOG-OUT</a>
     <a href="BuyerHome.jsp" class="links" style="float: right; padding-left:25px; padding-right:25px; margin-right: 10px;">BUY MORE</a>
     <a href="PriceCalculator.jsp" class="links" style="float: right; padding-left:25px; padding-right:25px; margin-right: 10px;">PRICE CALCULATOR</a>
     <br><br><br> 
    <% 
    if(!rs.next())
    {%>
    <center><h2> YOUR CART IS EMPTY </h2></center><hr>
    <%}else{rs.beforeFirst();%>
    <table border="1" align="center">
        <thead align="center">
           <tr align="center">
               <%for(int i=1;i<=n;i++){%>
               <th align="center"><%=rdata.getColumnName(i).toUpperCase()+"\t"%></th>
               <%}%>
               <th>REMOVE</th>
           </tr>
        </thead>
        <tbody>
               <%while(rs.next()){%>
               <tr>
                    <%for(int i=1;i<=n;i++){%>
                        <td align="right"><%=rs.getString(i).toUpperCase()%></td>
                    <%}%>
                    <td><a href="Remove?id=<%=rs.getString(1)%>" class="deletelinks" style="padding-top: 4px;padding-bottom: 4px; margin-left: 30px">X</a></td>
                </tr>
               <%}%>
        </tbody>
    </table>
    <%}%>
</body>


</html>




