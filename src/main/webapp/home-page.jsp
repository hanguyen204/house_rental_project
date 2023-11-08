<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GARO ESTATE | TRANG CHỦ</title>
    <meta name="description" content="GARO is a real-estate template">
    <meta name="author" content="Kimarotec">
    <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/fontello.css">
    <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
    <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
    <link href="assets/css/animate.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/icheck.min_all.css">
    <link rel="stylesheet" href="assets/css/price-range.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/owl.theme.css">
    <link rel="stylesheet" href="assets/css/owl.transitions.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
</head>
<style>
    #avatar {
        width: 50px;
    }
</style>
<body>
<nav class="navbar navbar-default ">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/home-page"><img src="assets/img/logo.png" alt=""></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse yamm" id="navigation">
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li class="dropdown ymm-sw">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <img src="${sessionScope.urlImage}" alt="Avatar" class="img-circle" id="avatar"><span style="color: black;">  ${sessionScope.username}</span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu navbar-nav">
                                <li><a href="user-profile.jsp">Quản lý thông tin</a></li>
                                <c:if test="${sessionScope.userType eq 'Landlord'}">
                                    <li><a href="#">Quản lý đăng tin</a></li>
                                    <li><a href="/danh-sach-nha-cua-ban">Quản lý nhà</a></li>
                                </c:if>
                                <c:if test="${sessionScope.userType eq 'Admin'}">
                                    <li><a href="/toggleStatus">Quản lý nguời dùng</a></li>
                                    <li><a href="/landlordlist">Quản lý chủ nhà.</a></li>
                                </c:if>
                                <li><a href="change-password.jsp">Thay đổi mật khẩu</a></li>
                                <li><a href="logout">Đăng xuất</a></li>
                            </ul>
                        </li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <div class="button navbar-right" style="font-weight: bold;">
                        <button class="navbar-btn nav-button" onclick="redirectToLogin()">Đăng nhập</button>
                        <button class="navbar-btn nav-button login" onclick=" redirectToRegister()">Đăng ký</button>
                    </div>
                </c:otherwise>
            </c:choose>
            <ul class="main-nav nav navbar-nav navbar-left">
                <li><a href="/home-page" style="color: black; font-weight: 500;">Trang chủ</a></li>
                <li><a href="/listHouse" style="color: black; font-weight: 500;">Nhà đất cho thuê</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- End of nav bar -->

<div class="slider-area">
    <div class="slider">
        <div id="bg-slider" class="owl-carousel owl-theme">
            <div class="item"><img src="assets/img/slide1/slider-img-01.png" alt="GTA V"></div>
            <div class="item"><img src="assets/img/slide1/slider-img-03.png" alt="The Last of us"></div>
            <div class="item"><img src="assets/img/slide1/slider-img-02.png" al t="GTA V"></div>
        </div>
    </div>
    <div class="row" style="padding-top: 10px;">
        <div class="col-lg-4 col-lg-offset-4 col-md-10 col-md-offset-1 col-sm-12 center" style="margin-top: 10px;">
            <div class="search-form">
                <form action="/HomeownerPostedHouse?action=search" method="post" class=" form-inline">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Nhập tên cần nhà tìm kiếm" style="color: black; font-size: 18px;" name="houseName">
                    </div>
                    <button class="btn search-btn" type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- property area -->
<div class="content-area home-area-1 recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                <!-- /.feature title -->
                <h2 style="font-weight: bold; color: black;">NHỮNG NHÀ CHO THUÊ HÀNG ĐẦU</h2>
                <p>Đây là bảng xếp hạng được đánh giá theo tiêu chuẩn đã được đưa ra. Bạn cũng có thể tìm kiếm những ngôi nhà khác ưng ý hơn.</p>
            </div>
        </div>
        <div class="row">
            <div class="proerty-th">
                <c:forEach var="house" items="${houses}" >
                    <div class="col-sm-7 col-md-4 p0">
                        <div class="box-two proerty-item">
                            <div class="item-thumb">
                                <a href="property-3.html"><img src="${house.imgHouse}" style="max-width: 400px; max-height: 20px"></a>
                            </div>
                            <div class="item-entry overflow">
                                <h5><a href="property-3.html" >${house.houseName}</a></h5>
                                <div class="dot-hr"></div>
                                <span class="pull-left"><b>Area :</b> ${house.width} </span>
                                <c:choose>
                                    <c:when test="${house.price != 'Thảo thuận'}">
                                        <span class="proerty-price pull-right">${house.price}/${house.timeRental}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="proerty-price pull-right">${house.price}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="col-sm-7 col-md-4 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th" onclick="redirectToProperties()"></i>
                        </div>
                        <div class="item-entry overflow">
                            <h5 class="tree-sub-ttl">Show all properties</h5>
                            <button class="btn border-btn more-black" value="All properties" onclick="redirectToProperties()">All properties</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer-area">
    <div class=" footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="single-footer">
                        <h4 style="color: black; font-weight: 700;">VỀ CHÚNG TÔI</h4>
                        <div class="footer-title-line"></div>
                        <img src="assets/img/footer-logo.png" alt="" class="wow pulse">
                        <p style="color: black; font-weight: bold; font-size: 16px;">CÔNG TY NHÀ ĐẤT GARO ESTATE VIỆT NAM</p>
                        <ul class="footer-adress" style="color: black; font-size: 16px;">
                            <li><i class="pe-7s-map-marker strong"> </i>QL32, Kim Chung, Hoài Đức, Hà Nội</li>
                            <li><i class="pe-7s-mail strong"> </i> garoestate@gmail.com</li>
                            <li><i class="pe-7s-call strong"> </i> (033) 617 2381</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="single-footer">
                        <h4 style="color: black; font-weight: 700;">MỤC LỤC</h4>
                        <div class="footer-title-line"></div>
                        <ul class="footer-menu">
                            <li><a href="index.html" style="color: black; font-size: 14px;">Trang chủ</a></li>
                            <li><a href="#" style="color: black; font-size: 14px;">Nhà đất cho thuê</a>  </li>
                            <li><a href="#" style="color: black; font-size: 14px;">Dịch vụ</a></li>
                            <li><a href="#" style="color: black; font-size: 14px;">Hỗ trợ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="single-footer">
                        <h4 style="color: black; font-weight: 700;">QUY ĐỊNH</h4>
                        <div class="footer-title-line"></div>
                        <ul class="footer-menu">
                            <li><a href="#" style="color: black; font-size: 14px;">Quy định đăng tin</a></li>
                            <li><a href="#" style="color: black; font-size: 14px;">Quy chế hoạt động</a></li>
                            <li><a href="#" style="color: black; font-size: 14px;">Điều khoản thỏa thuận</a></li>
                            <li><a href="#" style="color: black; font-size: 14px;">Chính sách bảo mật</a></li>
                            <li><a href="#" style="color: black; font-size: 14px;">Giải quyết khiếu nại</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-copy text-center">
        <div class="container">
            <div class="row">
                <div class="pull-left">
                    <span><a href="http://www.KimaroTec.com" style="font-size: 18px;">Copyright © 2023 garoestate.com.vn</a></span>
                </div>
                <div class="social pull-right">
                    <ul>
                        <li><a href="https://twitter.com/kimarotec"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.facebook.com/kimarotec"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://plus.google.com/kimarotec"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="https://instagram.com/kimarotec"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="https://instagram.com/kimarotec"><i class="fa fa-dribbble"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/modernizr-2.6.2.min.js"></script>

<script src="assets/js/jquery-1.10.2.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-select.min.js"></script>
<script src="assets/js/bootstrap-hover-dropdown.js"></script>

<script src="assets/js/easypiechart.min.js"></script>
<script src="assets/js/jquery.easypiechart.min.js"></script>

<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/wow.js"></script>

<script src="assets/js/icheck.min.js"></script>
<script src="assets/js/price-range.js"></script>

<script src="assets/js/main.js"></script>
<script>
    function redirectToLogin() {
        window.location.href = "login.jsp";
    }
    function redirectToRegister() {
        window.location.href = "register.jsp";
    }
    function redirectToProperties() {
        window.location.href = "/listHouse";
    }
</script>


</script>
</body>
</html>
