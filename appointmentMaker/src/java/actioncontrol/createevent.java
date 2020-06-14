/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actioncontrol;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vivek
 */
public class createevent extends HttpServlet {

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
            Statement st;
            String dateofevent = request.getParameter("eventdate");
            String slot = request.getParameter("optradio");
            String email = request.getParameter("email");
            String title = request.getParameter("title");
            String body = request.getParameter("body");
            String contact = request.getParameter("contact");

Date d = new Date(Integer.parseInt(dateofevent.substring(6, 10)), Integer.parseInt(dateofevent.substring(0, 2)),Integer.parseInt(dateofevent.substring(3, 5)));
            try {
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                    con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/mrcalender.accdb");
                    ps= con.prepareStatement("select * from events where email = ? and dateofevent = ? and slot = ?");
                    ps.setString(1,email);
                    ps.setDate(2, d);
                    ps.setString(3, slot);
                    ResultSet rs = ps.executeQuery();
                    if(rs.next()){
                        response.sendRedirect("index.jsp?message=slotnotavailable");
                    }else{
                        ps = con.prepareStatement("insert into events(email, dateofevent, title, body, contact, slot) values(?,?,?,?,?,?)");
                        ps.setString(1, email);
                        ps.setDate(2,d);
                        ps.setString(3, title);
                        ps.setString(4, body);
                        ps.setString(5, contact);
                        ps.setString(6, slot);
                        ps.executeUpdate();
                    }
                    response.sendRedirect("mainpage.jsp");
                    
                }catch(SQLException e){
                    out.print(e.getSQLState());
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
