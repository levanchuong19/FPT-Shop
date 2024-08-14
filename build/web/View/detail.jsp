<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Điện Thoại | Smartphone chính hãng, giá rẻ, trợ giá lên đời.</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background-color: #fafafa;
                width: 100%;
            }
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
            .body{
                background-color: #eee;
                border-radius: 10px;
                padding: 10px;
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="thanhchuyentrang"  >
                <div class="container" >
                    <div class="row">
                        <div class="col" style="margin-left: -15px; " >
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb" style="font-size: 15px;  margin-bottom: 10px; width: 1140px; ">
                                    <li class="breadcrumb-item "><a style="color: black ;" href="home">Home</a></li>
                                    <li class="breadcrumb-item"><a style="color: black ;" href="home">Category</a></li>
                                    <li class="breadcrumb-item active" aria-current="#"><a style="color: black ;" href="">Sub-category</a></li></li>
                                </ol>

                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container body">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap" style="padding-top: 130px;">
                                                <div> <a href="#"><img src="${detail.image}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${detail.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">US $</span><span class="num">${detail.price}</span>
                                            </span> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>
                                                    ${detail.description}
                                                </p></dd>
                                        </dl>

                                        <hr>
                                        <!--                                        <div class="row">
                                                                                    <div class="col-sm-5">
                                                                                        <dl class="param param-inline">
                                                                                            <dt>Quantity: </dt>
                                                                                            <dd>
                                                                                                <select class="form-control form-control-sm" style="width:70px;">
                                                                                                    <option> 1 </option>
                                                                                                    <option> 2 </option>
                                                                                                    <option> 3 </option>
                                                                                                </select>
                                                                                            </dd>
                                                                                        </dl>   item-property .// 
                                                                                    </div>  col.// 
                                        
                                                                                </div>  row.// -->
                                        <hr>
                                        <h3>Quantity</h3>
                                        <!--                                        <a href="orderProduct.jsp"  class="btn btn-lg btn-primary text-uppercase"> Buy now </a>-->
                                        <form id="addToCartForm" method="post" action="addToCart" class="addtoCard" >
                                            <!--<input type="hidden" name="from" value="home">-->
                                            <input type="hidden" name="pid" value="${detail.id}">
                                            <div class="add" >
                                                
                                                <a href="View/cart.jsp">
                                                    <input style="width: 60px; margin-bottom: 15px;" type="number" name="quantity" value="1" min="1">
                                                    <button type="submit" class="btn btn-success btn-block"> 
                                                        Buy Now 
                                                    </button>
                                                </a>


                                            </div>

                                        </form>
                                        <!--                                        <a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                        
                                        
                                        
                                                                                                                        <form id="addToCartForm" method="get" action="addToCart">
                                                                                                                             <input type="hidden" name="from" value="detail">
                                                                                    <input type="hidden" name="pid" value="${detail.id}">
                                                                                    <input type="number" name="quantity" value="1" min="1">
                                                                                    <button type="submit" class="btn btn-success btn-block">Add to cart</button>
                                                                                </form>-->


                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
