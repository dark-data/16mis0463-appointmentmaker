/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vivek
 */
public class login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con;
            PreparedStatement ps;
            String email, password;
       
                try {
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                    email = request.getParameter("username");
                    password = request.getParameter("password");
                    con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/mrcalender.accdb");
                    ps= con.prepareStatement("select * from useraccount where email = ? AND password = ?");
                    ps.setString(1,email);
                    ps.setString(2,password);
                    ResultSet rs = ps.executeQuery();
                    if(rs.next()){
                        HttpSession session = request.getSession();
                        session.setAttribute("user", rs.getString("email"));
                        response.sendRedirect("mainpage.jsp");
                    }else{
                        response.sendRedirect("index.jsp?message=invalidpassword");
                    }
                }catch(SQLException e){
                    out.print(e);
                }catch(Exception e){
                    out.print(e);
                }
            
            
            
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
