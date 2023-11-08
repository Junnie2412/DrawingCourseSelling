<%@page import="course.ModuleDAO"%>
<%@page import="course.CourseFeedbackDAO"%>
<%@page import="java.util.List"%>
<%@page import="course.CourseDTO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="users.UserDTO"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <title>ArtCenter - Certificate</title>

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/owl.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link href="assets/css/main2.css" rel="stylesheet" type="text/css"/>

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">

        <style>
            .banner-overlay::before {
                left: 0;
                bottom: 0;
                top: 0;
                right: 0;
                background: rgba(59, 65, 66, 0.5);
            }

            .btn-viewCourse {
                background-color: #ebecec;
                color: black;
                border-radius: 0px;
                padding: 18px 36px;
                display: inline-block;
                font-family: "Lucida Console", Monaco, monospace;
                font-size: 14px;
                letter-spacing: 1px;
                cursor: pointer;
                box-shadow: inset 0 0 0 0 #eacda3;
                -webkit-transition: ease-out 0.4s;
                -moz-transition: ease-out 0.4s;
                transition: ease-out 0.7s;
            }

            .slide_right:hover {
                color: black;
                box-shadow: inset 400px 0 0 0 #eacda3;
            }

            .btn-createAccount {
                background-color: #eacda3;
                color: black;
                border-radius: 0px;
                padding: 18px 36px;
                display: inline-block;
                font-family: "Lucida Console", Monaco, monospace;
                font-size: 14px;
                letter-spacing: 1px;
                cursor: pointer;
                box-shadow: inset 0 0 0 0 #eacda3;
                -webkit-transition: ease-out 0.4s;
                -moz-transition: ease-out 0.4s;
                transition: ease-out 0.7s;
            }

            .slide_right2:hover {
                color: black;
                box-shadow: inset 400px 0 0 0 #ebecec;
            }

            .banner-button-area{
                display: flex;
            }

            .nav-bar{
                width: 100vw;
                background-color: white;
            }

            .bg-banner{
                height: 570px;
            }

            .feature-item {
                border: 2px solid black;
            }

            .feature-item1{
                background-color: rgba(230, 211, 154, 0.1);
            }
        </style>
    </head>


    <body onload="loadPage()">

        <%

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if(loginUser == null)
                loginUser = new UserDTO();
        %>

        <div class="all-sections">
            <!-- ~~~ Loader & Go-Top ~~~ -->
            <div class="overlayer"></div>
            <div class="loader">
                <div class="inner"></div>
            </div>
            <span class="go-top">
                <i class="fas fa-angle-up"></i>
            </span>
            <!-- ~~~ Loader & Go-Top ~~~ -->

            <div class="nav-bar">
                <jsp:include page="layout/header.jsp"/>
            </div>


            <!-- ~~~ Hero Section ~~~ -->
            <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-certificate.avif">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Certificate</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Certificate
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->

            </section>
            <!-- ~~~ Banner Section ~~~ -->

            <!-- ~~~ Footer Section ~~~ -->
            <jsp:include page="layout/footer.jsp"/>
            <!-- ~~~ Footer Section ~~~ -->
        </div>

        <script data-cfasync="false" src="../../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/magnific-popup.min.js"></script>

        <script src="assets/js/odometer.min.js"></script>
        <script src="assets/js/viewport.jquery.js"></script>
        <script src="assets/js/nice-select.js"></script>
        <script src="assets/js/owl.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>

