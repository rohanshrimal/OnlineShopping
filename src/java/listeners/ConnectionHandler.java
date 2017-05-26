/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class ConnectionHandler implements ServletContextListener {

    Connection con;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
         //To change body of generated methods, choose Tools | Templates.
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshop","root","root");
        } catch (Exception ex) {
        
        }
        ServletContext context=sce.getServletContext();
        context.setAttribute("datacon", con);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //To change body of generated methods, choose Tools | Templates.
        try {
            con.close();
        } catch (SQLException ex) {
            
        }
    }
}
