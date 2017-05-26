

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
/**
 *
 * @author rohan
 */
public class verifyuser extends HttpServlet {

    Connection con=null;
    PreparedStatement ps=null;
    String qr=null;
   
    
    @Override
    public void init() throws ServletException {
       try{ 
        con=(Connection)getServletContext().getAttribute("datacon");
        qr="select * from users where loginid=? and password=?";
        ps=con.prepareStatement(qr);
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
        PrintWriter out=null;
        out=response.getWriter();
        try
        {
        String id=request.getParameter("id");
        String pwd=request.getParameter("pwd");
        String utype=request.getParameter("utype");
        String sp=request.getParameter("sp");
          if(utype.equals("BUYER"))
          {
            ps.setString(1,id);
            ps.setString(2,pwd);
            ResultSet rs=ps.executeQuery();
            
            if(!rs.next())
            {
                out.println("<pre><H1>UNAUTHORISED USER</H1></pre>");
            }
            else
            {
                HttpSession session=request.getSession();
                session.setAttribute("name",rs.getString("name"));
                session.setAttribute("id",rs.getString("loginid"));
               
                if(sp!=null)
                {
                    Cookie ck1=new Cookie("id",id);
                    Cookie ck2=new Cookie("pwd",pwd);
                    
                    ck1.setMaxAge(60*60*24*7);
                    ck2.setMaxAge(60*60*24*7);
                    
                    response.addCookie(ck1);
                    response.addCookie(ck2);
                }
                response.sendRedirect("BuyerHome.jsp");
            }
          }
          else if(utype.equals("ADMIN"))
          {
              if(id.equals("admin")&& pwd.equals("admin"))
              {
                  RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");
                  rd.forward(request,response);
              }
              else
              {
                  out.println("UNAUTHORISED ADMIN");
              }
          }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
