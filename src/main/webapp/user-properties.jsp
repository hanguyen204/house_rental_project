<%--
  Created by IntelliJ IDEA.
  User: vang
  Date: 30/10/2023
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GARO ESTATE | QUẢN LÝ NHÀ</title>
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
            <div class="button navbar-right" style="font-weight: bold;">
                <c:choose>
                    <c:when test="${not empty sessionScope.username}">
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <img src="${sessionScope.urlImage}" alt="Avatar" class="img-circle" id="avatar">
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" style="margin-top: 0px; margin-right: 200px;">
                                <li><a href="user-profile.jsp">Quản lý thông tin</a></li>
                                <c:if test="${sessionScope.userType eq 'Landlord'}">
                                    <li><a href="#">Quản lý đăng tin</a></li>
                                </c:if>
                                <c:if test="${sessionScope.userType eq 'Admin'}">
                                    <li><a href="/toggleStatus">Quản lý nguời dùng</a></li>
                                    <li><a href="/landlordlist">Quản lý chủ nhà.</a></li>
                                </c:if>
                                <li><a href="change-password.jsp">Thay đổi mật khẩu</a></li>
                                <li><a href="logout">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <button class="navbar-btn nav-button" onclick="redirectToLogin()">Đăng nhập</button>
                        <button class="navbar-btn nav-button login" onclick=" redirectToRegister()">Đăng ký</button>
                    </c:otherwise>
                </c:choose>
            </div>
            <ul class="main-nav nav navbar-nav navbar-left">
                <li><a href="home-page.jsp" style="color: black; font-weight: 500;">Trang chủ</a></li>
                <li><a href="properties.jsp" style="color: black; font-weight: 500;">Nhà đất cho thuê</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- End of nav bar -->

<!-- property area -->
<div class="content-area recent-property" style="background-color: #FFF;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
                <div class="section">
                    <div id="list-type" class="proerty-th-list">
                        <div class="col-md-4 p0">
                            <div class="box-two proerty-item">
                                <div class="item-thumb">
                                    <a href="property-1.html" ><img src="assets/img/demo/property-3.jpg"></a>
                                </div>
                                <div class="item-entry overflow">
                                    <h5><a href="property-1.html"> Super nice villa </a></h5>
                                    <div class="dot-hr"></div>
                                    <span class="pull-left"><b> Area :</b> 120m </span>
                                    <span class="proerty-price pull-right"> $ 300,000</span>
                                    <div class="property-icon">
                                        <img src="assets/img/icon/bed.png">(5)|
                                        <img src="assets/img/icon/shawer.png">(2)
                                        <div class="dealer-action pull-right">
                                            <a href="submit-property.html" class="button">Edit </a>
                                            <a href="#" class="button delete_user_car">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 p0">
                            <div class="box-two proerty-item">
                                <div class="item-thumb">
                                    <a href="property-1.html" ><img src="assets/img/demo/property-2.jpg"></a>
                                </div>
                                <div class="item-entry overflow ">
                                    <h5><a href="property-1.html"> Super nice villa </a></h5>
                                    <div class="dot-hr"></div>
                                    <span class="pull-left"><b> Area :</b> 120m </span>
                                    <span class="proerty-price pull-right"> $ 300,000</span>
                                    <div class="property-icon">
                                        <img src="assets/img/icon/bed.png">(5)|
                                        <img src="assets/img/icon/shawer.png">(2)
                                        <div class="dealer-action pull-right">
                                            <a href="submit-property.html" class="button">Edit </a>
                                            <a href="#" class="button delete_user_car">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 p0">
                            <div class="box-two proerty-item">
                                <div class="item-thumb">
                                    <a href="property-1.html" ><img src="assets/img/demo/property-1.jpg"></a>
                                </div>
                                <div class="item-entry overflow">
                                    <h5><a href="property-1.html"> Super nice villa </a></h5>
                                    <div class="dot-hr"></div>
                                    <span class="pull-left"><b> Area :</b> 120m </span>
                                    <span class="proerty-price pull-right"> $ 300,000</span>
                                    <div class="property-icon">
                                        <img src="assets/img/icon/bed.png">(5)|
                                        <img src="assets/img/icon/shawer.png">(2)
                                        <div class="dealer-action pull-right">
                                            <a href="submit-property.html" class="button">Edit </a>
                                            <a href="#" class="button delete_user_car">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 p0">
                            <div class="box-two proerty-item">
                                <div class="item-thumb">
                                    <a href="property-1.html" ><img src="assets/img/demo/property-3.jpg"></a>
                                </div>
                                <div class="item-entry overflow">
                                    <h5><a href="property-1.html"> Super nice villa </a></h5>
                                    <div class="dot-hr"></div>
                                    <span class="pull-left"><b> Area :</b> 120m </span>
                                    <span class="proerty-price pull-right"> $ 300,000</span>
                                    <div class="property-icon">
                                        <img src="assets/img/icon/bed.png">(5)|
                                        <img src="assets/img/icon/shawer.png">(2)
                                        <div class="dealer-action pull-right">
                                            <a href="submit-property.html" class="button">Edit </a>
                                            <a href="#" class="button delete_user_car">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 p0">
                            <div class="box-two proerty-item">
                                <div class="item-thumb">
                                    <a href="property-1.html" ><img src="assets/img/demo/property-1.jpg"></a>
                                </div>
                                <div class="item-entry overflow">
                                    <h5><a href="property-1.html"> Super nice villa </a></h5>
                                    <div class="dot-hr"></div>
                                    <span class="pull-left"><b> Area :</b> 120m </span>
                                    <span class="proerty-price pull-right"> $ 300,000</span>
                                    <div class="property-icon">
                                        <img src="assets/img/icon/bed.png">(5)|
                                        <img src="assets/img/icon/shawer.png">(2)

                                        <div class="dealer-action pull-right">
                                            <a href="submit-property.html" class="button">Edit </a>
                                            <a href="#" class="button delete_user_car">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 p0">
                            <div class="box-two proerty-item">
                                <div class="item-thumb">
                                    <a href="property-1.html" ><img src="assets/img/demo/property-2.jpg"></a>
                                </div>
                                <div class="item-entry overflow">
                                    <h5><a href="property-1.html"> Super nice villa </a></h5>
                                    <div class="dot-hr"></div>
                                    <span class="pull-left"><b> Area :</b> 120m </span>
                                    <span class="proerty-price pull-right"> $ 300,000</span>
                                    <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                    <div class="property-icon">
                                        <img src="assets/img/icon/bed.png">(5)|
                                        <img src="assets/img/icon/shawer.png">(2)|
                                        <div class="dealer-action pull-right">
                                            <a href="submit-property.html" class="button">Edit </a>
                                            <a href="#" class="button delete_user_car">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 p0">
                            <div class="box-two proerty-item">
                                <div class="item-thumb">
                                    <a href="property-1.html" ><img src="assets/img/demo/property-3.jpg"></a>
                                </div>
                                <div class="item-entry overflow">
                                    <h5><a href="property-1.html"> Super nice villa </a></h5>
                                    <div class="dot-hr"></div>
                                    <span class="pull-left"><b> Area :</b> 120m </span>
                                    <span class="proerty-price pull-right"> $ 300,000</span>
                                    <div class="property-icon">
                                        <img src="assets/img/icon/bed.png">(5)|
                                        <img src="assets/img/icon/shawer.png">(2)
                                        <div class="dealer-action pull-right">
                                            <a href="submit-property.html" class="button">Edit </a>
                                            <a href="#" class="button delete_user_car">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <div class="pull-right">
                        <div class="pagination">
                            <ul>
                                <li><a href="#">Prev</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">Next</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 pl0 padding-top-40">
                <div class="blog-asside-right pl0">
                    <div class="panel panel-default sidebar-menu" >
                        <div class="panel-heading">
                            <h3 class="panel-title">Mục tìm kiếm</h3>
                        </div>
                        <div class="panel-body search-widget">
                            <form action="" class=" form-inline">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" placeholder="Search" style="color: black; font-size: 18px;">
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset >
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <input class="button btn largesearch-btn" value="Search" type="submit">
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu" >
                        <div class="panel-heading">
                            <h3 class="panel-title">Lọc theo giá</h3>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <label><input type="checkbox"> 2 - 5 triệu </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <label><input type="checkbox"> 5 - 10 triệu </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <label><input type="checkbox"> 10 - 50 triệu </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <label><input type="checkbox"> 50 - 100 triệu </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <label><input type="checkbox"> Thỏa thuận</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu" >
                        <div class="panel-heading">
                            <h3 class="panel-title">Lọc theo diện tích nhà</h3>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <label><input type="checkbox"> 50 - 100 m<sup>2</sup></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <label><input type="checkbox"> 100 - 300 m<sup>2</sup> </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <label><input type="checkbox"> 300 - 500 m<sup>2</sup> </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
<script src="assets/js//jquery-1.10.2.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-select.min.js"></script>
<script src="assets/js/bootstrap-hover-dropdown.js"></script>
<script src="assets/js/easypiechart.min.js"></script>
<script src="assets/js/jquery.easypiechart.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/wow.js"></script>
<script src="assets/js/icheck.min.js"></script>

<script src="assets/js/price-range.js"></script>
<script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
<script src="assets/js/jquery.validate.min.js"></script>
<script src="assets/js/wizard.js"></script>

<script src="assets/js/main.js"></script>

</body>
</html>
