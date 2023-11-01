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

        <title>ArtCenter - Online Drawing Course</title>

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


    <body>

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


            <!-- ~~~ Banner Section ~~~ -->
            <section class="banner-section banner-overlay bg_img bg-banner" data-img="https://images.unsplash.com/photo-1626243048109-e2ef80ff5b31?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                <div class="container">
                    <div class="banner-content cl-white">
                        <h3 class="subtitle subtitle-banner">Join the drawing course now</h3>
                        <h1 class="title title-banner">course creative</h1>
                        <p>You can learn drawing skills from basic to advanced, by participating in the courses below.</p>

                        <div class="banner-button-area">
                            <%
                                if (loginUser.getRole() == "") {
                            %>
                            <a href="courses.jsp" class=" btn-md btn-viewCourse slide_right">VIEW COURSES <i class="fas fa-play-circle"></i></a>
                            <a href="signup.jsp" class="btn-createAccount slide_right2 btn-md theme-one">CREATE YOUR ACCOUNT <i class="flaticon-tap-1"></i></a>
                                <%
                                } else if (loginUser.getRole().equals("Customer")) {
                                %>
                            <a href="learning.jsp" class=" btn-md btn-viewCourse slide_right"><span style="text-align: center;">LEARNING</span> <i class="fa fa-book" aria-hidden="true"></i></a>
                                <%
                                } else if (loginUser.getRole().equals("Instructor")) {
                                %>
                            <a href="courses.jsp" class=" btn-md btn-viewCourse slide_right">VIEW COURSES <i class="fas fa-play-circle"></i></a>
                                <%
                                    }
                                %>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ Banner Section ~~~ -->

            <!-- ~~~ Feature Section ~~~ -->
            <section class="feature-section pt-120 pb-120" style="background-color: #ebecec">
                <div class="container container-feature">
                    <div class="section-header">

                        <h2 class="title"><span>Our Special</span> Features</h2>
                    </div>
                    <div class="row justify-content-center mb-30-none">
                        <div class="col-xl-3 col-md-6 col-sm-10">
                            <div class="feature-item feature-item1">
                                <div class="icon">
                                    <i class="fas fa-book-reader"></i>
                                </div>
                                <div class="content">
                                    <h6 class="title">Education Services</h6>
                                    <span class="shape"></span>
                                    <p class="fs-sm">Students can have many opportunities to learn and experience many different drawing genres. In addition, we will provide you with a certificate trusted by companies and organizations once you complete each course.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-sm-10">
                            <div class="feature-item">
                                <div class="icon">
                                    <i class="fas fa-laptop-house"></i>
                                </div>
                                <div class="content">
                                    <h6 class="title">Online Class</h6>
                                    <span class="shape"></span>
                                    <p class="fs-sm">To meet the need to learn without going to the school, each course will provide online videos for each student when registering for the course. You can access our website anytime, anywhere as long as you have a learning spirit and are willing to develop your creativity.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-sm-10">
                            <div class="feature-item feature-item1">
                                <div class="icon">
                                    <i class="fas fa-chalkboard-teacher"></i>
                                </div>
                                <div class="content">
                                    <h6 class="title">Expert Mentor</h6>
                                    <span class="shape"></span>
                                    <p class="fs-sm">Students will learn from instructors with degrees from famous art universities across the country. Each instructor will provide interesting lessons.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-sm-10">
                            <div class="feature-item">
                                <div class="icon">
                                    <i class="fas fa-headset"></i>
                                </div>
                                <div class="content">
                                    <h6 class="title">Lifetime Support</h6>
                                    <span class="shape"></span>
                                    <p class="fs-sm">We will serve and support you quickly when you have questions or encounter difficulties in studying. There is also a forum where you can discuss and share useful courses while studying with us.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ Feature Section ~~~ -->


            <!-- ~~~ Course Section ~~~ -->
            <section class="course-section pt-120 pb-120 section-bg oh pos-rel">
                <div class="course-top-shape">
                    <img src="assets/images/course/course-top-shape.png" alt="course">
                </div>
                <div class="course-bottom-shape">
                    <img src="assets/images/course/course-bottom-shape.png" alt="course">
                </div>
                <div class="container">
                    <div class="section-header">

                        <h2 class="title"><span>Featured</span> Online Courses</h2>
                    </div>
                    <div class="row justify-content-center mb-30-none">
                        <%
                            CourseFeedbackDAO courseFeedbackDAO = new CourseFeedbackDAO();
                            ModuleDAO moduleDAO = new ModuleDAO();
                            CourseDAO courseDAO = new CourseDAO();
                            List<CourseDTO> list = courseDAO.getlistCourse("");
                            if (list != null) {
                                if (list.size() > 0) {
                                    for (CourseDTO course : list) {
                        %>
                        <div class="col-xl-4 col-md-6 col-sm-10">
                            <div class="course-item">
                                <div class="thumb">
                                    <a href="course-details.jsp?courseID=<%= course.getCourseID()%>">
                                        <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" alt="course">
                                    </a>
                                </div>
                                <div class="content">
                                    <h5 class="title">
                                        <a href="course-details.jsp?courseID=<%= course.getCourseID()%>"><%= course.getName()%></a>
                                    </h5>
                                    <div class="meta-area">
                                        <div class="meta">
                                            <div class="meta-item">
                                                <i class="fas fa-user"></i>
                                                <span><%= courseDAO.getAccount(course.getCourseID()).getFullName()%></span>
                                            </div>
                                            <div class="meta-item">
                                                <i class="fas fa-photo-video"></i>
                                                <span><%= moduleDAO.getQuantityOfModules(course.getCourseID())%> Modules</span>
                                            </div>
                                            <div class="meta-item">
                                                <i class="fas fa-user-graduate"></i>
                                                <span><%= courseDAO.getDescription(course.getCourseID()).getType()%></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ratings-area">
                                        <div class="ratings cl-theme">
                                            <%
                                                float avgrate = courseFeedbackDAO.getAverageRate(course.getCourseID());
                                                for (int i = 0; i < avgrate; i++) {
                                            %>
                                            <span><i class="fas fa-star"></i></span>
                                                <%
                                                    }
                                                    for (int i = 0; i < (5 - avgrate); i++) {
                                                %>
                                            <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                                <%
                                                    }
                                                %>
                                            <span>(<%= courseFeedbackDAO.getAverageRate(course.getCourseID())%>/5.00)</span>
                                        </div>
                                        <div class="price cl-1">
                                            <%= course.getPrice()%>đ
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>   
                    </div>    
                </div>
            </section>
            <!-- ~~~ Counter Section ~~~ -->


            <!-- ~~~ Instructor Section ~~~ -->
            <section class="instructor-section pt-120 pb-120 gradient-bg">
                <div class="container">
                    <div class="section-header">

                        <h2 class="title"><span>Awesome </span>Instructors</h2>
                    </div>
                    <div class="row justify-content-center mb-30-none">
                        <div class="col-lg-3 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="assets/images/instructor/06.png" alt="instructor"></a>
                                </div>
                                <div class="instructor-content">
                                    <h6 class="title"><a href="#0"> Ngô Khánh Hân
                                        </a></h6>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="assets/images/instructor/07.png" alt="instructor"></a>
                                </div>
                                <div class="instructor-content">
                                    <h6 class="title"><a href="#0"> Hoàng Minh
                                        </a></h6>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="assets/images/instructor/08.png" alt="instructor"></a>
                                </div>
                                <div class="instructor-content">
                                    <h6 class="title"><a href="#0">Minh Khang</a></h6>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="assets/images/instructor/09.png" alt="instructor"></a>
                                </div>
                                <div class="instructor-content">
                                    <h6 class="title"><a href="#0">Hoàng Linh</a></h6>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="text-center load-more mt-5">
                    <a href="instructor.jsp" class="custom-button theme-one">load more Awesome Instructors <i class="fas fa-angle-right"></i></a>
                </div>
            </section>
            <!-- ~~~ Instructor Section ~~~ -->

            <!-- ~~~ Sponsor Section ~~~ -->
            <div class="sponsor-section pb-120">
                <div class="container-fluid">
                    <div class="text-center">
                        <h4 class="title cl-theme">Art Center</h4>
                    </div>
                    <div class="sponsor-slider-wrapper">
                        <div class="sponsor-slider owl-theme owl-carousel">
                            <div class="sponsor-item">
                                <div class="sponsor-inner">
                                    <img src="assets/images/sponsor/01.png" alt="sponsor">
                                </div>
                            </div>
                            <div class="sponsor-item">
                                <div class="sponsor-inner">
                                    <img src="assets/images/sponsor/02.png" alt="sponsor">
                                </div>
                            </div>
                            <div class="sponsor-item">
                                <div class="sponsor-inner">
                                    <img src="assets/images/sponsor/03.png" alt="sponsor">
                                </div>
                            </div>
                            <div class="sponsor-item">
                                <div class="sponsor-inner">
                                    <img src="assets/images/sponsor/04.png" alt="sponsor">
                                </div>
                            </div>
                            <div class="sponsor-item">
                                <div class="sponsor-inner">
                                    <img src="assets/images/sponsor/05.png" alt="sponsor">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ~~~ Sponsor Section ~~~ -->


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