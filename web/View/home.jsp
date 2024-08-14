<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fptshop.com.vn | Điện thoại, Laptop, Tablet, Phụ kiện chính hãng giá tốt nhất.</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        html,
        body {
            width: 100%;
            position: relative;
            height: 100%;
            /*      background-color: #fafafa;
                  background-color: red;
                  background-image: linear-gradient(to bottom, rgba(90, 0, 1, 0.1),#fafafa);*/
        }

        body {
            /*      background: #red;*/
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
            width: 100%;
        }

        .swiper {
            width: 100%;
            height: 42vh;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .addtoCard{
            display: block;
            input{
                width: 40px;
            }
            button{
                width: 150px;
            }
            .add{
                display: flex;
            }
        }
        .body{
            background-color: #eee;
            padding: 40px 10px;
            padding-left: 40px;
            border-radius: 5px;
            /*       max-width: 1300px;*/
            .col-lg-4 {
                border-radius: 10px;
                background-color: red;
                padding: 3px;
                margin-bottom: 10px;
                margin-right: 5px;
                min-width: 100px;
            }
            .img_bank img{
                border-radius: 25px;
                object-fit: cover;
                margin-left: 8px;
            }
            .body_product{
                width: 100%;
                margin-left: 1px;
                margin-right: 1px;
                display: flex;
                flex-wrap: wrap;
            }
            .product{
                width: 780px;
                /*            margin-left: 0px;
                            margin-right: 0px;*/
                flex-wrap: wrap;
                display: flex;
                .item{
                    flex: 1 1 30%;
                    margin: 5px;
                    box-sizing: border-box;
                }
            }
        }


        .banner{  
            margin: 10px 168px;
            border-radius: 5px;
            background-color: #eee;
            padding: 10px ;
            display: flex;
            gap:5px;
            .swiper {
                width: 1600px;
            }
            img{
                border-radius: 5px;
            }
            .banner_anh {
                
            img{
                width: 300px;
                
            }
            }
        }
        .img_background img{
            width: 100%;

            background-image: red;
            object-fit: cover;
        }

        .block{
            width: 1250px;
            background-color: black;
            gap: 150px;
            padding:5px 10px ;
            text-align: center;
            color: black;
            li{
                border: none;
                border-radius: 20px;
                border-bottom-right-radius: 20px; 
                background-color: #eee;
                margin-top: 5px;
                margin-bottom: 5px;
                margin-left: -58px;
                padding: 5px 15px;
                font-weight: bolder;
                color: black;
                a{
                    color: black;
                }
            }


        }

        .than{
            background-color: red;
            background-image: linear-gradient(to bottom, rgba(90, 0, 1, 0.1),#fafafa,#fafafa,#fafafa);

        }
        .card-title a{
            color: #666;
            font-weight:  bolder;
            width: 500px;
        }
        .cart{
            gap:20px;
        }

        @media (max-width: 768px) {
            .swiper {
                height: auto; /* Adjust swiper height for smaller screens */
            }

            .body {
                padding: 20px 5px;
            }

            .product {
                flex-direction: column; /* Stack products vertically */
            }

            .item {
                flex: 1 1 100%;
            }

            .block {
                flex-direction: column; /* Stack menu items vertically */
                width: 100%;
            }
        }

        @media (max-width: 576px) {
            .body {
                padding: 10px 5px;
            }

            .product {
                flex-direction: column; /* Stack products vertically */
            }

            .item {
                flex: 1 1 100%;
            }

            .block {
                flex-direction: column; /* Stack menu items vertically */
                width: 100%;
            }

            .swiper-slide img {
                height: auto; /* Adjust image height for smaller screens */
            }
        }
    </style>
    <body>

        <!--begin of menu-->
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="than">
                <div class="chuyentrang" style="background-color:black; " >
                    <div class="container" >
                        <div class="row">
                            <div class="col" style=" margin-bottom: -15px;" >
                                <nav aria-label="breadcrumb">

                                    <ul class="block" style="display: flex; ">
                                    <c:forEach  items="${categorys}" var="o" >
                                        <li   class="item ${tag == o.cateID ? "active":""}"><a href="category?cid=${o.cateID}">${o.cateName}</a></li>
                                        </c:forEach>

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="img_background" style="width: 100%;">
                <img src="https://images.fpt.shop/unsafe/fit-in/filters:quality(80):fill(transparent)/fptshop.com.vn/Uploads/Originals/2024/6/20/638545024322256412_desk-header%20(11).png">
            </div>
            <div class="banner" >
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="https://images.fpt.shop/unsafe/fit-in/800x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/5/31/638527955961607267_H1.png" width="100%"></div>
                        <div class="swiper-slide"><img src="https://images.fpt.shop/unsafe/fit-in/800x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/6/6/638532661110849894_F-H1_800x300@2x.png"></div>
                        <div class="swiper-slide"><img src="https://images.fpt.shop/unsafe/fit-in/800x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/6/10/638536300016261163_F-H1_800x300.png"></div>
                        <div class="swiper-slide"><img src="https://images.fpt.shop/unsafe/fit-in/800x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/6/12/638538266346979073_F-H1_800x300.png"></div>
                        <div class="swiper-slide"><img src="https://images.fpt.shop/unsafe/fit-in/800x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/6/11/638537204322658663_F_H1_640x250@2x.png"></div>
                        <div class="swiper-slide"><img src="https://images.fpt.shop/unsafe/fit-in/800x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/6/3/638530053884916979_F-H1_800x300.png"></div>
                        <div class="swiper-slide"><img src="https://images.fpt.shop/unsafe/fit-in/800x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/6/14/638539605970487807_H1_800x300.png"></div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="banner_anh"> 
                    <a href=""><img src="https://cdn0.fahasa.com/media/wysiwyg/Thang-06-2024/Doitac_0624_Sub_392x156.jpg" height="50%" ></a>
                    <a href=""><img src="https://cdn0.fahasa.com/media/wysiwyg/Thang-06-2024/Kotienmat_0624_Sub_392x1567.jpg" height="50%"></a>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
                <script>
                    var swiper = new Swiper(".mySwiper", {
                        spaceBetween: 30,
                        centeredSlides: true,
                        autoplay: {
                            delay: 2500,
                            disableOnInteraction: false,
                        },
                        pagination: {
                            el: ".swiper-pagination",
                            clickable: true,
                        },
                        navigation: {
                            nextEl: ".swiper-button-next",
                            prevEl: ".swiper-button-prev",
                        },
                    });
                </script>
            </div> 
            <div class="thanhchuyentrang"  >
                <div class="container" >
                    <div class="row">
                        <div class="col" style="margin-left: -15px; " >
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb" style="font-size: 15px;  margin-bottom: 10px; width: 1140px;  ">
                                    <li class="breadcrumb-item"><a style="color: black ;" href="home">Home</a></li>
                                    <li class="breadcrumb-item"><a style="color: black ;" href="">Category</a></li>

                                </ol>

                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!--end of menu-->

            <div class="container body">
                <div class=" body_product  " >
                    <jsp:include page="leftFull.jsp"></jsp:include>

                        <div class=" col-sm-8">
                            <div class="product ">
                            <c:if test="${not empty products}">
                                <c:forEach items="${products}" var="o">
                                    <div class="col-12 col-md-8 col-lg-4 item">
                                        <div class="card">
                                            <a style="padding-top: 5px;" href="detail?pid=${o.id}"><img class="card-img-top" src="${o.image}"height="160vh;" alt="Card image cap"></a>
                                            <div class="card-body">
                                                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                                <p class="card-text show_txt">${o.title}</p>
                                                <div class="row">
                                                    <div class="col">
                                                        <p class="btn btn-danger btn-block" style="width: 210px;">${o.price}$</p>
                                                    </div>
                                                    <div class="img_bank"> 
                                                        <img src="https://images.fpt.shop/unsafe/fit-in/45x45/filters:quality(90):fill(white)/https://s3-sgn09.fptcloud.com/ict-k8s-promotion-prod/images-promotion/images-1716947256014.png">
                                                        <img src="https://images.fpt.shop/unsafe/fit-in/45x45/filters:quality(90):fill(white)/https://s3-sgn09.fptcloud.com/ict-k8s-promotion-prod/images-promotion/Logo-1711608161110.jpeg">
                                                        <img src="https://images.fpt.shop/unsafe/fit-in/45x45/filters:quality(90):fill(white)/https://s3-sgn09.fptcloud.com/ict-k8s-promotion-prod/images-promotion/momo-1716391827942.png">
                                                        <img src="https://images.fpt.shop/unsafe/fit-in/45x45/filters:quality(90):fill(white)/https://s3-sgn09.fptcloud.com/ict-k8s-promotion-prod/images-promotion/Vnapy-1693370130549.png">
                                                    </div>

                                                    <div class="col">
                                                        <!--<a href="#" class="btn btn-success btn-block">Add to cart</a>-->
        <!--                                              <a href="addToCart?pid=${o.id}" class="btn btn-success btn-block">Add to cart</a>
                                                    <input type="number" name="quantity" value="1" min="1">-->

                                                        <form id="addToCartForm" method="get" action="addToCart" class="addtoCard">
                                                            <!--<input type="hidden" name="from" value="home">-->
                                                            <input type="hidden" name="pid" value="${o.id}">
                                                            <div class="add">
                                                                <input type="number" name="quantity" value="1" min="1">
                                                                <button type="submit" class="btn btn-success btn-block">Add to cart</button>
                                                            </div>
                                                        </form>



                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>       
                        </div>
                    </div>

                </div>
                <div class="pagination" style=" text-align: center; padding-left: 550px;">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="home?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                        </ul>

                    </nav>
                </div> 
            </div>

        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>

