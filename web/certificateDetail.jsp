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
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Allerta Stencil:wght@400&display=swap"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Bonheur Royale:wght@400&display=swap"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Aoboshi One:wght@400&display=swap"
            />
    </head>
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
        .art-center,
        .art-center1 {
            position: absolute;
            top: 115px;
            left: 616px;
            font-size: 35px;
        }
        .art-center1 {
            top: 834px;
            left: 1254px;
            font-size: 40px;
        }
        .congratulations-you-just {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 739px;
            height: 125px;
            flex-shrink: 0;
            opacity: 0.8;
        }
        .certificate-inner,
        .congratulations-you-just-have-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
        }
        .certificate-inner {
            position: absolute;
            top: 557px;
            left: 351px;
        }
        .course-name {
            position: absolute;
            top: 477px;
            left: 450px;
            color: #da745c;
        }
        .has-successfully-complete,
        .users-full-name {
            position: absolute;
            top: 419px;
            left: 400px;
        }
        .users-full-name {
            top: 339px;
            left: 501px;
        }
        .this-certificate-is {
            position: absolute;
            top: 276px;
            left: 445px;
        }
        .course-complete-certificate {
            position: absolute;
            top: 229px;
            left: 242px;
            font-size: 55px;
            line-height: 14px;
            display: inline-block;
            width: 957px;
            height: 16px;
        }
        .certificate-child,
        .certificate-item,
        .date-complete {
            position: absolute;
            top: 665px;
            left: 0;
            width: 322px;
            height: 360px;
        }
        .certificate-item,
        .date-complete {
            top: 0;
            left: 1118px;
        }
        .date-complete {
            top: 170px;
            left: 458px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 521px;
            height: 24px;
            opacity: 0.8;
        }
        .af6033a1b8206f7e3631-1-icon {
            position: absolute;
            top: 878px;
            left: 1265px;
            width: 114px;
            height: 113px;
            object-fit: cover;
        }
        .group-icon,
        .line-icon {
            position: absolute;
            top: 715px;
            left: 656px;
            width: 128px;
            height: 179.2px;
        }
        .line-icon {
            top: 169px;
            left: 584px;
            width: 270px;
            height: 2px;
        }
        .certificate {
            position: relative;
            background-color: #fff;
            width: 100%;
            height: 1025px;
            overflow: hidden;
            text-align: center;
        }


    </style>
</head>


<body>

    <%
        String courseName = (String) request.getAttribute("COURSE_NAME");
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        if (loginUser == null) {
            loginUser = new UserDTO();
        } else if (loginUser.getRole() != "") {
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
        <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-congratulations.avif">

            <div class="custom-container">
                <div class="hero-content">
                    <h1 class="title uppercase cl-white">Congratulations</h1>
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

        <div style="margin-top: 100px; width: 100vw; ">
            <div class="certificate" style="margin: auto; border: 2px solid black; width: 90%; text-align: center">
                <div class="art-center">ART CENTER</div>
                <div class="certificate-inner">
                    <div class="congratulations-you-just-have-wrapper">
                        <div class="congratulations-you-just">
                            Congratulations! You just have finished your learning process and
                            get this certificate. We are really appreciate to your hard-working
                            process for this course! Thank you for believing in our drawing
                            course and we are looking forward to see more your projects in near
                            future!
                        </div>
                    </div>
                </div>
                <div class="course-name" style="font-size: 30px"><%=courseName%></div>
                <div class="has-successfully-complete">
                    has successfully complete drawing course named:
                </div>
                <div class="users-full-name" style="font-size: 30px"><%=loginUser.getFullName()%></div>
                <div class="this-certificate-is">
                    This Certificate is proudly presented to:
                </div>
                <div class="course-complete-certificate">COURSE COMPLETE CERTIFICATE</div>
                <img class="certificate-child" alt="" src="assets/images/background/left-bottom.png" />

                <img class="certificate-item" alt="" src="assets/images/background/right-top.png" />

                <img class="group-icon" alt="" src="assets/images/background/medal.png" />
            </div>
        </div>

        <div>
            <!-- ~~~ Footer Section ~~~ -->
            <jsp:include page="layout/footer.jsp"/>
            <!-- ~~~ Footer Section ~~~ -->
        </div>
    </div>

    <%
        }
    %>

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


