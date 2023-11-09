<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GARO ESTATE | ĐĂNG NHẬP</title>
    <meta name="description" content="GARO is a real-estate template">
    <meta name="author" content="Kimarotec">
    <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

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
    .error {
        color: red;
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
            <div class="button navbar-right" style="font-weight: bold;">
                <button class="navbar-btn nav-button" onclick="redirectToLogin()">Đăng nhập</button>
                <button class="navbar-btn nav-button login" onclick="redirectToRegister()">Đăng ký</button>
            </div>
            <ul class="main-nav nav navbar-nav navbar-left">
                <li><a href="/home-page" style="color: black; font-weight: 500;">Trang chủ</a></li>
                <li><a href="properties.html" style="color: black; font-weight: 500;">Nhà đất cho thuê</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- End of nav bar -->

<div class="register-area" style="background-color: rgb(249, 249, 249);">
    <div class="container">
        <div class="col-md-7"  style="margin-left: 230px;">
            <div class="box-for overflow">
                <div class="col-md-12 col-xs-12 login-blocks" style="color: black">
                    <h2>Đăng nhập </h2>
                    <form action="login" method="get">
                        <span class="error">${error}</span>
                        <div class="form-group">
                            <label for="name">Tên tài khoản</label>
                            <input type="text" class="form-control" id="name" name="username-login" placeholder="Enter your name" style="color: black; font-size: 16px">
                        </div>
                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" name="password-login" placeholder="Enter your password" style="font-size: 16px">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-default">Đăng nhập</button>
                        </div>
                    </form>
                    <div class="text-center">
                        <p><a href="#">Quên mật khẩu</a><span style="color: black"> hoặc nếu bạn chưa có tài khoản? </span><a href="register.jsp">Đăng ký tài khoản</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer area-->
<div class="footer-area">
    <div class=" footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="single-footer">
                        <h4 style="color: black; font-weight: 700;">VỀ CHÚNG TÔI</h4>
                        <div class="footer-title-line"></div>
                        <img src="assets/img/footer-logo.png" alt="" class="wow pulse">
                        <p style="color: black; font-weight: bold; font-size: 16px;">CÔNG TY CỔ PHẦN GARO ESTATE VIỆT NAM</p>
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
                    <span><a href="#" style="font-size: 18px;">Copyright © 2023 garoestate.com.vn</a></span>
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
</script>
</body>
</html>
