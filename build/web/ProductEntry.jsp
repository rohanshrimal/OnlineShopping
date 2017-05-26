<html>
    <head>
        <title>PRODUCT ENTRY FORM</title>
    </head>
    <body>
        <pre>
        <center><h1>PRODUCT ENTRY FORM</h1></center>
        <form action="SaveProduct" method="post">
                    PRODUCT CODE    <input type="text" name="pcode"/>
                    
                    PRODUCT NAME    <input type="text" name="pname"/>
                    
                    DESCRIPTION    
                                    <textarea rows="3" cols="30" name="desc"> </textarea>
                                    
                    PRICE           <input type="text" name="price"/>
                    
                    CATEGORY        <select name="category">
                                                <option>ELECTRONICS</option>
                                                <option>APPLIANCES</option>
                                                <option>MEN</option>
                                                <option>WOMEN</option>
                                                <option>AUTOMOBILES</option>
                                                <option>FURNITURE</option>
                                                <option>BOOKS AND MORE</option>
                                    </select>
                    
                                    
                    
                                    <input type="submit" value="ADD PRODUCT"/>
        </form>
        <hr>
        <a href="AdminHome.jsp">ADMIN HOME</a>
        </pre>
    </body>
</html>
