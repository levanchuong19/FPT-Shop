/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DBUtils.DBContext;
import Models.Category;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class HomeControl extends HttpServlet {
   
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
        DBContext db = new DBContext();
        ArrayList<Category> categorys = db.getCategory();
        Product last = db.getLast();
        
        String txtSearch = request.getParameter("txtSearch");
        int page = 1;
        int pageSize = 9;
    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        try {
            page = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            page = 1;
        }
    }
    if (txtSearch != null && !txtSearch.isEmpty()) {
        ArrayList<Product> productsBySearch = db.searchByName(txtSearch);
        request.setAttribute("products", productsBySearch);
    } else {
         ArrayList<Product> products =  (ArrayList<Product>) db.getProducts(page, pageSize);
        request.setAttribute("products", products);
    }
    int totalProducts = db.getTotalProducts();
    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        request.setAttribute("categorys", categorys);
        request.setAttribute("p", last);
        request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("View/home.jsp").forward(request, response);
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
        processRequest(request, response);
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
