<%@page import="Models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="Models.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .confirmation {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        p {
            margin-bottom: 10px;
        }
        .button-container {
            text-align: center;
        }
        button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #555;
        }
        .product-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .product-image {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="confirmation">
        <h2>Payment Confirmation</h2>
        <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
        <p><strong>Email:</strong> <%= request.getParameter("email") %></p>
        <p><strong>Address:</strong> <%= request.getParameter("address") %></p>
        <p><strong>Card Number:</strong> <%= request.getParameter("cardNumber").replaceAll("\\d(?=\\d{4})", "*") %></p>
        <p><strong>Expiry Date:</strong> <%= request.getParameter("expiryDate") %></p>
        
        <h2>Order Summary</h2>
        <p><strong>Total Quantity:</strong> <%= request.getParameter("totalQuantity") %></p>
        <p><strong>Total Price:</strong> <%= request.getParameter("totalPrice") %></p>
        
         <h2>Products Ordered</h2>
        <% 
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
            List<CartItem> items = cart.getItems(); 
        
    %>
           <table border="1">
               <thead>
                   <tr>
                       <th>Id</th>
                       <th>Image</th>
                       <th>Name</th>
                       <th>Price</th>
                       <th>Quantity</th>
                   </tr>
               </thead>
               <tbody>
                   <% for (CartItem item : items) { %>
                   <tr>
                       <td style="padding: 10px;"><input type="hidden" name="id" value="<%= item.getProduct().getId() %>"/><%= item.getProduct().getId() %></td>
                       <td style="padding: 10px;"> <img src="<%= item.getProduct().getImage() %>" alt="Product Image" style="width: 50px; height: 50px;"></td>
                       <td style="padding: 10px;"><%= item.getProduct().getName() %></td>
                       <td style="padding: 10px;"><%= item.getProduct().getPrice() %></td>
                       <td style="padding: 10px;"><%= item.getQuantity() %></td>    
                   </tr>
                   <% } %>
               </tbody>
           </table>
    <% } else { %>
           <p style="color: red; font-size: 18px;">Your cart is empty.</p>
    <% }
    %>        
        
        
        <div class="button-container">
            <form action="finalizePayment.jsp" method="post">
                <input type="hidden" name="name" value="<%= request.getParameter("name") %>">
                <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
                <input type="hidden" name="address" value="<%= request.getParameter("address") %>">
                <input type="hidden" name="cardNumber" value="<%= request.getParameter("cardNumber") %>">
                <input type="hidden" name="expiryDate" value="<%= request.getParameter("expiryDate") %>">
                <input type="hidden" name="totalQuantity" value="<%= request.getParameter("totalQuantity") %>">
                <input type="hidden" name="totalPrice" value="<%= request.getParameter("totalPrice") %>">
                <button type="submit">Confirm Payment</button>
            </form>
        </div>
    </div>
</body>
</html>
