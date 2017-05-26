
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
<script type="text/javascript">
    function noBack()
    {
        window.history.forward();
    }
    function msg()
    {
        alert("WELCOME");
    }
</script>
    </head>
    <body onload="noBack();">
       <PRE> <H1> O N L I N E     S H O P P I N G </H1></PRE>
        <FORM ACTION = "verifyuser" method="post">
            <pre>
           <HR>
            LOGIN-ID    <INPUT TYPE="TEXT" NAME="id" value="<%=id%>"/>
            PASSWORD    <INPUT TYPE="password" NAME="pwd" value="<%=pwd%>"/>
            USER-TYPE   <select name="utype">
                        <option>BUYER</option>
                        <option>ADMIN</option>
                        </select>
            
            SAVE PASSWORD<INPUT TYPE ="checkbox" name="sp"/>
            
                        <input type="submit" value="LOG IN" onclick="msg();"/>
                        <HR>

            <A href="registration.jsp">SIGN UP</A>
            </pre>
            
        </FORM>
    </body>
</html>