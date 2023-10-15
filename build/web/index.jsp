<%@page import="java.util.List"%>
<%@page import="course.CourseDTO"%>
<%@page import="course.CourseDAO"%>
<!DOCTYPE html>
<%@page import="users.UserDTO"%>
<html lang="en">
    <% 

UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
boolean loggedIn = (loginUser != null);
%>

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
</head>


<body>



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

         <jsp:include page="layout/header.jsp"/>
        

        <div class="sliding-top">
            <img src="https://webdesign-finder.com/html/canabro/images/mask-top-subtract.png" alt="">
        </div>
         
        <!-- ~~~ Banner Section ~~~ -->
        <section class="banner-section banner-overlay bg_img" data-img="assets/images/banner/banner.jpg">
            <div class="container">
                <div class="banner-content cl-white">
                    <h3 class="subtitle">Join the drawing course now</h3>
                    <h1 class="title">course creative</h1>
                    <p>You can learn drawing skills from basic to advanced, by participating in the courses below.</p>
                   
                        <% if (!loggedIn) { %>
                        <div class="banner-button-area">
                        <a href="MainController?action=ViewAllCourses" class="custom-button btn-md">view courses<i class="fas fa-play-circle"></i></a>
                        <a href="signup.jsp" class="custom-button btn-md theme-one">Create your account<i class="flaticon-tap-1"></i></a>
                        <% } else { %><div class="banner-button-area">
                        <a href="MainController?action=ViewAllCourses" class="custom-button btn-md">
                        <span style="text-align: center;">view courses</span>
                        <i class="fas fa-play-circle"></i>
                        </a><% } %>
                    </div>
                </div>
            </div>

        </section>
        <!-- ~~~ Banner Section ~~~ -->
        <div class="sliding-down">
            <img src="https://webdesign-finder.com/html/canabro/images/mask-bottom-subtract.png" alt="">
        </div>

        <!-- ~~~ Feature Section ~~~ -->
        <section class="feature-section pt-120 pb-120">
            <div class="container">
                <div class="section-header">
                    
                    <h2 class="title"><span>Our Special</span> Features</h2>
                </div>
                <div class="row justify-content-center mb-30-none">
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
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
                        <div class="feature-item">
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
                        CourseDAO courseDAO = new CourseDAO();
                        List<CourseDTO> list = (List<CourseDTO>)request.getAttribute("listCourse");
                        if (list != null) {
                        if (list.size() > 0) {
                        for (CourseDTO course : list) {
                    %>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <input type="hidden" value=<%= course.getCourseID() %> name="courseID"/>
                                    <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <input type="hidden" value=<%= course.getCourseID() %> name="courseID"/>
                                    <a href="course-details.jsp"><%= course.getName() %></a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span><%= courseDAO.getAccount(course.getCourseID()).getFullName() %></span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>38 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>20 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        <%= course.getPrice() %>
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