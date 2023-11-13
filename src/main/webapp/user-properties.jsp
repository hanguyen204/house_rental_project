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
    .description {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        max-width: 600px; /* Điều chỉnh độ rộng tối đa của phần mô tả */
    }
    .container-navbar {
        padding-top: 7px;
        margin-left: 5px;
        margin-right: 5px;
    }
    .margin-top {
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .padding-bottom-5 {
        padding-bottom: 5px;
    }
    #padding-top-but {
        padding-top: 8px;
        padding-bottom: 0;
    }
</style>
<body>
<nav class="navbar navbar-default">
    <div class="container-navbar">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/home-page"><img src="assets/img/logo.png" alt=""></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse yamm" id="navigation">
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <div class="button navbar-right">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown ymm-sw">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="padding-top-but">
                                    <img src="${sessionScope.urlImage}" alt="Avatar" class="img-circle" id="avatar"><span style="color: black;text-transform: none;">  ${sessionScope.username}</span>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu navbar-nav">
                                    <li><a href="user-profile.jsp">Quản lý thông tin</a></li>
                                    <c:if test="${sessionScope.userType eq 'Landlord'}">
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
                            <c:if test="${sessionScope.userType eq 'Landlord'}">
                                <button class="navbar-btn nav-button" onclick="">Đăng tin</button>
                            </c:if>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="button navbar-right" style="font-weight: bold;">
                        <button class="navbar-btn nav-button" onclick="redirectToLogin()">Đăng nhập</button>
                        <button class="navbar-btn nav-button login" onclick=" redirectToRegister()">Đăng ký</button>
                    </div>
                </c:otherwise>
            </c:choose>
            <ul class="main-nav nav navbar-nav navbar-left" style="padding-top: 18px">
                <li><a href="/home-page" style="color: black; font-weight: 500;">Trang chủ</a></li>
                <li><a href="/listHouse" style="color: black; font-weight: 500;">Thuê nhà</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- End of nav bar -->

<!-- property area -->
<div class="content-area recent-property" style="background-color: #FFF;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
                <div class="section">
                    <div id="list-type" class="proerty-th-list">
                        <c:forEach items="${pagedList}" var="house">
                            <div class="col-md-4 p0">
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="#" ><img src="${house.imgHouse}"></a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h5><a href="#"> ${house.houseName} </a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left"><b> Area :</b> ${house.width}m<sup>2</sup> </span>
                                        <c:choose>
                                            <c:when test="${house.price != 'Thảo thuận'}">
                                                <span class="proerty-price pull-right">${house.price}/${house.timeRental}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="proerty-price pull-right">${house.price}</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <p style="display: none;" class="description">${house.describeHouse}</p>
                                        <div class="property-icon">
                                            <img src="assets/img/icon/bed.png">(${house.numberBed})|
                                            <img src="assets/img/icon/shawer.png">(${house.numberBath})
                                            <div class="dealer-action pull-right">
                                                <a href="#" class="button">Edit </a>
                                                <a href="#" class="button delete_user_car">Delete</a>
                                                <a href="#" class="button">View</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="section">
                    <div class="pull-right">
                        <div class="pagination">
                            <ul>
                                <li>
                                    <a href="listHouse?page=${currentPage - 1}"
                                       class="${currentPage == 1 ? 'disabled' : ''}">
                                        Prev
                                    </a>
                                </li>
                                <c:forEach var="pageNumber" begin="1" end="${totalPages}">
                                    <li class="${pageNumber == currentPage ? 'active' : ''}">
                                        <a href="listHouse?page=${pageNumber}">
                                                ${pageNumber}
                                        </a>
                                    </li>
                                </c:forEach>
                                <li>
                                    <a href="listHouse?page=${currentPage + 1}"
                                       class="${currentPage == totalPages ? 'disabled' : ''}">
                                        Next
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 pl0 padding-top-40">
                <div class="blog-asside-right pl0">
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="panel-title">Mục tìm kiếm</h3>
                        </div>
                        <div class="panel-body search-widget">
                            <form action="/HomeownerPostedHouse?action=search" method="post" class=" form-inline">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <input class="form-control" type="text" name="houseName"
                                                   placeholder="Nhập tên cần tìm kiếm"
                                                   style="color: black; font-size: 18px;">
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <input class="button btn largesearch-btn" value="Search" type="submit">
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="panel-title">Lọc theo giá</h3>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <a href="#"> 2 - 5 triệu </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <a href="#"> 5 - 10 triệu </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <a href="#"> 10 - 50 triệu </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <a href="#"> 50 - 100 triệu </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <a href="#"> Thỏa thuận</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="panel-title">Lọc theo diện tích nhà</h3>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <a href="#"> 50 - 100m<sup>2</sup></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <a href="#"> 100 - 300m<sup>2</sup> </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox">
                                    <a href="#"> 300 - 500m<sup>2</sup> </a>
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

</body>
</html>
