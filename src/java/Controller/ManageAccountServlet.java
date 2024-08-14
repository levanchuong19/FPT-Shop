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
public class ManageAccountServlet extends HttpServlet {

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
//          HttpSession session = request.getSession();
//          response.sendRedirect("View/Account.jsp");
            DBContext db = new DBContext();
            ArrayList<Account> listUser =  db.getListUserAccount();
            HttpSession session = request.getSession();
            session.setAttribute("listUser", listUser);
            response.sendRedirect("View/ManageAccount.jsp");
        }finally{
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


//<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
//<%@page contentType="text/html" pageEncoding="UTF-8"%>
//<!--begin of menu-->
//<nav class="navbar navbar-expand-md navbar-dark bg-dark">
//    <div class="container">
//        <a class="navbar-brand" href="home">Hạ Vũ SmartPhones</a>
//        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
//            <span class="navbar-toggler-icon"></span>
//        </button>
//
//        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
//            <ul class="navbar-nav m-auto">
//                <c:if test="${sessionScope.acc.roleID == 1}">
//                <li class="nav-item">
//                    <a class="nav-link" href="ManageAccountServlet">Manager Account</a>
//                </li>
//                </c:if>
//                <c:if test="${sessionScope.acc.roleID == 1 || sessionScope.acc.roleID == 2}">
//                <li class="nav-item">
//                    <a class="nav-link" href="manager">Manager Product</a>
//                </li>
//                </c:if>
//                <c:if test="${sessionScope.acc != null}">
//                    <li class="nav-item">
//                        <a class="nav-link" href="View/Account.jsp">Hello ${sessionScope.acc.user}</a>
//                    </li>
//                    <li class="nav-item">
//                        <a class="nav-link" href="logout">Logout</a>
//                    </li>
//                </c:if>
//
//                <c:if test="${sessionScope.acc == null}">
//                    <li class="nav-item">
//                        <a class="nav-link" href="Login.jsp">Login</a>
//                    </li>
//                </c:if>
//            </ul>
//
//            <form action="home" method="post" class="form-inline my-2 my-lg-0">
//                <div class="input-group input-group-sm">
//                    <input name="txtSearch" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
//                    <div class="input-group-append">
//<!--                        <button type="submit" class="btn btn-secondary btn-number">
//                            <i class="fa fa-search"></i>
//                        </button>-->
//                    </div>
//                </div>
//                <button type="submit" name="btAction">Search</button>
//                
//            </form>
//                    
//                        <%
////    HttpSession session = request.getSession(false); // false để không tạo mới session nếu không tồn tại
//    int cartQuantity = 0; // Số lượng sản phẩm mặc định
//    if (session != null) {
//        // Lấy số lượng sản phẩm từ session
//        Integer quantity = (Integer) session.getAttribute("cartQuantity");
//        if (quantity != null) {
//            cartQuantity = quantity;
//        }
//    }
//%>
//
//
//<%
//    int activeServletForCartJSP = 1; // Đặt biến trạng thái
//    session.setAttribute("activeServletForCartJSP", activeServletForCartJSP); // Lưu trữ trong session
//%>
//
//<!--<form action="addToCart" method="post">
//    <button type="submit" class="btn btn-success btn-sm ml-3">
//        <i class="fa fa-shopping-cart"></i> Cart
//        <span class="badge badge-light"><%= cartQuantity %></span>
//    </button>
//</form>-->
//
//<a class="btn btn-success btn-sm ml-3" href="View/cart.jsp">
//    <i class="fa fa-shopping-cart"></i> Cart
//    <span class="badge badge-light"><%= cartQuantity %></span>
//</a>
//    
//        </div>
//    </div>
//</nav>
//<section class="jumbotron text-center">
//    <div class="container">
//        <h1 class="jumbotron-heading">SmartPhone Market</h1>
//        <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu</p>
//    </div>
//    <style>
//        .jumbotron {
//            background-image: url('https://www.cnet.com/a/img/resize/92a60d24c56174a29d53a9e8c8f3dcabf93fcf39/hub/2023/08/04/0568e1e5-b52d-4748-bd87-2b97b8dc77a6/img-9767.jpg?auto=webp&fit=crop&height=360&width=640'); /* Thay đường dẫn 'duong-dan-cua-anh.jpg' bằng đường dẫn thực tế của tập tin ảnh bạn muốn sử dụng */
//            background-size: cover; /* Đảm bảo ảnh nền sẽ phủ toàn bộ phần header */
//            background-position: center; /* Đặt vị trí ảnh ở giữa phần header */
//            color: white; /* Màu chữ trắng để tương phản với ảnh nền */
//        }
//        button[type="submit"] {
//            padding: 5px 10px;
//            margin-left: 5px;
//            background-color: #007bff;
//            color: #fff;
//            border: none;
//            border-radius: 5px;
//            cursor: pointer;
//            transition: background-color 0.3s;
//        }
//
//        button[type="submit"]:hover {
//            background-color: #0056b3;
//        }
//    </style>
//</section>
//<!--end of menu-->

