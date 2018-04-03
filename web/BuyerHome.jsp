<%@page import="java.util.ArrayList"%>
<%
String s=(String)session.getAttribute("name");
if(s!=null)
s=s.toUpperCase();
%>
<%
ArrayList<String> alpd=(ArrayList<String>)session.getAttribute("product");
%>
<html>
    <head>
            <title>WELCOME TO ONLINE SHOPPING STORE</title>
            <link rel="stylesheet" type="text/css" href="ONLINESTYLE.css">
            <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
            <style>
                table {
                border-collapse: collapse;
                width:700px;
                font-size: 20px
            }

            td {
                border: 1px solid #008CBA;
                text-align: left;
                padding: 10px;
                width:500px;
            }

            tr:nth-child(even) {
                background-color: #008CBA;
                color:white;
            }
            tr:nth-child(odd) {
                background-color: white;
                color: #008CBA;
            }
    
            </style>
    </head>
    <body>
        <div class="heading">START YOUR SHOPPING HERE</div><br>
        <span class="user">WELCOME :<%="\t"+s%></span>
        <a href="logOut" class="links" style="float: right; padding-right:38px;padding-left: 38px;">LOG-OUT</a>
        <a href="displaycart.jsp" class="links" style="float: right; padding-left:25px; padding-right:25px; margin-right: 10px;">DISPLAY CART</a>
        <br><br><br>
<center>
    <div style="font-size: 20px; display: inline">CHOOSE CATEGORY</div>
    <select id="category" onchange="getProducts(this.value);">
        <option selected disabled></option>
    </select>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div style="font-size: 20px; display: inline">CHOOSE PRODUCT</div>
        <select id="products" onchange="getWholeProduct(this.value)">
        </select>
        <br><br>
        <%if(alpd!=null && alpd.size()==5){%>
        <center style="font-size: 35px">PRODUCT DETAILS</center><br>
            <table>
                <tr>
                    <td>PRODUCT CODE</td><td><%=alpd.get(0)%></td>
                </tr>
                <tr>
                    <td>PRODUCT NAME</td><td><%=alpd.get(1)%></td>
                </tr>
                <tr>
                    <td>DESCRIPTION</td><td><%=alpd.get(2)%></td>
                </tr>
                <tr>
                    <td>PRICE</td><td>Rs.<%=alpd.get(3)%></td>
                </tr>
                <tr>
                    <td>CATEGORY</td><td><%=alpd.get(4)%></td>
                </tr>
            </table>
        <br><br>
        <a href="CartManager?pcode=<%=alpd.get(0)%>&pcat=<%=alpd.get(4)%>" class="links" style="padding-left: 50px;padding-right: 50px">ADD TO CART</a>
        <%}%>
       
</center>
    <script>
        function getXmlHttpRequestObject()
	{
            var xmlHttpReq;

            if(window.XMLHttpRequest){
                request=new window.XMLHttpRequest();
            }
            else if(window.ActiveXObject){
                request=new window.ActiveXObject();
            }
            else{
                request=null;
            }
            return request;
	}
        
        function getCategory()
	{   
            request=getXmlHttpRequestObject();
            request.onreadystatechange=setCategory;
            request.open("post","GetCategory",true);
            request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
            var data="";
            request.send(data);
	}

	function setCategory()
	{
            if(request.readyState===4 && request.status===200)
            {
		document.getElementById("category").innerHTML=request.responseText;
            }
        }
        
        function getProducts(i)
        {
            request=getXmlHttpRequestObject();
            request.onreadystatechange=setProducts;
            request.open("post","GetProducts",true);
            request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
            var data="qs="+i;
            request.send(data);
        }
        
        function setProducts()
        {
             if(request.readyState===4 && request.status===200)
            {
                console.log(request.responseText);
		document.getElementById("products").innerHTML=request.responseText;
            }
        }
        
        function getWholeProduct(id)
        {
            request=getXmlHttpRequestObject();
            request.onreadystatechange=setWholeProduct;
            request.open("post","GetWholeProduct",true);
            request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
            var data="pcode="+id;
            request.send(data);
        }
        function setWholeProduct()
        {
             if(request.readyState===4 && request.status===200)
            {
               location.reload();
            }
        }
        
        getCategory();
    </script>
    </body>
</html>

