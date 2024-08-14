/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DBUtils.DBContext;
import Models.Cart;
import Models.CartItem;
import Models.Category;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class DetailControl extends HttpServlet {
   
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
        String id = request.getParameter("pid");
        
//        if (id == null || id.isEmpty()) {
//        // Xử lý khi id là null hoặc rỗng
//        // Ví dụ: Chuyển hướng đến trang lỗi hoặc trả về thông báo lỗi
//        response.sendRedirect("errorPage.jsp");
//        return;
//    }
        
         DBContext db = new DBContext();
        
        Product product = db.getProductByID(id);
        ArrayList<Category> categorys = db.getCategory();
        Product last = db.getLast();
        
//          HttpSession session = request.getSession();
//          int quantity = Integer.parseInt(request.getParameter("quantity")); 
//            Cart cart = (Cart) session.getAttribute("cart");
//        
//        if (cart == null) {
//            cart = new Cart();
//        }
//        
//        cart.addItem(new CartItem(product, quantity));
//        session.setAttribute("cart", cart);
//        session.setAttribute("cartQuantity", cart.getTotalQuantity());
        
        request.setAttribute("detail", product);
        request.setAttribute("categorys", categorys);
        request.setAttribute("p", last);
        request.getRequestDispatcher("View/detail.jsp").forward(request, response);
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
