<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Finalization</title>
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
        </style>
    </head>
    <body>
        <div class="confirmation">
            <h2>Payment Successful</h2>
            <p>Thank you, <strong><%= request.getParameter("name") %></strong>, for your purchase!</p>
            <p>A confirmation email has been sent to <strong><%= request.getParameter("email") %></strong>.</p>
            <p>Your items will be shipped to:</p>
            <p><strong><%= request.getParameter("address") %></strong></p>
            
            <%
                // Retrieve and display payment details
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                // You may retrieve other payment details as needed
    
                // Clear the cart session attribute after successful payment
            session.removeAttribute("cart");
            session.setAttribute("cartQuantity",0 );
%>
            <a href="<%= request.getContextPath() %>/home" style="display: inline-block; padding: 10px 20px; font-size: 18px; color: #fff; background-color: #007bff; border: none; border-radius: 5px; text-decoration: none; transition: background-color 0.3s ease;">Back to home</a>
        </div>
    </body>
</html>
