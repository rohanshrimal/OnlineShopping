<%
    session.setAttribute("pcode",null);
    session.setAttribute("pname",null);
    session.setAttribute("pdesc",null);
    session.setAttribute("price",null);
    session.setAttribute("category",null);
    
%>
<html>
    <head>  
            <title>WELCOME ADMIN</title>
            <link rel="stylesheet" type="text/css" href="ONLINESTYLE.css">
            <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
            
    </head>
    <body>
        <div class="heading">WELCOME ADMIN</div><br>
    <center>
        <div style="width:300px">
            <br>
            <a href="ProductEntry.jsp" class="links" style="padding-left:18px;padding-right:18px;">ADD PRODUCTS</a><br><br><br>

            <a href="ReadProductsXML.jsp" class="links">SHOW PRODUCTS</a><br><br><br>
                              
            <a href="index.jsp" class="links" style="padding-left:45px;padding-right:40px;">LOG OUT</a><br><br><br>
        </div>
    </center>
    </body>
</html>
