<html>
    <head>
         <title>WELCOME TO ONLINE SHOPPING</title>
         <link rel="stylesheet" type="text/css" href="ONLINESTYLE.css">
         <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <div class="heading">REGISTRATION</div>
    <center>
        <form action="saveuser" method="post" onsubmit="return checkCredentials()">
            <table>
                <tr>
                    <td>LOGIN-ID</td>    
                    <td><INPUT TYPE="TEXT" name="id" id="id"/></td>
                </tr>
                <tr>
                    <td>PASSWORD</td>    
                    <td><INPUT TYPE="PASSWORD" name="pwd" id="pwd"/></td>
                </tr>
                <tr>
                    <td>CONFIRM-PASSWORD</td>    
                    <td><INPUT TYPE="PASSWORD" name="pwd" id="repeatpwd" onchange="checkPwd()"/></td>
                </tr>
                <tr>
                    <td>NAME</td>        
                    <td><INPUT TYPE="TEXT" name="name" id="name"/></td>
                </tr>
                <tr>
                    <td>ADDRESS</td>     
                    <td><INPUT TYPE="TEXT" name="add" id="add"/></td>
                </tr>
                <tr>
                    <td>MOBILE</td>      
                    <td><INPUT TYPE="TEXT" name="mobile" id="mobile"/></td>
                </tr>
                <tr>
                    <td colspan="2"> <INPUT TYPE="SUBMIT" value="REGISTER"/></td>
                </tr>
            </table>
                      <hr>
            <A HREF="index.jsp">HOME</A>
        </form>
        </center>
    <script>
        function checkCredentials()
        {
            if(document.getElementById("id").value.length===0)
            {
                alert('You cannot left ID field empty');
                return false;
            }
            else if(document.getElementById("pwd").value.length===0)
            {
                alert('You cannot left PASSWORD field empty');
                return false;
            }
            else if(document.getElementById("repeatpwd").value.length===0)
            {
                alert('You cannot left this PASSWORD field empty');
                return false;
            }
            else if(document.getElementById("name").value.length===0)
            {
                alert('You cannot left NAME field empty');
                return false;
            }
            else if(document.getElementById("add").value.length===0)
            {
                alert('You cannot left ADDRESS field empty');
                return false;
            }
            else if(document.getElementById("mobile").value.length===0)
            {
                alert('You cannot left MOBILE field empty');
                return false;
            }
            
            return checkPwd();
            return true;
        }
        
        function checkPwd()
        {
            if(document.getElementById("repeatpwd").value!==document.getElementById("pwd").value)
            {
                alert('Password Not Matched...!!!');
                return false;
            }
            return true;
        }
    </script>
    </body>
</html>
