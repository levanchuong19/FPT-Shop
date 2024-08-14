<%@page import="Models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="Models.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Giỏ hàng</title>
        <style>
            /* CSS để căn giữa nội dung và làm cho tiêu đề in đậm lớn hơn */
            body {
                text-align: center; /* Căn giữa nội dung */
            }
            h1 {
                font-size: 24px; /* Kích thước lớn hơn cho tiêu đề */
                font-weight: bold; /* In đậm tiêu đề */
            }
            table {
                margin: 0 auto; /* Căn giữa bảng */
            }
        </style>
    </head>
    <body>
        <div class="btn-container">
        <a href="<%= request.getContextPath() %>/home" style="display: inline-block; padding: 10px 20px; font-size: 18px; color: #fff; background-color: #007bff; border: none; border-radius: 5px; text-decoration: none; transition: background-color 0.3s ease;">Back to home</a>
    </div>
        <h1>Cart</h1>
    <%-- Hiển thị số lượng sản phẩm đã đặt hàng và tổng số lượng và giá tiền của sản phẩm --%>
   <% 
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart != null) {
        List<CartItem> items = cart.getItems(); 
        int totalQuantity = cart.getTotalQuantity();
        double totalPrice = cart.getTotalPrice();
        if(totalQuantity > 0 && totalPrice > 0 ) {
    %>
    
    <p style="font-size: 20px;">Total items in cart: <%= totalQuantity %></p>
    <p style="font-size: 20px;">Total price: <%= totalPrice %></p>
           <table border="1">
               <thead>
                   <tr>
                       <th>Id</th>
                       <th>Image</th>
                       <th>Name</th>
                       <th>Price</th>
                       <th>Quantity</th>
                       <th>Action</th>
                   </tr>
               </thead>
               <tbody>
                   <% for (CartItem item : items) { %>
                    <form action="<%= request.getContextPath()%>/UDInCartServlet" method="POST">
                   <tr>
                       <td style="padding: 10px;"><input type="hidden" name="id" value="<%= item.getProduct().getId() %>"/><%= item.getProduct().getId() %></td>
                       <td style="padding: 10px;"> <img src="<%= item.getProduct().getImage() %>" alt="Product Image" style="width: 50px; height: 50px;"></td>
                       <td style="padding: 10px;"><%= item.getProduct().getName() %></td>
                       <td style="padding: 10px;"><%= item.getProduct().getPrice() %></td>
                       <td style="padding: 10px;">
                           <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1"/>
                        <button type="submit" name="submit" value="Save"><i class="material-icons">&#xE15C;</i> <span>Save</span></button>
                       </td>
                       <td style="padding: 10px;">
                           <input type="number" name="quantity_delete" value="1" min="1"/>
                           <button type="submit" name="submit" value="Delete"><i class="material-icons">&#xE15C;</i> <span>Delete</span></button>
                       </td>        
                   </tr>
                   </form>
                   <% } %>
               </tbody>
           </table>
               <%-- Pay button --%>
                    <form action="<%= request.getContextPath()%>/processPayment.jsp" method="POST">
                    <button type="submit" name="pay" class="btn btn-success">
                        <input type="hidden" name="totalQuantity" value="<%= totalQuantity %>">
                        <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
                        <a href="orderProduct.jsp" style="color: black ; margin-top: 20px;">Proceed to Checkout</a></button>
                    </form>
<!--               <form>    
                       <button type="submit" name="submit" value="Delete"><i class="material-icons">&#xE15C;</i> <span>Update</span></button>
               </form>-->
    <% } else { %>
           <p style="color: red; font-size: 18px;">Your cart is empty.</p>
    <% }  %>
    <% } else { %>
           <p style="color: red; font-size: 18px;">Your cart is empty.</p>
    <% }
    %>        
    </body>
</html>