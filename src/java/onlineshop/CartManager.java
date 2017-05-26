/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onlineshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.ResultSet.*;
import static java.sql.ResultSet.CONCUR_UPDATABLE;
import static java.sql.ResultSet.TYPE_SCROLL_SENSITIVE;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rohan
 */
public class CartManager extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pcode=request.getParameter("pcode");
        String pcat=request.getParameter("pcat");
        HttpSession session=request.getSession();
        String id=(String)session.getAttribute("id");
        
        try
        {
        ServletContext context=getServletContext();
        Connection con=(Connection)context.getAttribute("datacon");
        String qr1="select * from cart where pcode=? and loginid=?";
        PreparedStatement ps1=con.prepareStatement(qr1,TYPE_SCROLL_SENSITIVE,CONCUR_UPDATABLE);
        ps1.setString(1,pcode);
        ps1.setString(2,id);
        ResultSet rs= ps1.executeQuery();
        if(rs.next()==false)
        {
        String qr="insert into cart values(?,?,?)";
        PreparedStatement ps=con.prepareStatement(qr);
        ps.setString(1,pcode);
        ps.setString(2,id);
        ps.setInt(3, 1);
        ps.executeUpdate();
        }
        else
        {
        rs.updateInt(3,rs.getInt(3)+1);
        rs.updateRow();
        }
        response.sendRedirect("details.jsp?pcode="+pcode+"&pcat="+pcat);
        }
        catch(Exception w)
        {
            PrintWriter out=response.getWriter();
            out.println(w);
        }
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
