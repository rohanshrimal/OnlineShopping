<%-- 
    Document   : ReadProducts
    Created on : 14 Mar, 2018, 11:50:29 AM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
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
        <div class="heading">PRODUCT DETAILS</div>
    <center>
        <table id="productList">
            
        </table>
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

        function getWholeProduct()
        {
            request=getXmlHttpRequestObject();
            request.onreadystatechange=setWholeProduct;
            request.open("get","Products.xml",true);
            request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
            request.send(null);
        }
        function setWholeProduct()
        {
             if(request.readyState===4 && request.status===200)
            {
                var parser = new DOMParser();
                var pro = parser.parseFromString(request.responseText,"text/xml");
                var pcode=pro.getElementsByTagName("pcode");
                var pname=pro.getElementsByTagName("pname");
                var pdesc=pro.getElementsByTagName("pdesc");
                var price=pro.getElementsByTagName("price");
                var category=pro.getElementsByTagName("category");
               
               var setString="<td>PCODE</td>"+"<td>PNAME</td>"+"<td>DESCRIPTION</td>"+"<td>PRICE</td>"+"<td>CATEGORY</td>";
                for (i = 0; i< pcode.length; i++) 
                {
                    
                    var pc="<td>"+pcode[i].childNodes[0].nodeValue+"</td>";
                    var pn="<td>"+pname[i].childNodes[0].nodeValue+"</td>";
                    var pd="<td>"+pdesc[i].childNodes[0].nodeValue+"</td>";
                    var p="<td>"+price[i].childNodes[0].nodeValue+"</td>";
                    var cat="<td>"+category[i].childNodes[0].nodeValue+"</td>";
                    setString=setString+"<tr>"+pc+pn+pd+p+cat+"</tr>";
                    document.getElementById("productList").innerHTML=setString;
                }
            }
        }
        getWholeProduct();
    </script>
    </body>
</html>
