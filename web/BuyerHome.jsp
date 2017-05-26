<%
String s=(String)session.getAttribute("name");
if(s!=null)
s=s.toUpperCase();
%>

<html>
    <head>
            <title>WELCOME TO ONLINE SHOPPING STORE</title>
            <script type="text/javascript">
    function noBack()
    {
        window.history.forward();
    }
</script>
    </head>
    <body onload="noBack();">
        <h1><CENTER><PRE>WELCOME <%=s%></pre></center></h1><HR>
        <pre><CENTER><h1>S T A R T   Y O U R   S H O P P I N G   H E R E</h1></CENTER><hr>
            

<a href="categories.jsp">VIEW CATEGORIES</a>

<a href="displaycart.jsp">DISPLAY CART</a>

<a href="logOut">LOG-OUT</a>

<hr>

        </pre>
    </body>
</html>

