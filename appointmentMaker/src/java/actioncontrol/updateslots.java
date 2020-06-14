/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actioncontrol;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vivek
 */
public class updateslots extends HttpServlet {

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
            Statement st;
            String[] days = request.getParameterValues("days");
            String[] slots = request.getParameterValues("slots");
            String dayscombines = ""; 
            if (days.length > 0) {
                StringBuilder sb = new StringBuilder(); 
                for (String s : days) { 
                    sb.append(s).append(","); 
                } 
                dayscombines = sb.deleteCharAt(sb.length() - 1).toString();
            }
            String slotcombines = ""; 
            if (slots.length > 0) {
                StringBuilder sb = new StringBuilder(); 
                for (String s : slots) { 
                    sb.append(s).append(","); 
                } 
                slotcombines = sb.deleteCharAt(sb.length() - 1).toString();
            }
            
            
                try {
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                    email = request.getParameter("email");
                    con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/mrcalender.accdb");
                    ps= con.prepareStatement("select * from appointment where email = ?");
                    ps.setString(1,email);

                    ResultSet rs = ps.executeQuery();
                    if(rs.next()){
                        st = con.createStatement();
                        st.execute("update appointment set days='"+dayscombines+"' ,slots='"+slotcombines+"' where email ='"+email+"'");
                    }else{
                        st = con.createStatement();
                        st.execute("insert into appointment(email, days, slots) values('"+email+"','"+dayscombines+"','"+slotcombines+"')");
                    }
                    response.sendRedirect("mainpage.jsp");
                    
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
