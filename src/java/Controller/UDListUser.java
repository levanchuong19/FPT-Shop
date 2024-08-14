/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBUtils.DBContext;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sangv
 */
public class UDListUser extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            int role = Integer.parseInt(request.getParameter("role"));

            String check = request.getParameter("submit");
            Account acc = new Account(id, user, pass, role);
            DBContext db = new DBContext();
            ArrayList<Account> listUserAfterAction = new ArrayList<>();
            int checksuccess = 0;
            HttpSession session = request.getSession();
            
            if (check.equals("Update")) {
                checksuccess = db.updateAccount(acc);
                listUserAfterAction = db.getListUserAccount();
                
                if (checksuccess == 1) {
                    session.setAttribute("listUser", listUserAfterAction);
                    response.sendRedirect("View/ManageAccount.jsp");
                }
            } 
            
            else
                
            if (check.equals("Delete")) {
                checksuccess = db.deleteAccount(id);
                listUserAfterAction = db.getListUserAccount();
                
                if (checksuccess == 1) {
                    session.setAttribute("listUser", listUserAfterAction);
                    response.sendRedirect("View/ManageAccount.jsp");
                }
            }
        } finally {
            out.close();
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
