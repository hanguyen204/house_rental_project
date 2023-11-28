<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GARO ESTATE | CHO THUÊ NHÀ ĐẤT</title>
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
    <link rel="stylesheet" href="bootstrap/css/style.css">
</head>
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false" id="padding-top-but">
                                    <img src="/assets/img/demo/avata/${sessionScope.urlImage}" alt="Avatar" class="img-circle" id="avatar"><span style="color: black;text-transform: none;"> ${sessionScope.username}</span>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu navbar-nav">
                                    <li><a href="user-profile.jsp">Quản lý thông tin</a></li>
                                    <c:if test="${sessionScope.userType eq 'Landlord'}">
                                        <li><a href="/danh-sach-nha-cua-ban">Quản lý nhà</a></li>

                                        <li><a href="/HouseForRentServlet">Quản lý đặt lịch</a></li>

                                    </c:if>
                                    <c:if test="${sessionScope.userType eq 'Admin'}">
                                        <li><a href="/toggleStatus">Quản lý nguời dùng</a></li>
                                        <li><a href="/landlordlist">Quản lý chủ nhà</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.userType eq 'User'}">
                                        <li><a href="/rentalHistory">Lịch sử thuê nhà</a></li>
                                    </c:if>
                                    <li><a href="change-password.jsp">Thay đổi mật khẩu</a></li>
                                    <li><a href="logout">Đăng xuất</a></li>
                                </ul>
                            </li>
                            <c:if test="${sessionScope.userType eq 'Landlord'}">
                                <button class="navbar-btn nav-button" onclick="redirectToSubmitProperties()">Đăng tin</button>
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
<div class="properties-area recent-property" style="background-color: #FFF;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 padding-top-40 properties-page">
                <div class="section clear">
                    <div id="list-type" class="proerty-th" >
                        <c:forEach var="house" items="${pagedList}">
                            <div class="col-sm-6 col-md-4 p0" style="width: 285px;height: 380px;">
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="/view-house?id=${house.houseId}"><img src="/assets/img/demo/house/${house.imgHouse}"></a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h5><a href="/view-house?id=${house.houseId}" style="letter-spacing: -1px;" id="content"> ${house.houseName}</a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left" style="color: black"><b> Area :</b> ${house.width}m<sup>2</sup> </span>
                                        <c:choose>
                                            <c:when test="${house.price != 'Thảo thuận'}">
                                                <span class="proerty-price pull-right" style="color: black">${house.price}/${house.timeRental}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="proerty-price pull-right" style="color: black">${house.price}</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="property-icon" style="color: black">
                                            <img src="assets/img/icon/bed.png">(${house.numberBed})|
                                            <img src="assets/img/icon/shawer.png">(${house.numberBath})
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
            <div class="col-md-3 pl0 padding-top-40" >
                <div class="blog-asside-right pl0">
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="panel-title" style="font-weight: bold">Mục tìm kiếm</h3>
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
                            <h3 class="panel-title" style="font-weight: bold">Lọc theo giá</h3>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                    <a href="#" style="color: black;font-weight: 500"> 2 - 5 triệu </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                    <a href="#" style="color: black;font-weight: 500"> 5 - 10 triệu </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                    <a href="#" style="color: black;font-weight: 500"> 10 - 50 triệu </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                    <a href="#" style="color: black;font-weight: 500"> 50 - 100 triệu </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                    <a href="#" style="color: black;font-weight: 500"> Thỏa thuận</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="panel-title" style="font-weight: bold">Lọc theo diện tích</h3>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                    <a href="#" style="color: black;font-weight: 500"> 50 - 100m<sup>2</sup></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                    <a href="#" style="color: black;font-weight: 500"> 100 - 300m<sup>2</sup> </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                    <a href="#" style="color: black;font-weight: 500"> 300 - 500m<sup>2</sup> </a>
                                </div>
                            </div>
                        </div>
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
                        <img src="assets/img/footer-logo.png" alt="" class="wow pulse margin-top">
                        <p style="color: black; font-weight: bold; font-size: 16px;" class="padding-bottom-5">CÔNG TY NHÀ ĐẤT GARO ESTATE VIỆT NAM</p>
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
    function formatPrice(price) {
        return (price / 1000000) + " Triệu";
    }

    function redirectToLogin() {
        window.location.href = "login.jsp";
    }

    function redirectToRegister() {
        window.location.href = "register.jsp";
    }

    var contentElement = document.getElementById("content");
    var content = contentElement.textContent.trim();
    var maxLength = 20; // Chiều dài tối đa của mỗi dòng
    var lineCount = 1; // Số dòng tối đa

    var lines = content.split("\n"); // Phân tách đoạn văn thành các dòng
    var truncatedLines = [];

    for (var i = 0; i < lineCount; i++) {
        if (lines[i] && lines[i].length > maxLength) {
            truncatedLines.push(lines[i].substring(0, maxLength) + "...");
        } else {
            truncatedLines.push(lines[i]);
        }
    }

    var truncatedContent = truncatedLines.join("\n");
    contentElement.textContent = truncatedContent;
</script>
</body>
</html>