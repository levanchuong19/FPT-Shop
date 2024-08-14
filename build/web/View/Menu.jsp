<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <!--begin of menu-->
    <body>
        <nav class="navbar navbar-expand-md navbar-dark  " style="background-color: red; font-weight: bold">
            <div class="container " style="background-color: red; font-size: 10px; padding-right: 0px; display: flex; align-items: center; " >
                <a class="navbar-brand" href="home">
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Logo-FPT-Shop-Black.png/640px-Logo-FPT-Shop-Black.png"
                        alt=""
                        />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end header" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">




                        <form action="home" method="post" class="form-inline my-2 my-lg-0">
                            <div class="input-group input-group-sm">
                                <input name="txtSearch" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                                    <div class="input-group-append">
                                        <!--                        <button type="submit" class="btn btn-secondary btn-number">
                                                                    <i class="fa fa-search"></i>
                                                                </button>-->
                                    </div>
                            </div>
                            <button style="background-color: #6c757d"  type="submit" name="btAction"><i class="fa fa-search"></i></button>

                        </form>

                        <%
//    HttpSession session = request.getSession(false); // false để không tạo mới session nếu không tồn tại
                            int cartQuantity = 0; // Số lượng sản phẩm mặc định
                            if (session != null) {
                                // Lấy số lượng sản phẩm từ session
                                Integer quantity = (Integer) session.getAttribute("cartQuantity");
                                if (quantity != null) {
                                    cartQuantity = quantity;
                                }
                            }
                        %>


                        <%
                            int activeServletForCartJSP = 1; // Đặt biến trạng thái
                            session.setAttribute("activeServletForCartJSP", activeServletForCartJSP); // Lưu trữ trong session
                        %>

                   


                        <div style="display: flex; ">    
                            <div class="icon" style="align-items: center; display: flex;">
                                <a class="btn btn-success btn-sm ml-3" style="background-color: #6c757d ;height: 34px;  margin-left: 100px; align-items: center ;" href="View/cart.jsp">
                                    <i class="fa fa-shopping-cart"></i> Cart
<!--                                    <span class="badge badge-light"><%= cartQuantity%></span>-->
                                </a>
                            </div>
                            <c:if test="${sessionScope.acc == null}">
                                <li class="nav-item">
                                    <!--                        <a class="nav-link" href="Login.jsp">Login</a>-->
                                    <a href="Login.jsp"><i class="fa-regular fa-user  "></i></a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc.roleID == 1}">
                                <li class="nav-item">
                                    <a style="display: flex; align-items: center; flex-direction: column; " class="nav-link" href="ManageAccountServlet">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="35px" viewBox="0 -960 960 960" width="35px" fill="#5f6368">
                                            <path d="M400-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM80-160v-112q0-33 
                                                  17-62t47-44q51-26 115-44t141-18h14q6 0 12 2-8 18-13.5 37.5T404-360h-4q-71 0-127.5 18T180-306q-9 5-14.5 14t-5.5
                                                  20v32h252q6 21 16 41.5t22 38.5H80Zm560 40-12-60q-12-5-22.5-10.5T584-204l-58 18-40-68 46-40q-2-14-2-26t2-26l-46-40
                                                  40-68 58 18q11-8 21.5-13.5T628-460l12-60h80l12 60q12 5 22.5 11t21.5 15l58-20 40 70-46 40q2 12 2 25t-2 25l46 40-40
                                                  68-58-18q-11 8-21.5 13.5T732-180l-12 60h-80Zm40-120q33 0 56.5-23.5T760-320q0-33-23.5-56.5T680-400q-33 0-56.5 23.5T600-320q0
                                                  33 23.5 56.5T680-240ZM400-560q33 0 56.5-23.5T480-640q0-33-23.5-56.5T400-720q-33 0-56.5 23.5T320-640q0 33 23.5 56.5T400-560Zm0-80Zm12 400Z"/></svg>
                                        Manager Account</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc.roleID == 1 }">
                                <li class="nav-item">
                                    <a style="display: flex; align-items: center; flex-direction: column" class="nav-link" href="manager">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="35px" viewBox="0 -960 960 960" width="35px" fill="#5f6368">
                                            <path d="m260-520 220-360 220 360H260ZM700-80q-75 0-127.5-52.5T520-260q0-75 52.5-127.5T700-440q75 0 127.5 52.5T880-260q0 75-52.5 
                                                  127.5T700-80Zm-580-20v-320h320v320H120Zm580-60q42 0 71-29t29-71q0-42-29-71t-71-29q-42 0-71 29t-29 71q0 42 29 71t71 
                                                  29Zm-500-20h160v-160H200v160Zm202-420h156l-78-126-78 126Zm78 0ZM360-340Zm340 80Z"/></svg>
                                        Manager Product</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc != null}">
                                <li class="nav-item">
                                    <a style="display: flex; align-items: center; flex-direction: column" class="nav-link" href="View/Account.jsp">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="35px" viewBox="0 -960 960 960" width="35px" fill="#5f6368">
                                            <path d="M560-440h200v-80H560v80Zm0-120h200v-80H560v80ZM200-320h320v-22q0-45-44-71.5T360-440q-72 0-116 
                                                  26.5T200-342v22Zm160-160q33 0 56.5-23.5T440-560q0-33-23.5-56.5T360-640q-33 0-56.5 23.5T280-560q0 
                                                  33 23.5 56.5T360-480ZM160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0
                                                  33-23.5 56.5T800-160H160Zm0-80h640v-480H160v480Zm0 0v-480 480Z"/></svg>
                                        Hello ${sessionScope.acc.user}</a>
                                </li>
                                <li class="nav-item">
                                    <a style="display: flex; align-items: center; flex-direction: column" class="nav-link" href="logout">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="35px" viewBox="0 -960 960 960" width="28px" fill="#5f6368">
                                            <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/></svg>Logout</a>
                                </li>
                            </c:if>
                        </div>

                    </ul>
                </div>
            </div>
        </nav>

    </body>
    <style>
        .navbar-brand{
            img{
                width: 150px;
                height: 5vh;
                object-fit: cover;
            }
        }
        .my-lg-0{
            padding-left: 100px;
        }
        .header .nav-item{
            .nav-link{
                color: #fff;        
            }

        }
        .fa-user{
            font-size: 25px;
            padding-top: 5px;
            color: #fff;
            padding-left: 20px;
        }

        button[type="submit"] {
            padding: 5px 10px;
            margin-left: 5px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        .form-control{
            width: 200px;
        }
        .navbar-expand-md {
            padding: 0px 16px;
        }
        .form-inline {
            padding-left: 0px;
            .form-control{
                padding: 5px 0px;
                width: 400px;
            }
            button{
                padding: 9px 15px;
                margin: 0px;
                margin-right: 50px;
            }
        }
        .icon{
            align-items: center; 
            display: flex;
            .ml-3{
               background-color: #6c757d ;
               height: 34px; 
               margin-left: 100px;
               align-items: center ;
            }
        } 
        .nav-item a{
            display: flex; 
            align-items: center;
            flex-direction: column
        }
    </style>

</html>
<!--end of menu-->
