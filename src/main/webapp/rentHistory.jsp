<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>GARO ESTATE | ...</title>
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

<c:forEach items="${rentHistory}" var="list">
    <div class="card">
        <div class="card-body">
            <a hidden="hidden">${list.rentalId}</a>
            <h5 class="card-title">${list.houseName}</h5>
            <p class="card-text">Ngày Thuê: ${list.rentalDate}</p>
            <p class="card-text">Tổng đơn: ${list.price}</p>
            <p class="card-text">Địa chỉ: ${list.address}</p>
            <p class="card-text">Trạng thái đơn: ${list.status}</p>

            <c:choose>
                <c:when test="${list.status eq 'Đang cho thuê'}">
                    <input type="hidden" name="action" value="cancel">
                    <input type="hidden" name="rentalId" value="${list.rentalId}">
                    <button style="background-color: red; color: white;"><a href="rentalHistory?action=cancel&rentalId=${list.rentalId}" style="text-decoration: none; ">Hủy thuê</a></button>
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="action" value="rentAgain">
                    <input type="hidden" name="rentalId" value="${list.rentalId}">
                    <button style="background-color: #0C9C14; color: black"><a href="rentalHistory?action=rentAgain&rentalId=${list.rentalId}" style="text-decoration: none;">Đã hủy thành công</a></button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</c:forEach>

<div class="footer-area">
  <div class=" footer">
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-sm-6">
          <div class="">
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
</body>
</html>

