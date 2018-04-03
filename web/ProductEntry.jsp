<%
String pcode=(String)session.getAttribute("pcode");
String pname=(String)session.getAttribute("pname");
String pdesc=(String)session.getAttribute("pdesc");
String price=(String)session.getAttribute("price");
String category=(String)session.getAttribute("category");
String isUpdate=request.getParameter("isUpdate");

if(isUpdate==null)
{
    session.setAttribute("pcode",null);
    session.setAttribute("pname",null);
    session.setAttribute("pdesc",null);
    session.setAttribute("price",null);
    session.setAttribute("category",null);
          
}
if(pcode==null)
pcode="";

if(pname==null)
pname="";

if(pdesc==null)
pdesc="";

if(price==null)
price="";

if(category==null)
category="";
%>
<html>
    <head>
        <title>PRODUCT ENTRY FORM</title>
        <link rel="stylesheet" type="text/css" href="ONLINESTYLE.css">
         <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <div class="heading">PRODUCT ENTRY FORM</div>
    <center>
        <form action="SaveProduct" method="post" id="entryForm">
            <table>
                <tr>
                    <td>PRODUCT CODE</td>    
                    <td><input type="text" name="pcode" id="pcode" value="<%=pcode%>"/></td>
                </tr>    
                <tr>
                    <td>PRODUCT NAME</td>    
                    <td><input type="text" name="pname" id="pname" value="<%=pname%>"/></td>
                </tr>
                <tr>
                    <td>DESCRIPTION</td>    
                    <td><input type="text" name="desc" id="desc" value="<%=pdesc%>"/></td>
                </tr>
                <tr>
                    <td>PRICE</td>           
                    <td><input type="text" name="price" id="price" value="<%=price%>"/></td>
                </tr>
                <tr>    
                    <td>CATEGORY</td>        
                    <td>
                        <select name="category" id="category">
                            <option><%=category%></option>
                            <option>ELECTRONICS</option>
                            <option>APPLIANCES</option>
                            <option>MEN</option>
                            <option>WOMEN</option>
                            <option>AUTOMOBILES</option>
                            <option>FURNITURE</option>
                           <option>BOOKS AND MORE</option>
                        </select>
                    </td>
                </tr>    
                <tr>                    
                    <td colspan="2"><input type="submit" value="ADD PRODUCT" id="submitButton"/></td>
                </tr>
            </table>
        </form>
        <hr>
        <a href="AdminHome.jsp">ADMIN HOME</a>
    </center>
    <script>
        
        <%if(pcode!=null){%>
            document.getElementById("entryForm").setAttribute("action","UpdateProduct");
            document.getElementById("submitButton").value="UPDATE PRODUCT";
        <%}%>
        <%if(isUpdate==null){%>
            document.getElementById("entryForm").setAttribute("action","SaveProduct");
            document.getElementById("submitButton").value="ADD PRODUCT";
        <%}%>
    </script>
</body>
</html>
