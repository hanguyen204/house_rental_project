<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GARO ESTATE | ĐĂNG TIN CHO THUÊ</title>
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
            <a class="navbar-brand" href="home-page.jsp"><img src="assets/img/logo.png" alt=""></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse yamm" id="navigation">
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li class="dropdown ymm-sw">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">
                                <img src="${sessionScope.urlImage}" alt="Avatar" class="img-circle" id="avatar"><span
                                    style="color: black;"> ${sessionScope.username}</span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu navbar-nav">
                                <li><a href="user-profile.jsp">Quản lý thông tin</a></li>
                                <c:if test="${sessionScope.userType eq 'Landlord'}">
                                    <li><a href="#">Quản lý đăng tin</a></li>
                                    <li><a href="#">Quản lý nhà</a></li>
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
                <li><a href="home-page.jsp" style="color: black; font-weight: 500;">Trang chủ</a></li>
                <li><a href="/listHouse" style="color: black; font-weight: 500;">Nhà đất cho thuê</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- End of nav bar -->

<div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp;
    <div class="container">
        <div class="clearfix" >
            <div class="wizard-container">
                <div class="wizard-card ct-wizard-orange" id="wizardProperty">
                    <form action="/submit-property" method="post">
                        <div class="wizard-header" style="color: black; text-align: center">
                            <h3>
                                <b>SUBMIT</b> YOUR PROPERTY <br>
                                <br>
                            </h3>
                        </div>
                        <div class="tab-pane">
                            <div class="row p-b-15  ">
                                <div class="col-sm-3 col-sm-offset-1">
                                    <div class="picture-container">
                                        <div class="picture">
                                            <input type="file" id="wizard-picture" name="image" accept="image/jpeg, image/png" onchange="previewImage(event)">
                                            <img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label style="color: black">Tên căn nhà</label>
                                        <input name="houseName" type="text" class="form-control" placeholder="Super villa ..." style="color: black; font-size: 16px; border: 1px black inset;">
                                    </div>
                                    <div class="form-group">
                                        <label style="color: black">Địa chỉ</label>
                                        <input name="address" type="text" class="form-control" placeholder="" style="color: black; font-size: 16px; border: 1px black inset;">
                                    </div>
                                    <div class="form-group">
                                        <label style="color: black">Số lượng phòng ngủ</label>
                                        <input type="number" style="border: 1px black inset; color: black;" min="1" max="10" name="bedrooms">
                                    </div>
                                    <div class="form-group">
                                        <label style="color: black">Số lượng phòng tắm</label>
                                        <input type="number" style="border: 1px black inset; color: black;" min="1" max="3" name="bathrooms">
                                    </div>
                                    <div class="form-group">
                                        <label style="color: black">Diện tích nhà (m2)</label>
                                        <input type="text" style="color: black; font-size: 16px; border: 1px black inset;" name="width">
                                    </div>
                                    <div class="form-group">
                                        <label style="color: black">Giá tiền (VNĐ)</label>
                                        <input name="price" type="text" class="form-control" placeholder="3330000" style="color: black; font-size: 16px; border: 1px black inset;">
                                    </div>
                                    <div class="form-group">
                                        <div class="checkbox">
                                            <label><input type="checkbox" name="day" style="color: black; font-size: 16px;"> Ngày</label>
                                            <label><input type="checkbox" name="month" style="color: black; font-size: 16px;"> Tháng</label>
                                            <label><input type="checkbox" name="year" style="color: black; font-size: 16px;"> Năm</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Mô tả chung</label>
                                        <textarea name="description" class="form-control" style="border: 1px black inset;"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-footer">
                            <div class="pull-right">
                                <input type='button' class='btn btn-default' name='finish' value='Finish'/>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
                <!-- End submit form -->
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
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function() {
            var output = document.getElementById('wizardPicturePreview');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
</body>
</html>