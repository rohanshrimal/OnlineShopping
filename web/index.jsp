
<%@page import="javax.servlet.http.Cookie"%>

<%
    Cookie ck[]=request.getCookies();
    
    String id="";
    String pwd="";
    
    if(ck!=null)
    {
        for(int i=0;i<ck.length;i++)
        {
            String name=ck[i].getName();
            if(name.equals("id"))
                 id=ck[i].getValue();
            
            else if(name.equals("pwd"))
                 pwd=ck[i].getValue();
    
        }
    }
%>



<html>
    <head>
        <title>ONLINE SHOPPING</title>
        <link rel="stylesheet" type="text/css" href="ONLINESTYLE.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
<script type="text/javascript">
    
    function msg()
    {
        alert("WELCOME");
    }
</script>
    </head>
    <body>
       <div class="heading"> ONLINE SHOPPING PORTAL</div>
    <center>
        <form action = "verifyuser" method="post" onsubmit="return check();">
           <table>
               <tr>
                   <td>LOGIN-ID</td><td></td><td><input type="text" id="id" name="id" value="<%=id%>"/><td>
               </tr>
               <tr><td></td><td></td></tr>
               <tr>    
                    <td>PASSWORD</td><td></td><td><input type="password" id="password" name="pwd" value="<%=pwd%>"/></td>
               </tr>
               <tr><td></td><td></td></tr>
               <tr>
                   <td>USER-TYPE</td><td></td><td><select name="utype">
                        <option>BUYER</option>
                        <option>ADMIN</option>
                       </select></td>
               </tr>
               <tr><td></td><td></td><td></td></tr>
               <tr><td></td><td></td><td></td></tr>
               <tr><td></td><td></td><td></td></tr>
               <tr><td></td><td></td><td></td></tr>
               <tr>
                   <td>SAVE PASSWORD</td><td></td><td><input type ="checkbox" id="sp" name="sp"/></td>
               </tr>
               <tr><td></td><td></td><td></td></tr>
               <tr><td></td><td></td><td></td></tr>
               <tr><td></td><td></td><td></td></tr>
               <tr><td colspan="3" style="text-align: center"><input type="submit" value="LOG IN"/></td></tr>
           </table>
           <hr>

                        <a href="registration.jsp">SIGN UP</a><br>
        
            
        </form>
    </center>
    <script>
        function check()
        {
            if(document.getElementById("id").value.length===0)
            {
                alert('You cannot left this field empty');
                return false;
            }
            else if(document.getElementById("password").value.length===0)
            {
                alert('You cannot left this field empty');
                return false;
            }
            else if(document.getElementById("sp").checked)
            {
                var uid=document.getElementById("id").value;
                var pwd=document.getElementById("password").value;
                setCookie("uname",uid,30);
                setCookie("upassword",pwd,30);
            }
            msg();
            return true;
        }
        function setCookie(cname, cvalue, exdays)
        {
            var d = new Date();
            d.setTime(d.getTime() + (exdays*24*60*60*1000));
            var expires = "expires="+ d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }
        
        function getCookie(cname) 
        {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for(var i = 0; i <ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
        
       document.getElementById("id").value=getCookie("uname");
       document.getElementById("password").value=getCookie("upassword");
      
            
     </script>
    </body>
</html>