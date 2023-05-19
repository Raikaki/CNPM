<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <link rel="stylesheet" href="css/ds/font-awesome.min.css"
          type="text/css">
    <script src="https://www.google.com/recaptcha/api.js?hl=vi"></script>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<c:url var="urlAvatar"
       value="${request.rervletContext.realPath}/anime-main/storage/avatarUser/${sessionScope.user.avatar}"/>
<fmt:setLocale value="${sessionScope.LANG}"/>
<fmt:setBundle basename="app"/>


<!-- Header Section Begin -->

<fmt:setBundle basename="app"/>
<div id="ah_wrapper">
    <!-- Header End -->
    <jsp:useBean id="now" class="java.util.Date" scope="request"/>
    <c:url var="urlAvatar" value="${user.avatar}"/>
    <c:url var="listFollow" value="/anime-main/ListFollow"/>
    <c:url var="movieDetail" value="/anime-main/MovieDetail"/>
    <c:url var="listPurchased" value="/anime-main/ListPurchased"/>
    <c:url var="wishList" value="/anime-main/wishList"/>
    <fmt:setBundle basename="app"/>
    <header class="header">
        <fmt:setLocale value="${sessionScope.LANG}"/>
        <fmt:setBundle basename="app"/>
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="Index"> <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="header__right">

                        <form class="searchTag" id="search-name">
                            <div class="searchInput">
                                <input id="search-input" placeholder="Search here....."
                                       name="searchBox" type="text" oninput="searchByName(this)">

                            </div>
                        </form>
                        <div id="search-results"></div>
                        <div class="iconSearch">
                            <i class="fas fa-search"></i>
                            <table id="renderSearch"></table>
                        </div>

                    </div>

                </div>
                <div class="col-lg-3">

                    <c:if test="${not empty sessionScope.user}">
                        <div class="vallet">
                            <a href="#"><i class="fas fa-wallet fa-lg" style="color: #ffffff;"></i></a>
                            &nbsp;${sessionScope.user.balance}
                        </div>
                    </c:if>
                    <%--  Kiểm tra xem người dùng đã đăng nhập hay chưa --%>
                    <div class="header__right2">
                        <c:choose>
                            <%-- Nếu người dùng đã đăng nhập--%>
                            <c:when test="${not empty sessionScope.user}">

                                <c:if test="${sessionScope.user.isManager()==false}">
                                    <div>
                                        <img alt="" src="${urlAvatar}" id="avtUser1" onclick="vision1()">
                                        <ul class="profile" id="profile1">
                                                <%--Nêu là tài khoản user bình thường thì sẽ cung cấp những thẻ user có thể sử dụng và không có thẻ điều hướng qua trang admin--%>
                                            <li><a href="profile.jsp">
                                                <button class="">
                                                    <fmt:message>header.account</fmt:message>
                                                </button>
                                            </a></li>
                                            <li><a href="${listFollow}"><fmt:message>header.follow</fmt:message></a>
                                            <li><a href="${listPurchased}">Phim đã mua</a></li>
                                            <li><a href="logOut">
                                                <button
                                                        class="fas fa-sign-out-alt"></button>
                                            </a></li>
                                        </ul>
                                    </div>
                                </c:if>
                                <%-- Nếu người dùng là admin thì trang chi tiết của người dùng sẽ có thẻ điều hướng qua trang admin--%>
                                <c:if test="${sessionScope.user.isManager()==true}">
                                    <div>
                                        <fmt:setLocale value="${sessionScope.LANG}"/>
                                        <fmt:setBundle basename="app"/>
                                        <img alt="" src="${urlAvatar}" id="avtUser" onclick="vision()">
                                        <ul class="profile" id="profile">

                                            <li><a href="profile.jsp">
                                                <button class="">
                                                    <fmt:message>header.account</fmt:message>
                                                </button>
                                            </a></li>
                                            <li><a href="${listFollow}"><fmt:message>header.follow</fmt:message></a>
                                            <li><a href="${listPurchased}">Phim đã mua</a></li>
                                            <c:url var="adm" value="/admin/UserList"/>
                                            <li><a href="${adm}">
                                                <button class="fa fa-cog"></button>
                                            </a></li>
                                            <li><a href="logOut">
                                                <button
                                                        class="fas fa-sign-out-alt"></button>
                                            </a></li>

                                        </ul>
                                    </div>
                                </c:if>

                            </c:when>
                            <%--Nếu người dùng chưa đăng nhập thì sẽ hiện hai thẻ login hoặc là sign-up--%>
                            <c:when test="${empty sessionScope.user}">
                                <%-- 2.1. Người dùng chọn vào thẻ login để bắt đầu chức năng đăng nhập--%>
                                <a href="login.jsp"><fmt:message>menu.login</fmt:message> </a>
                                <font color="#e53637"> / </font>
                                <a href="signup.jsp"><fmt:message>menu.signup</fmt:message></a>

                            </c:when>
                        </c:choose>
                        <input type="text" id="idSession" value="${pageContext.session.id}"
                               style="display: none;">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <fmt:setLocale value="${sessionScope.LANG}"/>
                    <fmt:setBundle basename="app"/>
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a
                                        href="Index"><fmt:message>menu.hompage</fmt:message></a>
                                </li>
                                <li><a href="#"><fmt:message>menu.categories</fmt:message><span
                                        class="arrow_carrot-down"></span></a>
                                    <div class="dropdown">
                                        <ul>
                                            <jsp:useBean id="daoMovie" class="database.DAOMovie"/>
                                            <c:forEach var="genre" items="${daoMovie.listGenreHeader()}">
                                                <li><a href="genre?genre=${genre.id}">${genre.description}
                                                </a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </li>

                                <li><a href="/anime-main/gotoblog"><fmt:message>menu.ourblog</fmt:message></a></li>
                                <li><a
                                        href="https://www.facebook.com/profile.php?id=100012214729084"><fmt:message>menu.contracts</fmt:message></a>
                                </li>
                                <li><a href="#"><fmt:message>content.langue</fmt:message></a>
                                    <div class="dropdown2">
                                        <c:set var="query" value="${pageContext.request.queryString}"/>

                                        <ul>
                                            <c:if test="${param.lang== null}">
                                                <li style="color: black;"><a
                                                        href="?${query}&&lang=vi_VN"><fmt:message>content.vn</fmt:message></a>
                                                </li>
                                                <li style="color: black;"><a
                                                        href="?${query}&&lang=en_US"><fmt:message>content.en</fmt:message></a>
                                                </li>
                                            </c:if>
                                            <c:if test="${param.lang!= null}">

                                                <li style="color: black;"><a
                                                        href="?${fn:substring(query, 0, query.length()-12)}&&lang=vi_VN"><fmt:message>content.vn</fmt:message></a>
                                                </li>
                                                <li style="color: black;"><a
                                                        href="?${fn:substring(query, 0, query.length()-12)}&&lang=en_US"><fmt:message>content.en</fmt:message></a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="${wishList}">Wish list <i class="fas fa-film"></i></a>
                                </li>
                                <li>
                                    <a href="#">Recharge <i class="fas fa-credit-card" style="color: #fafafa;"></i></a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg"
             data-setbg="img/normal-breadcrumb.jpg">

        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>
                            <fmt:message>menu.login</fmt:message>
                        </h2>
                        <p>
                            <fmt:message>content.welcome</fmt:message>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>
                            <fmt:message>menu.login</fmt:message>
                        </h3>
                        <%--2.2 Nhập tên đăng nhập và mật khẩu của tài khoản vào các input của trang đăng nhập--%>
                        <%-- 2.6.3 Thực hiên đăng nhập lại khi tài khoản không tồn tại--%>
                        <%-- 2.7.3 Thực hiên đăng nhập lại khi tài khoản sai mật khẩu--%>
                        <%-- 2.8.3 Thực hiên đăng nhập lại khi tài khoản bị khóa--%>
                        <form action="login" method="post">
                            <div class="input__item">
                                <input required="required" type="text" placeholder="User Name"
                                       name="loginName" value="${usName}"> <span
                                    class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" required="required"
                                       placeholder="Password" name="loginPassword"> <span
                                    class="icon_lock"></span>
                            </div>

                            <button type="submit" class="site-btn" value="login"
                                    name="accountBtn">
                                <fmt:message>button.login</fmt:message>
                            </button>
                        </form>

                        <%--2.3. Khi ấn sumit thì sẽ nhận dữ liệu trong các thẻ input và gửi dữ liệu sang servlet để gọi phương thức login--%>
                        <br>
                        <%-- 2.6.2 Nhận lại thông tin khi hệ thống trả về lỗi tài khoản không tồn tại--%>
                        <%-- 2.7.2  Nhận lại thông tin khi hệ thống trả về lỗi khi tài khoản sai mật khẩu--%>
                        <%-- 2.8.2 T Nhận lại thông tin khi hệ thống trả về lỗi khi tài khoản bị khóa--%>
                        <div style="color: red">${errorLogin}</div>

                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>
                            <fmt:message>signup.message</fmt:message>
                        </h3>
                        <a href="signup.jsp" class="primary-btn"><fmt:message>button.signup</fmt:message></a>
                        <br> <a
                            href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/anime-main/login-google&response_type=code&client_id=653759297281-qjl19np77aug293a6tahskvbfri39e4v.apps.googleusercontent.com&approval_prompt=force"
                            class="primary-btn"><i class="fa fa-google-plus "
                                                   aria-hidden="true"> </i>
                        <fmt:message>content.logingg</fmt:message></a>

                        <br>
                        <div class="loginfb">
                            <fb:login-button scope="public_profile,email"
                                             onlogin="checkLoginState();">
                                <a class="primary-btn"> Login With Facebook</a>
                            </fb:login-button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- Login Section End -->

<!-- Footer Section Begin -->


<!-- Footer Section End -->

<!-- Search model Begin -->
<!-- Search model end -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<!-- script dang nhap bang facebook -->
<script>
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        if (response.status === 'connected') {
            testAPI();
        } else {
            document.getElementById('status').innerHTML = 'Please log '
                + 'into this app.';
        }
    }

    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
        FB.api(
            '/me',
            'POST',
            {fields: 'first_name,last_name,picture, email,id'},
            function (response) {
                var pictureUrl = response.picture.data.url;
                console.log(pictureUrl);
                // Chuyển hướng đến trang mới với URL của hình ảnh đại diện
                window.location.href = 'loginWithFacebook?action=Face&&first_name='
                    + response.first_name
                    + '&&last_name='
                    + response.last_name
                    + '&&picture='
                    + pictureUrl
                    + '&&email='
                    + response.email + '&&id=' + response.id;
            }
        );
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '530089069113837',
            cookie: true,
            xfbml: true,
            version: 'v12.0'
        });

        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB
            .api(
                '/me',
                function (response) {
                    console.log('Successful login for: '
                        + response.name);
                    document.getElementById('status').innerHTML = 'Thanks for logging in, '
                        + response.name + '!';
                });
    }
</script>

</body>

</html>