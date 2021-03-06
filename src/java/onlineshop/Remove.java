/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onlineshop;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import java.sql.*;
import static java.sql.ResultSet.CONCUR_UPDATABLE;
import static java.sql.ResultSet.TYPE_SCROLL_SENSITIVE;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rohan
 */
public class Remove extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        ServletContext sc=getServletContext();
        Connection con=(Connection)sc.getAttribute("datacon");
        
        String code=request.getParameter("id");
        HttpSession session=request.getSession();
        String uid=session.getAttribute("id").toString();
        String qr="select * from cart where pcode=? and loginid=?";
        try{
        PreparedStatement ps=con.prepareStatement(qr,TYPE_SCROLL_SENSITIVE,CONCUR_UPDATABLE);
        ps.setString(1,code);
        ps.setString(2,uid);
        ResultSet rs=ps.executeQuery();
        rs.next();
        int qty=rs.getInt(3);
        if(qty==1)
        {
        rs.deleteRow();
        }
        else
        {
        rs.updateInt(3,qty-1);
        rs.updateRow();
        }
        response.sendRedirect("displaycart.jsp");
        
        }
        catch(Exception e)
        {
        PrintWriter out=response.getWriter();
        out.print(e);
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
