<%-- 
    Document   : course-details
    Created on : Sep 25, 2023, 8:33:54 AM
    Author     : Admin
--%>

<%@page import="course.CourseFeedbackDTO"%>
<%@page import="java.util.List"%>
<%@page import="users.ProfileDAO"%>
<%@page import="cart.CartDAO"%>
<%@page import="users.UserDTO"%>
<%@page import="course.QuizDAO"%>
<%@page import="course.VideoDAO"%>
<%@page import="course.LessonDAO"%>
<%@page import="course.ModuleDAO"%>
<%@page import="course.CourseFeedbackDAO"%>
<%@page import="course.CourseDTO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

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
    </head>
    <jsp:include page="layout/header.jsp"/>

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





            <!-- ~~~ Hero Section ~~~ -->
            <section class="hero-section banner-overlay bg_img" data-img="https://images.unsplash.com/photo-1614278390641-835b276fab2c?auto=format&fit=crop&q=80&w=1480&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Course Details</h1>
                        <ul class="breadcrumb cl-white p-0 m-0 bg-transparent">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Course Details
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->

            <%
                ProfileDAO profileDAO = new ProfileDAO();
                CourseFeedbackDAO courseFeedbackDAO = new CourseFeedbackDAO();
                ModuleDAO moduleDAO = new ModuleDAO();
                LessonDAO lessonDAO = new LessonDAO();
                VideoDAO videoDAO = new VideoDAO();
                QuizDAO quizDAO = new QuizDAO();
                CourseDAO courseDAO = new CourseDAO();
                String courseID = request.getParameter("courseID");
                CourseDTO course = courseDAO.getCourseByCourseID(courseID);
            %>

            <!-- ~~~ Course Section ~~~ -->
            <section class="course-details-section pt-120 pb-120">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <form action="MainController" method="POST">
                                <div class="course-video-area mb-lg-0">
                                    <div class="video-area bg_img" data-img="assets/images/course/Thumnail-video-course-detail.jpg">
                                        <a href="<%= videoDAO.getLastestVideoByCourseID(course.getCourseID()).getContent()%>" class="magnific_popup video-button"><i class="flaticon-play-button-inside-a-circle"></i></a>
                                    </div>
                                    <div class="course-video-content">
                                        <h6 class="title"><%= course.getName()%></h6>
                                        <div class="ratings cl-theme">
                                            <%
                                                float avgrate = courseFeedbackDAO.getAverageRate(courseID);
                                                for (int i = 0; i < avgrate; i++){
                                            %>
                                                <span><i class="fas fa-star"></i></span>
                                            <%
                                                }
                                                for (int i = 0; i < (5 - avgrate); i++){
                                            %>
                                                    <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                            <%    
                                                }
                                            %>
                                            <span>(<%= courseFeedbackDAO.getAverageRate(course.getCourseID())%>/5.00)</span>
                                        </div>
                                        <ul class="course-infos">
                                            <li>
                                                <span><i class="fas fa-play-circle"></i>Total Lessons</span><span><%= lessonDAO.getTotalLessons(course.getCourseID())%></span>
                                            </li>
                                            <li>
                                                <span><i class="fas fa-clock"></i>Duration</span><span><%= course.getDuration()%> minutes</span>
                                            </li>
                                            <li>
                                                <span><i class="fas fa-brain"></i>Quizzes</span><span><%= quizDAO.getTotalOfQuizzes(course.getCourseID())%></span>
                                            </li>
                                            <li>
                                                <span><i class="fas fa-puzzle-piece"></i>Skill Level</span><span><%= courseDAO.getDescription(course.getCourseID()).getLevel()%></span>
                                            </li>
                                            <li>
                                                <span><i class="fas fa-certificate"></i>Certificate</span><span>No</span>
                                            </li>
                                        </ul>
                                        <div>
                                            <%
                                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                                if (loginUser == null) {
                                            %>
                                            <button class="custom-button theme-one rounded" onclick="checkLoginFunction()">Buy Now<i class="fas fa-angle-right"></i></button><br>
                                            <button class="custom-button theme-one rounded" onclick="checkLoginFunction()">Add To Cart<i class="fas fa-angle-right"></i></button><br>
                                                <%
                                                } else {
                                                %>
                                                <%
                                                    CartDAO cartDAO = new CartDAO();
                                                    if (cartDAO.checkAlreadyAdd(courseID, loginUser.getAccountID())) {
                                                %>
                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="AlreadyBuyNow">Buy Now<i class="fas fa-angle-right"></i></button><br>
                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="AlreadyAddToCart">Already Add To Cart <i class="fas fa-angle-right"></i></button><br>
                                                <%
                                                } else {
                                                %>
                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="BuyNow">Buy Now<i class="fas fa-angle-right"></i></button><br>
                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="AddToCart">Add To Cart <i class="fas fa-angle-right"></i></button><br>
                                                <%
                                                    }
                                                %>
                                            <input type="hidden" name="courseID" value="<%= course.getCourseID()%>">
                                            <input type="date" hidden="" name="createdDay" id="todayDate">
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-8">
                            <div class="course-details">
                                <div class="price">
                                    <%= course.getPrice()%>đ
                                </div>
                                <div class="course-header">
                                    <h4 class="title"><%= course.getName()%></h4>
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
                                            <span><%= courseDAO.getDescription(courseID).getType() %></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="course-thumb">
                                    <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" class="w-100" alt="course">
                                </div>
                                <div class="course-details-content section-bg">
                                    <ul class="nav nav-tabs">
                                        <li>
                                            <a href="#overview" class="active" data-bs-toggle="tab">Overview</a>
                                        </li>
                                        <li>
                                            <a href="#curriculum" data-bs-toggle="tab">Target</a>
                                        </li>
                                        <li>
                                            <a href="#instructor" data-bs-toggle="tab">instructor</a>
                                        </li>
                                        <li>
                                            <a href="#reviews" data-bs-toggle="tab">reviews</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane show fade active" id="overview">
                                            <div class="overview">
                                                <p><%= courseDAO.getDescription(courseID).getContent() %></p>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="curriculum">
                                            <div class="overview">
                                                <p><%= courseDAO.getDescription(courseID).getTarget() %></p>
                                                <div class="details-buttons-area">
                                                    <a href="#0" class="custom-button theme-one">Buy Now <i class="fas fa-angle-right"></i></a>
                                                    <a href="#0" class="custom-button bg-white">Add to Cart</a>
<!--                                                    <ul class="social-icons">
                                                        <li>
                                                            <a href="#0"><i class="fab fa-facebook-f"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0"><i class="fab fa-twitter"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0"><i class="fab fa-instagram"></i></a>
                                                        </li>
                                                    </ul>-->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="instructor">
                                            <div class="overview text-center">
                                                <div class="instructor-item">
                                                    <div class="instructor-thumb">
                                                        <a href="#0"><img src="<%= courseDAO.getAccount(courseID).getImage() %>" alt="instructor"></a>
                                                    </div>
                                                    <div class="instructor-content">
                                                        <h6 class="title"><a href="#0"><%= courseDAO.getAccount(courseID).getFullName() %></a></h6>
                                                        <span class="details">TEACHER</span>
                                                    </div>
                                                </div>
                                                <p><%= profileDAO.getProfileByCourseID(courseID) %></p>
                                                <div class="details-buttons-area">
<!--                                                    <ul class="social-icons justify-content-center w-100">
                                                        <li>
                                                            <a href="#0"><i class="fab fa-facebook-f"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0" class="active"><i class="fab fa-twitter"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0"><i class="fab fa-instagram"></i></a>
                                                        </li>
                                                    </ul>-->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="reviews">
                                            <div class="client-review">
                                                <div class="review-comments">
                                                    <h6 class="review-title">Reviews (<%= courseFeedbackDAO.getTotalFeedback(courseID) %>)</h6>
                                                    <ul class="review-contents">
                                                        <%
                                                            List<CourseFeedbackDTO> listFeedback = courseFeedbackDAO.getListCourseFeedback(courseID);
                                                            if (listFeedback != null) {
                                                                if (listFeedback.size() > 0) {
                                                                    for (CourseFeedbackDTO feedback : listFeedback) {
                                                        %>
                                                        <li>
                                                            <div class="thumb">
                                                                <img src="<%= courseFeedbackDAO.getAccount(feedback.getCourseFeedbackID()).getImage() %>" alt="course">
                                                            </div>
                                                            <div class="cont">
                                                                <h6 class="subtitle"><%= courseFeedbackDAO.getAccount(feedback.getCourseFeedbackID()).getFullName() %></h6>
                                                                <div class="ratings cl-theme">
                                                                    <%
                                                                        float rate = feedback.getRate();
                                                                        for (int i = 0; i < rate; i++){
                                                                    %>
                                                                        <span><i class="fas fa-star"></i></span>
                                                                    <%
                                                                        }
                                                                        for (int i = 0; i < (5 - rate); i++){
                                                                    %>
                                                                            <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                                                    <%    
                                                                        }
                                                                    %>
                                                                </div>
                                                                <p><%= feedback.getFeedback() %></p>
                                                            </div>
                                                        </li>
                                                        <%
                                                                    }
                                                                }
                                                            }
                                                        %> 
                                                    </ul>
                                                </div>
                                                <div class="review-form">
                                                    <h6 class="review-title">Add a Review</h6>
                                                    <form class="row client-form align-items-center">
                                                        <div class="col-md-4 col-12">
                                                            <input type="text" name="name" placeholder="Full Name">
                                                        </div>
                                                        <div class="col-md-4 col-12">
                                                            <input type="text" name="email" placeholder="Email Adress">
                                                        </div>
                                                        <div class="col-md-4 col-12">
                                                            <div class="rating">
                                                                <span class="rating-title">Your Rating : </span>
                                                                <ul class="ratings">
                                                                    <li>
                                                                        <a href="#0" title="Give Me One Star"><i class="fas fa-star"></i></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#0" title="Give Me Two Star"><i class="fas fa-star"></i></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#0" title="Give Me Three Star"><i class="fas fa-star"></i></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#0" title="Give Me Four Star"><i class="fas fa-star"></i></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#0" title="Give Me Five Star"><i class="far fa-star"></i></a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 col-12 d-inline-flex">
                                                            <textarea rows="5" placeholder="Type Here Message"></textarea>
                                                        </div>
                                                        <div class="col-12">
                                                            <button type="submit" class="custom-button rounded">Submit Review</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ Course Section ~~~ -->


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

        <script>
                                                function checkLoginFunction() {
                                                    alert("Before Add to Cart, you must Login first");
                                                }
        </script>
        <script>
            document.getElementById("todayDate").valueAsDate = new Date();
        </script>
    </body>

</html>