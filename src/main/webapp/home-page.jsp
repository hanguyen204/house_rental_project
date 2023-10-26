<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vang
  Date: 25/10/2023
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GARO ESTATE | Home page</title>
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
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>
<!-- Body content -->

<nav class="navbar navbar-default ">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="home-page.jsp"><img src="assets/img/logo.png" alt=""></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse yamm" id="navigation">
            <div class="button navbar-right">
                <c:choose>
                    <c:when test="${not empty username}">
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <img src="${urlImage}" alt="Avatar" class="img-circle" id="avatar">
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
                        <button class="navbar-btn nav-button wow bounceInRight login"
                                onclick=" window.open('login.jsp')" data-wow-delay="0.45s">SIGN IN
                        </button>
                        <button class="navbar-btn nav-button wow bounceInRight login"
                                onclick=" window.open('register.jsp')" data-wow-delay="0.45s">SIGN UP
                        </button>
                    </c:otherwise>
                </c:choose>
            </div>
            <ul class="main-nav nav navbar-nav navbar-right">
                <li class="dropdown ymm-sw " data-wow-delay="0.1s">
                    <a href="home-page.jsp" class="dropdown-toggle active" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Home</a>
                </li>
                <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="properties.jsp">Properties</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.3s"><a class="" href="property.html">Property</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.5s"><a href="contact.html">Contact</a></li>
                <li class="dropdown yamm-fw" data-wow-delay="0.4s">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Template <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <div class="yamm-content">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h5>Home pages</h5>
                                    <ul>
                                        <li>
                                            <a href="home-page.jsp">Home</a>
                                        </li>
                                    </ul>
                                    <h5>Pages and blog</h5>
                                    <ul>
                                        <li><a href="blog.html">Blog listing</a>  </li>
                                        <li><a href="contact.html">Contact style</a> </li>
                                        <li><a href="faq.html">FAQ page</a> </li>
                                        <li><a href="404.html">404 page</a>  </li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h5>Property</h5>
                                    <ul>
                                        <li><a href="property-1.html">Property pages style (1)</a> </li>
                                        <li><a href="property-2.html">Property pages style (2)</a> </li>
                                        <li><a href="property-3.html">Property pages style (3)</a> </li>
                                    </ul>

                                    <h5>Properties list</h5>
                                    <ul>
                                        <li><a href="properties.html">Properties list style (1)</a> </li>
                                        <li><a href="properties-2.html">Properties list style (2)</a> </li>
                                        <li><a href="properties-3.html">Properties list style (3)</a> </li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h5>Property process</h5>
                                    <ul>
                                        <li><a href="submit-property.html">Submit - step 1</a> </li>
                                        <li><a href="submit-property.html">Submit - step 2</a> </li>
                                        <li><a href="submit-property.html">Submit - step 3</a> </li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h5>User account</h5>
                                    <ul>
                                        <li><a href="register.html">Register / login</a>   </li>
                                        <li><a href="user-properties.html">Your properties</a>  </li>
                                        <li><a href="submit-property.html">Submit property</a>  </li>
                                        <li><a href="change-password.html">Change password</a> </li>
                                        <li><a href="user-profile.html">Your profile</a>  </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- End of nav bar -->

<div class="slider-area">
    <div class="slider">
        <div id="bg-slider" class="owl-carousel owl-theme">

            <div class="item"><img src="assets/img/slide1/slider-image-1.jpg" alt="GTA V"></div>
            <div class="item"><img src="assets/img/slide1/slider-image-2.jpg" alt="The Last of us"></div>
            <div class="item"><img src="assets/img/slide1/slider-image-1.jpg" alt="GTA V"></div>

        </div>
    </div>
    <div class="slider-content">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                <h2>Searching For a House To Rent Is Easy</h2>
                <p>That's right! Welcome to us where everyone can rent satisfactory and high quality houses</p>
                <div class="search-form wow pulse" data-wow-delay="0.8s">
                    <form action="" class=" form-inline">
                        <button class="btn  toggle-btn" type="button"><i class="fa fa-bars"></i></button>

                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Key word">
                        </div>
                        <div class="form-group">
                            <select id="lunchBegins" class="selectpicker" data-live-search="true"
                                    data-live-search-style="begins" title="Select your city">

                                <option>Hà Nội</option>
                                <option>Hồ Chí Minh</option>
                                <option>Đà Nẵng</option>
                                <option>Đà Lạt</option>
                                <option>Nha Trang</option>
                                <option>Nam Định</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select id="basic" class="selectpicker show-tick form-control" title="Select status">
                                <option>Rent</option>
                                <option>Sale</option>
                            </select>
                        </div>
                        <button class="btn search-btn" type="submit"><i class="fa fa-search"></i></button>

                        <div style="display: none;" class="search-toggle">

                            <div class="search-row">

                                <div class="form-group mar-r-20">
                                    <label for="price-range">Price range ($):</label>
                                    <input type="text" class="span2" value="" data-slider-min="0"
                                           data-slider-max="600" data-slider-step="5"
                                           data-slider-value="[0,300]" id="price-range"><br/>
                                    <b class="pull-left color">2000$</b>
                                    <b class="pull-right color">100000$</b>
                                </div>
                                <!-- End of  -->

                                <div class="form-group mar-l-20">
                                    <label for="property-geo">Property geo (m2) :</label>
                                    <input type="text" class="span2" value="" data-slider-min="0"
                                           data-slider-max="600" data-slider-step="5"
                                           data-slider-value="[0,300]" id="property-geo"><br/>
                                    <b class="pull-left color">40m</b>
                                    <b class="pull-right color">1200m</b>
                                </div>
                                <!-- End of  -->
                            </div>

                            <!-- <div class="search-row"> -->

                            <!-- <div class="form-group mar-r-20">
                                <label for="price-range">Min baths :</label>
                                <input type="text" class="span2" value="" data-slider-min="0"
                                       data-slider-max="600" data-slider-step="5"
                                       data-slider-value="[250,450]" id="min-baths" ><br />
                                <b class="pull-left color">1</b>
                                <b class="pull-right color">120</b>
                            </div> -->
                            <!-- End of  -->

                            <!-- <div class="form-group mar-l-20">
                                <label for="property-geo">Min bed :</label>
                                <input type="text" class="span2" value="" data-slider-min="0"
                                       data-slider-max="600" data-slider-step="5"
                                       data-slider-value="[250,450]" id="min-bed" ><br />
                                <b class="pull-left color">1</b>
                                <b class="pull-right color">120</b>
                            </div> -->
                            <!-- End of  -->

                            <!-- </div> -->
                            <!-- <br> -->
                            <!-- <div class="search-row">   -->
                            <!-- <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Fire Place(3100)
                                    </label>
                                </div>
                            </div> -->
                            <!-- End of  -->

                            <!-- <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Dual Sinks(500)
                                    </label>
                                </div>
                            </div> -->
                            <!-- End of  -->

                            <!-- <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Hurricane Shutters(99)
                                    </label>
                                </div>
                            </div> -->
                            <!-- End of  -->
                            <!-- </div> -->

                            <!-- <div class="search-row">

                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Swimming Pool(1190)
                                        </label>
                                    </div>
                                </div> -->
                            <!-- End of  -->

                            <!-- <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> 2 Stories(4600)
                                    </label>
                                </div>
                            </div> -->
                            <!-- End of  -->

                            <!-- <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Emergency Exit(200)
                                    </label>
                                </div>
                            </div> -->
                            <!-- End of  -->
                            <!--</div>-->

                            <!-- <div class="search-row">

                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Laundry Room(10073)
                                        </label>
                                    </div>
                                </div> -->
                            <!-- End of  -->

                            <!-- <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Jog Path(1503)
                                    </label>
                                </div>
                            </div> -->
                            <!-- End of  -->

                            <!-- <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> 26' Ceilings(1200)
                                    </label>
                                </div>
                            </div> -->
                            <!-- End of  -->
                            <!-- <br> -->
                            <!-- <hr> -->
                        </div>
                        </button>
                    </form>
                </div>
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
                <h2>Top submitted property</h2>
            </div>
        </div>
        <br>

        <div class="row">
            <div class="proerty-th">
                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-1.html"><img src="assets/img/demo/property-1.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-1.html">Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-2.html"><img src="assets/img/demo/property-2.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-2.html">Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-3.html"><img src="assets/img/demo/property-3.jpg"></a>

                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-3.html">Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-1.html"><img src="assets/img/demo/property-4.jpg"></a>

                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-1.html">Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>


                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-3.html"><img src="assets/img/demo/property-2.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-3.html">Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-2.html"><img src="assets/img/demo/property-4.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-2.html">Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-1.html"><img src="assets/img/demo/property-3.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-1.html">Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5><a href="property-1.html">CAN'T DECIDE ? </a></h5>
                            <h5 class="tree-sub-ttl">Show all properties</h5>
                            <button class="btn border-btn more-black" value="All properties">All properties</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- Count area -->
<div class="count-area">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                <!-- /.feature title -->
                <h2>You can trust Us </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-xs-12 percent-blocks m-main" data-waypoint-scroll="true">
                <div class="row">
                    <div class="col-sm-3 col-xs-6">
                        <div class="count-item">
                            <div class="count-item-circle">
                                <span class="pe-7s-users"></span>
                            </div>
                            <div class="chart" data-percent="5000">
                                <h2 class="percent" id="counter">0</h2>
                                <h5>HAPPY CUSTOMER </h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <div class="count-item">
                            <div class="count-item-circle">
                                <span class="pe-7s-home"></span>
                            </div>
                            <div class="chart" data-percent="12000">
                                <h2 class="percent" id="counter1">0</h2>
                                <h5>Properties in stock</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <div class="count-item">
                            <div class="count-item-circle">
                                <span class="pe-7s-flag"></span>
                            </div>
                            <div class="chart" data-percent="120">
                                <h2 class="percent" id="counter2">0</h2>
                                <h5>City registered </h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <div class="count-item">
                            <div class="count-item-circle">
                                <span class="pe-7s-graph2"></span>
                            </div>
                            <div class="chart" data-percent="5000">
                                <h2 class="percent" id="counter3">5000</h2>
                                <h5>DEALER BRANCHES</h5>
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

                <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                    <div class="single-footer">
                        <h4>About us </h4>
                        <div class="footer-title-line"></div>

                        <img src="assets/img/footer-logo.png" alt="" class="wow pulse" data-wow-delay="1s">
                        <p>Lorem ipsum dolor cum necessitatibus su quisquam molestias. Vel unde, blanditiis.</p>
                        <ul class="footer-adress">
                            <li><i class="pe-7s-map-marker strong"> </i> 9089 your adress her</li>
                            <li><i class="pe-7s-mail strong"> </i> email@yourcompany.com</li>
                            <li><i class="pe-7s-call strong"> </i> +1 908 967 5906</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                    <div class="single-footer">
                        <h4>Quick links </h4>
                        <div class="footer-title-line"></div>
                        <ul class="footer-menu">
                            <li><a href="properties.html">Properties</a>  </li>
                            <li><a href="#">Services</a>  </li>
                            <li><a href="submit-property.html">Submit property </a></li>
                            <li><a href="contact.html">Contact us</a></li>
                            <li><a href="faq.html">fqa</a>  </li>
                            <li><a href="faq.html">Terms </a>  </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                    <div class="single-footer">
                        <h4>Last News</h4>
                        <div class="footer-title-line"></div>
                        <ul class="footer-blog">
                            <li>
                                <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                    <a href="single.html">
                                        <img src="assets/img/demo/small-proerty-2.jpg">
                                    </a>
                                    <span class="blg-date">12-12-2016</span>

                                </div>
                                <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                    <h6><a href="single.html">Add news functions </a></h6>
                                    <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla
                                        ...</p>
                                </div>
                            </li>

                            <li>
                                <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                    <a href="single.html">
                                        <img src="assets/img/demo/small-proerty-2.jpg">
                                    </a>
                                    <span class="blg-date">12-12-2016</span>

                                </div>
                                <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                    <h6><a href="single.html">Add news functions </a></h6>
                                    <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla
                                        ...</p>
                                </div>
                            </li>

                            <li>
                                <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                    <a href="single.html">
                                        <img src="assets/img/demo/small-proerty-2.jpg">
                                    </a>
                                    <span class="blg-date">12-12-2016</span>

                                </div>
                                <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                    <h6><a href="single.html">Add news functions </a></h6>
                                    <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla
                                        ...</p>
                                </div>
                            </li>


                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                    <div class="single-footer news-letter">
                        <h4>Stay in touch</h4>
                        <div class="footer-title-line"></div>
                        <p>Lorem ipsum dolor sit amet, nulla  suscipit similique quisquam molestias. Vel unde, blanditiis.</p>

                        <form>
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="E-mail ... ">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary subscribe" type="button"><i class="pe-7s-paper-plane pe-2x"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-copy text-center">
        <div class="container">
            <div class="row">
                <div class="pull-left">
                    <span> (C) <a href="http://www.KimaroTec.com">KimaroTheme</a> , All rights reserved 2016  </span>
                </div>
                <div class="bottom-menu pull-right">
                    <ul>
                        <li><a class="wow fadeInUp animated" href="#" data-wow-delay="0.2s">Home</a></li>
                        <li><a class="wow fadeInUp animated" href="#" data-wow-delay="0.3s">Property</a></li>
                        <li><a class="wow fadeInUp animated" href="#" data-wow-delay="0.4s">Faq</a></li>
                        <li><a class="wow fadeInUp animated" href="#" data-wow-delay="0.6s">Contact</a></li>
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
    function showMenu() {
        document.getElementById("userMenu").style.display = "block";
    }

    function hideMenu() {
        document.getElementById("userMenu").style.display = "hide";
    }
</script>
</body>
</html>
