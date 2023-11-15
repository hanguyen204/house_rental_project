<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
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
    <style>
        #avatar {
            width: 50px;
        }

        table {
            border-collapse: collapse;
            width: 50%;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        button {
            padding: 5px 10px;
            border: 1px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        button a {
            color: white;
            text-decoration: none;
        }

        button:hover {
            background-color:#45a049;
        }

        th {
            background-color:#b2dba1;
            color: black;
        }

        .item {
            width: 1000px;
            height: 50px;
            margin-left: 425px;
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

        .container {
            margin-top: 10px;
        }
    </style>
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
                                    <img src="${sessionScope.urlImage}" alt="Avatar" class="img-circle"
                                         id="avatar"><span
                                        style="color: black;text-transform: none;"> ${sessionScope.username}</span>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu navbar-nav">
                                    <li><a href="user-profile.jsp">Quản lý thông tin</a></li>
                                    <c:if test="${sessionScope.userType eq 'Landlord'}">
                                        <li><a href="/danh-sach-nha-cua-ban">Quản lý nhà</a></li>
                                        <li><a href="">Quản lý đặt lịch</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.userType eq 'Admin'}">
                                        <li><a href="/toggleStatus">Quản lý nguời dùng</a></li>
                                        <li><a href="/landlordlist">Quản lý chủ nhà</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.userType eq 'User'}">
                                        <li><a href="#">Quản lý thuê nhà</a></li>
                                    </c:if>
                                    <li><a href="change-password.jsp">Thay đổi mật khẩu</a></li>
                                    <li><a href="logout">Đăng xuất</a></li>
                                </ul>
                            </li>
                            <c:if test="${sessionScope.userType eq 'Landlord'}">
                                <button class="navbar-btn nav-button" onclick="redirectToSubmitProperties()">Đăng tin
                                </button>
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
<div class="home-lager-shearch" style="background-color: #FFF;">
    <div class="container padding-bottom-40" style="width: 100%;">
        <div class="col-md-12 large-search">
            <div class="search-form wow pulse">
                <form action="/HouseForRentServlet?action=searchTime" class=" form-inline">
                    <div class="col-md-12" style="height: 40px">
                        <div class="col-md-3">
                            <label style="color: black;">Tìm kiếm</label>
                            <input type="text" class="form-control" value="Tên Tìm Kiếm"
                                   style="color: black; font-size: 14px;">
                        </div>
                        <div class="col-md-3">
                            <label for="startDateTime" style="color: black;">Bắt đầu:</label>
                            <input type="date" id="startDateTime" name="startDateTime" class="form-control"
                                   style="color: black; font-size: 14px;">
                        </div>
                        <div class="col-md-3">
                            <label for="endDateTime" style="color: black;">Kết thúc:</label>
                            <input type="date" id="endDateTime" name="endDateTime" class="form-control"
                                   style="color: black; font-size: 14px;">
                        </div>
                        <div class="col-md-3">
                            <label for="order-status" style="color: black">Trạng Thái</label>
                            <select class="form-control" aria-label="Disabled select example" style="width: 100%; height: 40px; color: black">
                                <option selected style="font-size: xx-small">Trạng Thái</option>
                                <option>Chờ nhận phòng</option>
                                <option>Đang ở</option>
                                <option>Đã trả phòng</option>
                                <option>Đã hủy</option>
                            </select>
                        </div>
                    </div>
                    <div class="center">
                        <input type="submit" value="" class="btn btn-default btn-lg-sheach">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div align="center">
    <table class="table table-success table-striped-columns" style="width: 96%">
        <tr>
            <th>Thời Gian thuê</th>
            <th>Tên Căn Nhà</th>
            <th>Tên Khách Hàng</th>
            <th>Tổng Giá </th>
            <th>Tổng Số Căn</th>
            <th>Trạng Thái</th>
        </tr>
        <c:forEach var="list" items="${list}">
            <tr>
                <td><c:out value="${list.rentalPeriod}"/></td>
                <td><c:out value="${list.houseName}"/></td>
                <td><c:out value="${list.fullName}"/></td>
                <td><c:out value="${list.result}"/></td>
                <td><c:out value="${list.totalHouse}"/></td>
                <td><c:out value="${list.status}"/></td>
                <td>
                    <c:choose>
                        <c:when test="${list.getStatus() == 'Chờ nhận phòng'}">
                            <input type="hidden" name="action" value="inactive">
                            <input type="hidden" name="rentalId" value="${list.rentalId}">
                            <button><a href="HouseForRentServlet?action=checkout&rentalId=${list.rentalId}"
                                       style="text-decoration: none">Checkin</a></button>
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="action" value="active">
                            <input type="hidden" name="rentalId" value="${list.rentalId}">
                            <button><a href="HouseForRentServlet?action=checkin&rentalId=${list.rentalId}"
                                       style="text-decoration: none">Checkout</a></button>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="HouseForRentServlet?page=${currentPage - 1}">Previous</a>
        </c:if>

        <c:forEach var="pageNumber" begin="1" end="${totalPages}">
            <c:choose>
                <%-- Hiển thị trang hiện tại không có link --%>
                <c:when test="${pageNumber == currentPage}">
                    <span>${pageNumber}</span>
                </c:when>
                <%-- Hiển thị các trang khác có link --%>
                <c:otherwise>
                    <a href="HouseForRentServlet?page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="HouseForRentServlet?page=${currentPage + 1}">Next</a>
        </c:if>
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
                        <p style="color: black; font-weight: bold; font-size: 16px;" class="padding-bottom-5">CÔNG TY
                            NHÀ ĐẤT GARO ESTATE VIỆT NAM</p>
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
                            <li><a href="#" style="color: black; font-size: 14px;">Nhà đất cho thuê</a></li>
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
                    <span><a href="http://www.KimaroTec.com"
                             style="font-size: 18px;">Copyright © 2023 garoestate.com.vn</a></span>
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
</body>
</html>