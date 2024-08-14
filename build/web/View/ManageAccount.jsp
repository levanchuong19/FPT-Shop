<%-- 
    Document   : ManageAccount
    Created on : Jun 22, 2024, 7:54:39 PM
    Author     : ADMIN
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>-->


<%@page import="Models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%--<%@ page import="your.package.Account" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Accounts</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            /*            button{
                            border: none;
                        }
                        .delete{
                            background-color: red;
                            border-radius: 3px;
                        }
                        .update{
                            background-color: yellow;
                            border-radius: 3px;
                        }*/
        </style>
    </head>
    <body>

<!--        <h1>Manage Accounts</h1>-->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Password</th>
                    <th>Role ID</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the list of accounts from the session
//                    HttpSession session = request.getSession();
                    ArrayList<Account> listUser = (ArrayList<Account>) session.getAttribute("listUser");

                    // Check if the list is not null and iterate through it
                    if (listUser != null) {
                        for (Account account : listUser) {
                %>
            <form action="<%= request.getContextPath()%>/UDListUser" method="POST">
                <tr>
                    <td><input type="hidden" name="id" value="<%= account.getId()%>"/><%= account.getId()%></td>
                    <td><input type="text" name="user" value="<%= account.getUser()%>"/></td>
                    <td><input type="text" name="pass" value="<%= account.getPass()%>"/></td>
                    <!--<td><%= account.getRoleID()%></td>-->
                    <td>
                        <select name="role">
                            <option value="0" <%= account.getRoleID() == 0 ? "selected" : ""%>>0</option>
                            <option value="2" <%= account.getRoleID() == 2 ? "selected" : ""%>>2</option>
                        </select>
                    </td>
                    <td>
                        <button class="update" type="submit" name="submit" value="Update">Update</button>
                        <button class="delete" type="submit" name="submit" value="Delete">Delete</button>
                    </td>
                </tr>
            </form>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4">No accounts available.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <div style=" background-color: blue; margin: 15px 0px; padding: 5px; width: 100px;text-align: center;border-radius: 5px; ">
        <a style=" color: #fff; text-decoration: none; font-size: 25px; " href="<%= request.getContextPath()%>/home">Home</a>
    </div>
</body>
</html>

