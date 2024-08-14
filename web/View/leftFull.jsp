<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header text-white text-uppercase" style="background-color: red;"><i class="fa fa-list"> </i> Categories</div>
        <form id="categoryForm" action="category" method="get">
            <ul class="list-group ">
                <c:forEach items="${categorys}" var="o">
                    <li class="list-group-item " style="color: black; padding-right: 10px;">
                        <input style="margin-right: 20px;" type="checkbox" name="cid" value="${o.cateID}" ${tag == o.cateID ? "checked" : ""} onchange="handleCheckboxChange(this)" /> ${o.cateName}
                    </li>
                </c:forEach>
            </ul>
        </form>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header text-white text-uppercase" style="background-color: red;">New product</div>
        <div class="card-body">
            <img class="img-fluid" src="${p.image}" />
            <h5 class="card-title">${p.name}</h5>
            <p class="card-text">${p.description}</p>
            <p class="bloc_left_price">${p.price} $</p>
        </div>
    </div>
    <iframe style="margin-left: -23px; border-radius: 5px;" 
            src="https://player.vimeo.com/video/916597843?h=994841aa97?controls=0&sidedock=0&title=0&autoplay=1&muted=1&loop=1"
            width="300" height="438" 
            frameborder="0" allow="autoplay; fullscreen; picture-in-picture">
    </iframe>
</div>

<script>
    function handleCheckboxChange(checkbox) {
        // Uncheck all checkboxes except the one that was just checked
        document.querySelectorAll('input[name="cid"]').forEach((cb) => {
            if (cb !== checkbox) {
                cb.checked = false;
            }
        });

        // Submit the form
        document.getElementById('categoryForm').submit();
    }
</script>
