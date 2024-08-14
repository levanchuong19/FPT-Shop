/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import DBUtils.DBContext;
import DBUtils.GoogleUtils;
import Models.Account;
import Models.GoogleAccount;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
  public LoginGoogleServlet() {
    super();
  }
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
//    String code = request.getParameter("code");
//    if (code == null || code.isEmpty()) {
//      RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
//      dis.forward(request, response);
//    } else {
//        GoogleUtils gg = new GoogleUtils();
//      String accessToken = gg.getToken(code);
//      GoogleAccount acc = gg.getUserInfo(accessToken);
//      request.setAttribute("id", acc.getId());
//      request.setAttribute("name", acc.getFirst_name());
//      request.setAttribute("email", acc.getEmail());
//      RequestDispatcher dis = request.getRequestDispatcher("View/home.jsp");
//      dis.forward(request, response);
//    }

         String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        } else {
            GoogleUtils gg = new GoogleUtils();
            String accessToken = gg.getToken(code);
            GoogleAccount googleAcc = gg.getUserInfo(accessToken);

            DBContext db = new DBContext();
            Account account = db.getAccountByEmail(googleAcc.getEmail());

            if (account == null) {
                // Add new user to the database
                account = new Account();
                account.setUser(googleAcc.getEmail());
                account.setPass("1234"); // You might want to handle the password differently
                account.setRoleID(2); // Assuming 2 is the roleID for regular users
                db.addAccount(account);
            }

            HttpSession session = request.getSession();
            session.setAttribute("acc", account);

            request.setAttribute("id", googleAcc.getId());
            request.setAttribute("name", googleAcc.getUser());
            request.setAttribute("email", googleAcc.getEmail());
            response.sendRedirect("home");
//            RequestDispatcher dis = request.getRequestDispatcher("home");
//            dis.forward(request, response);
        }
  }

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
