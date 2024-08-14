<%-- 
    Document   : orderProduct
    Created on : Jun 12, 2024, 11:32:46 PM
    Author     : sangv
--%>

<%@page import="Models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="Models.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        fieldset {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 20px;
        }

        legend {
            font-weight: bold;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #555;
        }
    </style>
    </head>
    <body>
      <header>
        <h1>Checkout</h1>
    </header>
    <main
        <%
            // Retrieve selected items from session
            Cart cart = (Cart) session.getAttribute("cart");
                int totalQuantity = cart.getTotalQuantity();
                double totalPrice = cart.getTotalPrice();
                if(totalQuantity != 0){
            // Store total quantity and total price in session for later use
            session.setAttribute("totalQuantity", totalQuantity);
            session.setAttribute("totalPrice", totalPrice);
                }
        %>

        
        <!-- Your checkout form goes here -->
        <form id="checkoutForm" method="post" action="processPayment.jsp">
            <input type="hidden" name="totalQuantity" value="<%= totalQuantity %>">
            <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
 
            <fieldset>
                <legend>Shipping Information</legend>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required
                <label for="address">Address:</label>
                <textarea id="address" name="address" rows="4" required></textarea>
            </fieldset>
            <fieldset>
                <legend>Payment Information</legend>
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required>
                <label for="expiryDate">Expiry Date:</label>
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YYYY" required>
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" required>
            </fieldset>
            

            <button type="submit" >Pay Now</button>
        </form>
    </main>
    </body>
</html>