<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: vang
  Date: 30/10/2023
  Time: 00:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GARO ESTATE | property User profile Page </title>
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
    <link href="css/animate.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/icheck.min_all.css">
    <link rel="stylesheet" href="assets/css/price-range.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/owl.theme.css">
    <link rel="stylesheet" href="assets/css/owl.transitions.css">
    <link rel="stylesheet" href="assets/css/wizard.css">
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
                                <c:if test="${userType eq 'Admin'}">
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

                <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="properties.html">Properties</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="property.html">Property</a></li>
                <li class="dropdown yamm-fw" data-wow-delay="0.1s">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Template <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="yamm-content">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h5>Home pages</h5>
                                        <ul>
                                            <li>
                                                <a href="index.html">Home Style 1</a>
                                            </li>
                                            <li>
                                                <a href="index-2.html">Home Style 2</a>
                                            </li>
                                            <li>
                                                <a href="index-3.html">Home Style 3</a>
                                            </li>
                                            <li>
                                                <a href="index-4.html">Home Style 4</a>
                                            </li>
                                            <li>
                                                <a href="index-5.html">Home Style 5</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Pages and blog</h5>
                                        <ul>
                                            <li><a href="blog.html">Blog listing</a>  </li>
                                            <li><a href="single.html">Blog Post (full)</a>  </li>
                                            <li><a href="single-right.html">Blog Post (Right)</a>  </li>
                                            <li><a href="single-left.html">Blog Post (left)</a>  </li>
                                            <li><a href="contact.html">Contact style (1)</a> </li>
                                            <li><a href="contact-3.html">Contact style (2)</a> </li>
                                            <li><a href="contact_3.html">Contact style (3)</a> </li>
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
                            <!-- /.yamm-content -->
                        </li>
                    </ul>
                </li>

                <li class="wow fadeInDown" data-wow-delay="0.4s"><a href="contact.html">Contact</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- End of nav bar -->

<div class="page-head">
    <div class="container">
        <div class="row">
            <div class="page-head-content">
                <h1 class="page-title">Hello : <span class="orange strong">${username}</span></h1>
            </div>
        </div>
    </div>
</div>
<!-- End page header -->

<!-- property area -->
<div class="content-area user-profiel" style="background-color: #FCFCFC;">&nbsp;
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1 profiel-container">

                <form action="/update-profile" method="post">
                    <div class="profiel-header">
                        <h3>
                            <b>BUILD</b> YOUR PROFILE <br>
                            <small>This information will let us know more about you.</small>
                        </h3>
                        <hr>
                    </div>

                    <div class="clear">
                        <div class="col-sm-3 col-sm-offset-1">
                            <div class="picture-container">
                                <div class="picture">
                                    <img src="${urlImage}" class="picture-src" id="wizardPicturePreview" name="urlImage"/>
                                    <input type="file" id="wizard-picture">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3 padding-top-25">
                            <div class="form-group">
                                <label>User name: ${username}</label>
                            </div>
                            <div class="form-group">
                                <label>Full Name <small>(required)</small></label>
                                <input name="fullName" type="text" class="form-control" placeholder="Andrew..." value="<c:out value='${fullname}' />">
                            </div>
                            <div class="form-group">
                                <label>phone <small>(required)</small></label>
                                <input name="phone" type="text" class="form-control" placeholder="0999..." value="<c:out value='${phone}' />">
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="address" type="text" class="form-control" value="<c:out value='${address}' />">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-5 col-sm-offset-1">
                        <div class="form-group">
                            <span>${error}</span>
                        </div>
                        <br>
                        <input type='submit' class='btn btn-finish btn-primary' name='finish' value='Finish' />
                    </div>
                    <br>
                </form>

            </div>
        </div><!-- end row -->

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
<%--                <div class="col-md-3 col-sm-6 wow fadeInRight animated">--%>
<%--                    <div class="single-footer">--%>
<%--                        <h4>Quick links </h4>--%>
<%--                        <div class="footer-title-line"></div>--%>
<%--                        <ul class="footer-menu">--%>
<%--                            <li><a href="properties.html">Properties</a>  </li>--%>
<%--                            <li><a href="#">Services</a>  </li>--%>
<%--                            <li><a href="submit-property.html">Submit property </a></li>--%>
<%--                            <li><a href="contact.html">Contact us</a></li>--%>
<%--                            <li><a href="faq.html">fqa</a>  </li>--%>
<%--                            <li><a href="faq.html">Terms </a>  </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>
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
                                    <h6> <a href="single.html">Add news functions </a></h6>
                                    <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla ...</p>
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
                                    <h6> <a href="single.html">Add news functions </a></h6>
                                    <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla ...</p>
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
                                    <h6> <a href="single.html">Add news functions </a></h6>
                                    <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla ...</p>
                                </div>
                            </li>


                        </ul>
                    </div>
                </div>
<%--                <div class="col-md-3 col-sm-6 wow fadeInRight animated">--%>
<%--                    <div class="single-footer news-letter">--%>
<%--                        <h4>Stay in touch</h4>--%>
<%--                        <div class="footer-title-line"></div>--%>
<%--                        <p>Lorem ipsum dolor sit amet, nulla  suscipit similique quisquam molestias. Vel unde, blanditiis.</p>--%>

<%--                        <form>--%>
<%--                            <div class="input-group">--%>
<%--                                <input class="form-control" type="text" placeholder="E-mail ... ">--%>
<%--                                <span class="input-group-btn">--%>
<%--                                            <button class="btn btn-primary subscribe" type="button"><i class="pe-7s-paper-plane pe-2x"></i></button>--%>
<%--                                        </span>--%>
<%--                            </div>--%>
<%--                            <!-- /input-group -->--%>
<%--                        </form>--%>

<%--                        <div class="social pull-right">--%>
<%--                            <ul>--%>
<%--                                <li><a class="wow fadeInUp animated" href="https://twitter.com/kimarotec"><i class="fa fa-twitter"></i></a></li>--%>
<%--                                <li><a class="wow fadeInUp animated" href="https://www.facebook.com/kimarotec" data-wow-delay="0.2s"><i class="fa fa-facebook"></i></a></li>--%>
<%--                                <li><a class="wow fadeInUp animated" href="https://plus.google.com/kimarotec" data-wow-delay="0.3s"><i class="fa fa-google-plus"></i></a></li>--%>
<%--                                <li><a class="wow fadeInUp animated" href="https://instagram.com/kimarotec" data-wow-delay="0.4s"><i class="fa fa-instagram"></i></a></li>--%>
<%--                                <li><a class="wow fadeInUp animated" href="https://instagram.com/kimarotec" data-wow-delay="0.6s"><i class="fa fa-dribbble"></i></a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

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
