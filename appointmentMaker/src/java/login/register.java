/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import java.sql.SQLException;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import login.test;

/**
 *
 * @author vivek
 */
public class register extends HttpServlet {

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
            Statement st;
            String name, email, password;
    
                try {
                    // random number
                    Random rnd = new Random();
                    int n = 100000 + rnd.nextInt(900000);
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                    name = request.getParameter("fname");
                    email = request.getParameter("email");
                    password = request.getParameter("password");
                    con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/mrcalender.accdb");
                    st = con.createStatement();
                    st.execute("insert into useraccount(fullname, email, password, everify, otp) values('"+name+"','"+email+"','"+password+"','no','"+n+"')");
                    
                    //send email
                    try{
                        test t = new test();
                        t.initialized(email, "verify email for appointment maker", "<h3>Hi, "+name+" </h3><br>Your <b>OTP: "+n+"</b>.");
                    }
                    catch(Exception e){
                        out.print(e);
                    }
                    // otptm.sendMail(email, "verify email for appointment maker", "<h3>Hi, "+name+" <br>Your <b>OTP: "+n+"</b>.");
                    request.removeAttribute("fname");
                    request.removeAttribute("password");
                    //forward to verification page
                    request.setAttribute("email", email);
                    request.setAttribute("otp", n);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("emailverification.jsp");
                    dispatcher.forward(request, response);
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
