


import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class saveuser extends HttpServlet {
    
    Connection con=null;
    PreparedStatement ps=null;
    String qr=null;
   
    
    @Override
    public void init() throws ServletException {
       try{ 
        con=(Connection)getServletContext().getAttribute("datacon");
       }
       catch(Exception e)
       {
           
       }
//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void destroy() {
        try
        {
        
        }
        catch(Exception e)
        {
        }
        //To change body of generated methods, choose Tools | Templates.
    }
   
      
   
    
      
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    PrintWriter out=response.getWriter();  

        
       try{
           
        
      String name   =   request.getParameter("name");
      String pwd    =   request.getParameter("pwd");
      String id     =   request.getParameter("id");
      String add    =   request.getParameter("add");
      String mobile =   request.getParameter("mobile");
     
      qr="insert into users values(?,?,?,?,?)";
      ps=con.prepareStatement(qr);
    
      
      ps.setString(1,id);
      ps.setString(2,pwd);
      ps.setString(3,name);
      ps.setString(4,add);
      ps.setString(5,mobile);
      ps.executeUpdate();
      
      out.println("<h1>REGISTERED SUCCESSFULLY</H1>");
      out.println("<a href=\"index.jsp\">HOME</A>");
      }
      catch(Exception e)
      {
          out.println(e);
      }
      
       out.close();
   
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
