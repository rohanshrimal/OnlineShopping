<%
String s=(String)session.getAttribute("name");
if(s!=null)
s=s.toUpperCase();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="ONLINESTYLE.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
        <title>Price Calculator</title>
        <style>
#outputScreen{
    border: 1px solid #008CBA;
    color:#008CBA;
}

.screen{
  margin: 0px;
  padding: 0px;
  font-size:30px;
  font-family:Roboto;
}
.calculator{
    
   width : 75px;
   height: 75px;
   font-size:30px;
   padding: 15px;
   background-color: white;
   color: #008CBA;
   border: 1px solid #008CBA;
}

.calculator:hover{
    color: white;
   background-color: #008CBA;
    
}

        </style>
    </head>
    <body>
        <div class="heading"> PRICE CALCULATOR</div><br>
        <span class="user">WELCOME :<%="\t"+s%></span>
        <a href="logOut" class="links" style="float: right; padding-right:38px;padding-left: 38px;">LOG-OUT</a>
        <a href="displaycart.jsp" class="links" style="float: right; padding-left:25px; padding-right:25px; margin-right: 10px;">DISPLAY CART</a>
        <br><br><br>
        <center>
            <textarea readonly class="screen" rows="3" cols="19" id="outputScreen"></textarea><br>
        <input type="button" class="calculator" value="C" onclick="clearDisplay()"/><input type="button" class="calculator" value="/" onclick="display(this.value)"/><input type="button" class="calculator" value="*" onclick="display(this.value)"/><input type="button" class="calculator" value="+" onclick="display(this.value)"/><br>    
        <input type="button" class="calculator" value="7" onclick="display(this.value)"/><input type="button" class="calculator" value="8" onclick="display(this.value)"/><input type="button" class="calculator" value="9" onclick="display(this.value)"/><input type="button" class="calculator" value="-" onclick="display(this.value)"/><br>
        <input type="button" class="calculator" value="4" onclick="display(this.value)"/><input type="button" class="calculator" value="5" onclick="display(this.value)"/><input type="button" class="calculator" value="6" onclick="display(this.value)"/><input type="button" class="calculator" value=")" onclick="display(this.value)"/><br>
        <input type="button" class="calculator" value="1" onclick="display(this.value)"/><input type="button" class="calculator" value="2" onclick="display(this.value)"/><input type="button" class="calculator" value="3" onclick="display(this.value)"/><input type="button" class="calculator" value="(" onclick="display(this.value)"/><br>
        <input type="button" class="calculator" value="0" onclick="display(this.value)"/><input type="button" class="calculator" value="." onclick="display(this.value)"/><input type="button" class="calculator" value="%" onclick="display(this.value)"/><input type="button" class="calculator" value="=" onclick="calculate()"/>
        </center>
    <script type="text/javascript">
        function clearDisplay()
        {
            document.getElementById("outputScreen").innerHTML="";
        }
        function display(value)
        {
            document.getElementById("outputScreen").innerHTML=document.getElementById("outputScreen").innerHTML+value;
        }
        function calculate()
        {
            var expr=document.getElementById("outputScreen").innerHTML;
            document.getElementById("outputScreen").innerHTML=eval(expr);
        }
    </script>
    </body>
   
</html>
