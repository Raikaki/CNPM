<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime</title>

    <!-- Google Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/ds/style.css"/>
    <script src="https://kit.fontawesome.com/9847adceef.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css"/>


    <c:url var="urlAvatarMovie"
           value="${requestScope.movie.getFirstAvatar()}"/>
    <c:url var="commentMovie" value="/anime-main/CommentMovie"/>
    <c:url var="renderComment" value="/anime-main/RenderCommentMovie"/>
<body>
<fmt:setLocale value="${sessionScope.LANG}"/>
<fmt:setBundle basename="app"/>

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
<div id="ah_wrapper">
    <!-- Header Section Begin -->
    <c:import url="/anime-main/header.jsp"/>
    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="index.jsp"><i class="fa fa-home"></i> <fmt:message>menu.hompage</fmt:message></a>
                        <a href=""><fmt:message>menu.categories</fmt:message></a>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="anime__details__content">
                <div class="row">
                    <div class="col-lg-3">
                        <c:url var="urlAvatarMovie"
                               value="${movie.getFirstAvatar()}"/>
                        <div class="product__item__pic set-bg"
                             data-setbg="${urlAvatarMovie}" style="background-image: url(${urlAvatarMovie});">


                            <%--                                        <div class="rate">--%>
                            <%--                                                ${movie.getAvgScore()} <i class='fa fa-star'--%>
                            <%--                                                                          style='color: #f3da35'></i>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="comment">--%>
                            <%--                                            <i class="fa fa-comments"></i> ${movie.listComment.size()}--%>
                            <%--                                        </div>--%>

                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="anime__details__text">
                            <div class="anime__details__title">
                                <h3>${requestScope.movie.name}</h3>

                            </div>
                            <div class="anime__details__rating">
                                <%--								<div class="rating" style="font-size: 18px; color: #b7b7b7;">--%>
                                <%--									${movie.getAvgScore()} <i class="fa fa-star"></i>--%>
                                <%--								</div>--%>
                                <%--								<span>${movie.voteTotal()} <fmt:message>content.votes</fmt:message></span>--%>
                            </div>
                            <p>${requestScope.movie.descriptionVN}</p>
                            <div class="anime__details__widget">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span><fmt:message>content.type</fmt:message></span>
                                                ${requestScope.movie.type.description}</li>
                                            <li><span><fmt:message>menu.categories</fmt:message>:
											<c:forEach var="genre" items="${requestScope.movie.genres}">
                                                ${genre.description}
                                            </c:forEach>
											</span>

                                            </li>
                                            <li><span>Nhà sản xuất:
											<c:forEach var="producer" items="${requestScope.movie.listProducer}">
                                                ${producer.name}
                                            </c:forEach>

											</span></li>

                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span><fmt:message>content.duration</fmt:message></span>
                                                24 min/ep
                                            </li>
                                            <li><span><fmt:message>content.quality</fmt:message></span>
                                                HD
                                            </li>
                                            <li>
                                                <span><fmt:message>content.views</fmt:message> ${requestScope.movie.views}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="anime__details__btn">
                                <c:choose>

                                    <c:when test="${checkFl==false}">

                                        <a class="follow-btn" id="icon-followed" data-id="0">
                                            <i class="fa fa-heart-o" id="icon"></i>
                                            <fmt:message>button.follow</fmt:message>

                                        </a>

                                    </c:when>
                                    <c:when test="${empty checkFl}">

                                        <a class="follow-btn">
                                            <i class="fa fa-heart-o" id="icon"></i>
                                            <fmt:message>button.follow</fmt:message>

                                        </a>

                                    </c:when>
                                    <c:when test="${checkFl==true}">
                                        <a class="follow-btn" id="icon-followed" data-id="1">
                                            <i class="fa fa-heart" id="icon"></i>
                                            <fmt:message>button.follow</fmt:message>

                                        </a>
                                    </c:when>


                                </c:choose>

                                <c:if test="${user ==null}">
                                    <c:if test="${!movie.isFree()}">
                                        <a href="/anime-main/AddWishList?idMovie=${idMovie}">
                                            <button style="color: white" id="buyMovie">Mua
                                                ngay ${movie.price} đ
                                            </button>
                                        </a>
                                    </c:if>
                                </c:if>

                                <c:if test="${user !=null }">

                                    <c:choose>
                                        <c:when test="${purchasedId != 0}">
                                            <button type="button" style="color: white" id="buyMovie">Đã mua</button>
                                        </c:when>

                                        <c:when test="${!movie.isFree()}">

                                            <button class="add-to-wishlist" data-id="${movie.id}" style="color: white"
                                                    id="buyMovie">Mua
                                                ngay ${movie.price} đ
                                            </button>

                                        </c:when>

                                    </c:choose>

                                </c:if>


                                <a href="anime_details?idf=${requestScope.viewFilm.idMovie}"
                                   class="watch-btn"><span><fmt:message>button.watch</fmt:message></span>
                                    <i class="fa fa-angle-right"></i></a>
                                <button id="rateBtn">
                                    <fmt:message>button.rate</fmt:message>
                                </button>
                                <div>
                                    <form action="rateMovie?id=${requestScope.movie.id}" method="post"
                                          id="formVote">
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <p class="fa fa-star rateStar"></p>
                                        <c:choose>

                                            <c:when test="${empty sessionScope.user}">
                                                <input type="number" id="scoreMovie" value="1"
                                                       name="scoreMovie" style="display: none;">
                                            </c:when>
                                            <c:when test="${not empty sessionScope.user}">
                                                <%--												<input type="number" id="scoreMovie"--%>
                                                <%--													value="${user.getmyRate(movie.id)}"--%>
                                                <%--													name="scoreMovie" style="display: none;">--%>
                                            </c:when>
                                        </c:choose>
                                        <input id="vote" type="submit"
                                               value=<fmt:message>content.vote</fmt:message> />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-8">
                    <div class="anime__details__review">
                        <div class="section-title">
                            <h5>
                                <fmt:message>content.reviews</fmt:message>
                            </h5>
                        </div>
                    </div>
                    <div class="anime__details__form">
                        <div class="section-title">
                            <h5>
                                <fmt:message>conten.comment</fmt:message>
                            </h5>
                        </div>

                        <form action="${commentMovie}" method="post">
                            <input type="number" value="${requestScope.movie.id}" hidden name="idMovie">
                            <textarea placeholder="Your Comment" name="message"></textarea>
                            <button type="submit" value="${requestScope.movie.id}" name="saveID">
                                <i class="fa fa-location-arrow"></i>
                                <fmt:message>content.review</fmt:message>
                            </button>
                        </form>
                    </div>


                </div>
                <c:import url="/anime-main/topview.jsp"/>

            </div>
        </div>
    </section>
    <!-- Anime Section End -->

    <!-- Footer Section Begin -->

</div>
<!-- Footer Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">
            <i class="icon_close"></i>
        </div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->




<script>
    $("#rateBtn").on("click", function () {
        $("#formVote").toggleClass("show");
    });

    $(".rateStar").on("click", function () {
        // Xóa màu trắng tất cả các nút đánh giá
        $(".rateStar").css("color", "white");

        // Thêm màu vàng cho các nút đánh giá đã được nhấn
        $(this).prevAll().addBack().css("color", "yellow");

        // Thiết lập giá trị đánh giá cho phần tử input "scoreMovie"
        $("#scoreMovie").val($(this).index() + 1);
    });

    $(".rateStar").on("mouseover", function () {
        // Xóa màu trắng tất cả các nút đánh giá
        $(".rateStar").css("color", "white");

        // Thêm màu vàng cho các nút đánh giá được trỏ chuột qua
        $(this).prevAll().addBack().css("color", "yellow");
    });

    $(".rateStar").on("mouseleave", function () {
        // Xóa màu trắng tất cả các nút đánh giá
        $(".rateStar").css("color", "white");

        // Thêm màu vàng cho các nút đánh giá đã được nhấn
        $(".rateStar").slice(0, $("#scoreMovie").val()).css("color", "yellow");
    });
</script>
<script>
    let arrbutton = document.getElementsByClassName("rateStar");
    let value = document.getElementById("scoreMovie").value;
    for (let j = 0; j < value; j++) {
        arrbutton[j].style.color = 'yellow';
    }
</script>
<script>
    $(document).ready(function () {
        // Thêm phim vào danh sách mong muốn
        $(".add-to-wishlist").click(function (event) {
            event.preventDefault();
            var idMovie = $(this).data("id");
            var $movieElement = $("#buyMovie");
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/anime-main/AddWishList",
                data: {
                    "action": "add",
                    "idMovie": idMovie
                },
                success: function (response) {
                    console.log(response);
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Đã thêm',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    var addButton = $('button[data-id="' + idMovie + '"]');
                    addButton.text("Đã thêm vào wish-list");
                    addButton.attr("disabled", true);

                },
                error: function (xhr) {
                    console.log(xhr.responseText);
                }
            });
        });

        $(".remove-from-wishlist").click(function (event) {
            event.preventDefault();
            var idMovie = $(this).data("id");
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/anime-main/AddWishList",
                data: {
                    "action": "remove",
                    "idm": idMovie
                },
                success: function (response) {
                    console.log(response);
                    alert("Xóa phim khỏi danh sách yêu thích thành công!");
                    // location.reload(); // tải lại trang
                },
                error: function (xhr) {
                    console.log(xhr.responseText);
                }
            });
        });

    });

</script>
<%--	ajax cho button khi follow hoặc unfollow --%>
<script>
    $("#icon-followed").on("click", function () {
        if ($("#icon").hasClass('fa-heart')) {// Nếu trạng thái hiện tại là icon ban đầu
            $("#icon").removeClass('fa-heart').addClass('fa-heart-o');//Đổi trạng thái thành icon mới

            $(this).data('id', '0');

        } else { // Ngược lại nếu trạng thái hiện tại là icon mới
            $("#icon").removeClass('fa-heart-o').addClass('fa-heart');// Đổi trạng thái thành icon ban đầu
            $(this).data('id', '1');

        }

        let id = $(this).data('id');
        let idmovie =${requestScope.movie.id};
        console.log(id);
        $.ajax({
            url: "FollowMovie",
            type: "POST",
            data: {id: id, idmovie: idmovie,},
            success: function (response) {

            },
            error: function (xhr, status, error) {
                // Xử lý lỗi nếu có
            }
        });
    });


</script>


</body>

</html>