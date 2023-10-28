<%-- 
    Document   : about
    Created on : Sep 25, 2023, 8:30:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <link rel="stylesheet" href="assets/css/main2.css">

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">

        <style>
            .feature-item1 {
                height: 470px;
                background-color: #eacda3;
            }
            
            .feature-item {
                height: 470px;
            }

            .nav-bar{
                width: 100vw;
                background-color: white;
            }
            
            .banner-overlay::before {
                left: 0;
                bottom: 0;
                top: 0;
                right: 0;
                background: rgba(59, 65, 66, 0.5);
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



        <div class="all-sections oh">
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
            <section class="hero-section banner-overlay bg_img" data-img="https://images.unsplash.com/photo-1628359355624-855775b5c9c4?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">About</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                About
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->


            <!-- ~~~ Feature Section ~~~ -->
            <section class="feature-section pt-120 pb-120" style="background-color: #ebecec">
                <div class="container">
                    <div class="section-header">
                        <span class="category">Features</span>
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
                                    <h6 class="title">Online/Offline Class</h6>
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
                                    <p class="fs-sm">Students will learn from instructors with degrees from famous art universities across the country. Each instructor will provide interesting lessons, from basic to advanced, in every drawing genre you have registered for.
                                    </p>
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
                                    <p class="fs-sm">We will serve and support you quickly when you have questions or encounter difficulties in studying. There is also a forum where you can discuss and share useful courses while studying with us.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ Feature Section ~~~ -->


            <!-- ~~~ About Section ~~~ -->
            <section class="about-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 align-self-end d-none d-lg-block">
                            <div class="about-thumb rtl">
                                <img src="" alt="about">
                            </div>
                        </div>
                        <div class="col-lg-6 pb-120">
                            <div class="section-header text-lg-left mb-0">
                                <h2 class="title"><span>Read </span>About Us</h2>
                                <p>Art Center is the first professional online drawing center in Vietnam specializing in online drawing lessons: learning to draw portraits, learning to draw for exams.

                                    With a team of teachers with over 13 years of experience and well-trained training, we have taught drawing online to thousands of domestic and international students, creating opportunities for those who are already married to continue their passion for drawing. Families, working people who don't have much free time, and students living far from the center who don't have to brave rain and shine to go to drawing class still have enough knowledge to take the exam to get into their favorite Architecture - Fine Arts school..</p>
                                <p>The way to learn to draw online is completely similar to learning to draw in person, but has been modified to suit the online format. Students progress through practicing drawing according to a certain process including many exercises. Each exercise will train students in one or more certain skills.</p>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ About Section ~~~ -->


            <!-- ~~~ Counter Section ~~~ -->



            <!-- ~~~ Testimonial Section ~~~ -->

            <!-- ~~~ Testimonial Section ~~~ -->


            <!-- ~~~ Instructor Section ~~~ -->
            <section class="instructor-section pt-120 pb-120 gradient-bg">
                <div class="container">
                    <div class="section-header">
                        <span class="category">our teachers</span>
                        <h2 class="title"><span>Awesome </span>Instructors</h2>
                    </div>
                    <div class="row justify-content-center mb-30-none">
                        <div class="col-lg-3 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="assets/images/instructor/1.png" alt="instructor"></a>
                                </div>
                                <div class="instructor-content">
                                    <h6 class="title"><a href="#0">GIA BẢO</a></h6>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="assets/images/instructor/02.png" alt="instructor"></a>
                                </div>
                                <div class="instructor-content">
                                    <h6 class="title"><a href="#0">NHẬT THÁI</a></h6>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="assets/images/instructor/03.png" alt="instructor"></a>
                                </div>
                                <div class="instructor-content">
                                    <h6 class="title"><a href="#0">BÁ HUÂN</a></h6>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="assets/images/instructor/04.png" alt="instructor"></a>
                                </div>
                                <div class="instructor-content">
                                    <h6 class="title"><a href="#0">NAM ĐY</a></h6>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ Instructor Section ~~~ -->


            <!-- ~~~ Blog Section ~~~ -->

            <!-- ~~~ Blog Section ~~~ -->

            <jsp:include page="layout/footer.jsp"/>

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
