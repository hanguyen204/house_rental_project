<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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
  <%--    <link rel="stylesheet" href="assets/css/owl.theme.css">--%>
  <link rel="stylesheet" href="assets/css/owl.transitions.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/responsive.css"></head>
<style>
  #avatar {
    width: 50px;
  }

  .item {
    width: 900px;
    height: 290px;
    margin-left: 475px;
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
                    <li><a href="/rentalHistory">Quản lý nhà</a></li>
                    <li><a href="/HouseForRentServlet">Quản lý đặt lịch</a></li>
                  </c:if>
                  <c:if test="${sessionScope.userType eq 'Admin'}">
                    <li><a href="/toggleStatus">Quản lý nguời dùng</a></li>
                    <li><a href="/landlordlist">Quản lý chủ nhà</a></li>
                  </c:if>
                  <c:if test="${sessionScope.userType eq 'User'}">
                    <li><a href="/rentalHistory">Quản lý thuê nhà</a></li>
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
          <button style="background-color: #0C9C14; color: black"><a href="rentalHistory?action=rentAgain&rentalId=${list.rentalId}" style="text-decoration: none;">Thuê lại</a></button>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</c:forEach>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 17/11/2023
  Time: 1:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</head>
<body>
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
                <button style="background-color: #0C9C14; color: black"><a href="rentalHistory?action=rentAgain&rentalId=${list.rentalId}" style="text-decoration: none;">Thuê lại</a></button>
            </c:otherwise>
        </c:choose>

<%--        <button class="btn btn-danger" id="cancel-btn" ><a href="rentalHistory?action=cancel&rentalId=${list.rentalId}" style="text-decoration: none;">Hủy thuê</a></button>--%>
    </div>
</div>
</c:forEach>

</body>
</html>

