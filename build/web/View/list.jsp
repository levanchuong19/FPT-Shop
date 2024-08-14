<%-- 
    Document   : list
    Created on : Mar 12, 2024, 8:48:34 PM
    Author     : Admin
--%>
<%@ page import="Models.Items" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DBContext.DBContext" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h1>Item list</h1>

            <!-- Display the list of humans -->
            <div>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Price</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            // Retrieve the list of humans from the request attribute
                            ArrayList<Items> items = (ArrayList<Items>)request.getAttribute("items");
                        
                            // Iterate through the list and display human information
                            for (Items item : items) { 
                        %>
                        
                        <tr>
                            
                            <td><%= item.getItemNo() %></td>
                            <td><%= item.getPrice() %></td>
                            <td><%= item.getProductNo().getPName() %></td>
                            <td><%= item.getProductNo().getCategoy() %></td>
                            <td><%= item.getSizeCode().getDescription() %></td>
                            <td>
                                <a href="#">update</a>
                                <a href="#">delete</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                    <button onclick="location.href = 'Add.jsp'">insert</button>
                    <button onclick="location.href = 'index.jsp'">Back to main</button>
                </table>
            </div>


            <!-- Form for updating and adding human information -->
            <div id="formContainer">
                <!-- The form content will be displayed here -->
            </div>
        </div>
    </body>
</html>
