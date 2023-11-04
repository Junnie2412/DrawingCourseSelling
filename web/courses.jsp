<%-- 
    Document   : courses
    Created on : Sep 25, 2023, 8:34:17 AM
    Author     : Admin
--%>

<%@page import="users.UserDTO"%>
<%@page import="course.ModuleDAO"%>
<%@page import="course.CourseFeedbackDAO"%>
<%@page import="course.CourseDAO"%>
<%@page import="java.util.List"%>
<%@page import="course.CourseDTO"%>
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
            .course-item{
                height: 450px;
                border-radius: 25px;
                background: rgba(59, 65, 66, 0.03);
            }

            .course-item img{
                border-radius: 25px;
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
        </style>
    </head>
    <body onload="loadPage()">

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
            <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-courses.avif">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Courses</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Courses
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->

            <!-- ~~~ SEARCH by name ~~~ -->
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute(("LOGIN_USER"));
                if (loginUser == null) {
                    loginUser = new UserDTO();
                }
            %>
            <%
                CourseDAO courseDAO = new CourseDAO();
                CourseFeedbackDAO courseFeedbackDAO = new CourseFeedbackDAO();
                ModuleDAO moduleDAO = new ModuleDAO();
                List<CourseDTO> listCourse = (List<CourseDTO>) request.getAttribute("LIST_COURSE");
                List<CourseDTO> listCourseFilter = (List<CourseDTO>) request.getAttribute("LIST_COURSE_FILTER");
                if (listCourse != null) {
                    if (listCourse.size() > 0) { 

            %>
            <section class="course-section pt-120 pb-120 section-bg oh pos-rel">    
                <div class="course-top-shape">
                    <img src="assets/images/course/course-top-shape.png" alt="course">
                </div>
                <div class="course-bottom-shape">
                    <img src="assets/images/course/course-bottom-shape.png" alt="course">
                </div>
                <div class="container">
                    <div class="row justify-content-center mb-30-none">
                        <%            
                            for (CourseDTO course : listCourse) {
                        %>
                        <div class="col-xl-4 col-md-6 col-sm-10">  
                            <form action="MainController" method="POST" id="courseForm<%= course.getCourseID()%>">
                                <input type="hidden" value="ViewCourseDetail" name="action"/>
                                <input type="hidden" name="courseID" value="<%= course.getCourseID()%>">
                                <input type="hidden" name="courseName" value="<%= course.getName()%>">
                                <div class="course-item">
                                    <div class="thumb">
                                        <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" alt="course" id="courseImage">
                                    </div>
                                    <div class="content">
                                        <h5 class="title">
                                            <p id="courseName"><%= course.getName()%></p>
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
//                                                    float avgrate = courseFeedbackDAO.getAverageRate(course.getCourseID());
//                                                    for (int i = 0; i < avgrate; i++) {
                                                %>
<!--//                                                <span><i class="fas fa-star"></i></span>-->
                                                    <%
//                                                        }
//                                                        for (int i = 0; i < (5 - avgrate); i++) {
                                                    %>
<!--//                                                <span class="cl-theme-light"><i class="fas fa-star"></i></span>-->
                                                    <%
//                                                        }
                                                    %>
<!--//                                                <span>(<%= courseFeedbackDAO.getAverageRate(course.getCourseID())%>/5.00)</span>-->
                                            </div>
                                            <div class="price cl-1"><input type="hidden" name="price" value="<%=course.getPrice()%>">
                                                <span name="priceValue"></span> VND
                                            </div>
                                        </div>
                                    </div>           
                                </div>  
                            </form>                     
                        </div>
                        <%
                            }
                        %>
                        <div class="text-center">    
                            <p class="mb-0 text-muted">
                                This is all of results.
                            </p>
                        </div>
                    </div>    
                </div>
                <div> 


                    <%
                        if (loginUser.getRole().equals("Instructor")) {
                    %>
                    <div class="text-center load-more mt-5">
                        <a href="instructorCourse.jsp" class="custom-button theme-one">Turn back to manager courses  <i class="fas fa-angle-right"></i></a>
                    </div>    
                    <% } else {
                    %>  
                    <div class="text-center load-more mt-5">
                        <a href="courses.jsp" class="custom-button theme-one">load more courses <i class="fas fa-angle-right"></i></a>
                    </div>    
                    <% }%>

                </div>
            </section>
            <%
                }
            } else if (listCourseFilter != null) {
                if (listCourseFilter.size() > 0) {
            %>
            
            <!-- ~~~ End SEARCH by name~~~ -->
            
            <!-- ~~~ FILTER~~~ -->
            
            <section class="course-section pt-120 pb-120 section-bg oh pos-rel">    
                <div class="course-top-shape">
                    <img src="assets/images/course/course-top-shape.png" alt="course">
                </div>
                <div class="course-bottom-shape">
                    <img src="assets/images/course/course-bottom-shape.png" alt="course">
                </div>
                <div class="container">
                    <div class="user-info dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filter
                        </a>
                        <div class="dropdown-menu" aria-labelledby="userDropdown">
                            <div class="column">
                                <p>Filter by Price:</p>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByPrice" method="POST">
                                        <input type="hidden" value="Under-300000" name="priceFilter"/>
                                        <input type="submit" value="Under-300000">
                                    </form>
                                </div>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByPrice" method="POST">
                                        <input type="hidden" value="Above-300000" name="priceFilter"/>
                                        <input type="submit" value="Above-300000">
                                    </form>
                                </div>
                            </div>
                            <div class="column">
                                <p>Filter by Type:</p>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByType" method="POST">
                                        <input type="hidden" value="Digital" name="typeFilter"/>
                                        <input type="submit" value="Digital">
                                    </form>
                                </div>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByType" method="POST">
                                        <input type="hidden" value="Traditional" name="typeFilter"/>
                                        <input type="submit" value="Traditional">
                                    </form>
                                </div>
                            </div>
                            <div class="column">
                                <p>Filter by Level:</p>           
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByLevel" method="POST">
                                        <input type="hidden" value="Basic" name="levelFilter"/>
                                        <input type="submit" value="Basic">
                                    </form>
                                </div>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByLevel" method="POST">
                                        <input type="hidden" value="Intermediate" name="levelFilter"/>
                                        <input type="submit" value="Intermediate">
                                    </form>    
                                </div>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByLevel" method="POST">
                                        <input type="hidden" value="Advanced" name="levelFilter"/>
                                        <input type="submit" value="Advanced">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center mb-30-none">
                        <%            for (CourseDTO course : listCourseFilter) {
                        %>
                        <div class="col-xl-4 col-md-6 col-sm-10">  
                            <form action="MainController" method="POST" id="courseForm<%= course.getCourseID()%>">
                                <input type="hidden" value="ViewCourseDetail" name="action"/>
                                <input type="hidden" name="courseID" value="<%= course.getCourseID()%>">
                                <input type="hidden" name="courseName" value="<%= course.getName()%>">
                                <div class="course-item">
                                    <div class="thumb">
                                        <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" alt="course" id="courseImage">
                                    </div>
                                    <div class="content">
                                        <h5 class="title">
                                            <p id="courseName"><%= course.getName()%></p>
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
//                                                    float avgrate = courseFeedbackDAO.getAverageRate(course.getCourseID());
//                                                    for (int i = 0; i < avgrate; i++) {
                                                %>
<!--//                                                <span><i class="fas fa-star"></i></span>-->
                                                    <%
//                                                        }
//                                                        for (int i = 0; i < (5 - avgrate); i++) {
                                                    %>
<!--//                                                <span class="cl-theme-light"><i class="fas fa-star"></i></span>-->
                                                    <%
//                                                        }
                                                    %>
<!--//                                                <span>(<%= courseFeedbackDAO.getAverageRate(course.getCourseID())%>/5.00)</span>-->
                                            </div>
                                            <div class="price cl-1"><input type="hidden" name="price" value="<%=course.getPrice()%>">
                                                <span name="priceValue"></span> VND
                                            </div>
                                        </div>
                                    </div>           
                                </div>  
                            </form>                     
                        </div>
                        <%
                            }
                        %>
                        <div class="text-center">    
                            <p class="mb-0 text-muted">
                                This is all of results.
                            </p>
                        </div>
                    </div>    
                </div>
                <div> 


                    <%
                        if (loginUser.getRole().equals("Instructor")) {
                    %>
                    <div class="text-center load-more mt-5">
                        <a href="instructorCourse.jsp" class="custom-button theme-one">Turn back to manager courses  <i class="fas fa-angle-right"></i></a>
                    </div>    
                    <% } else {
                    %>  
                    <div class="text-center load-more mt-5">
                        <a href="courses.jsp" class="custom-button theme-one">load more courses <i class="fas fa-angle-right"></i></a>
                    </div>    
                    <% }%>

                </div>
            </section>    

            <%
                }
            } else {
            %>

            <!-- ~~~ END FILTER ~~~ -->

            <!-- ~~~ SEARCH by category~~~ -->
            <!--
            <form action="MainController">
                Price
                <input name="coursePrice" type="radio" value="Under-150000"/> Under-150000
                <input name="coursePrice" type="radio" value="Approximately-150000"/>Approximately-150000
                <input name="coursePrice" type="radio" value="Above-150000"/>Above-150000

                Type
                <input name="courseType" type="radio" value="Digital"/> Digital
                <input name="courseType" type="radio" value="Traditional"/> Traditional

                Level
                <input name="courseLevel" type="radio" value="Basic"/>Basic
                <input name="courseLevel" type="radio" value="Intermediate"/>Intermediate
                <input name="courseLevel" type="radio" value="Advanced"/>Advanced
            </form>

            <!-- ~~~ End SEARCH by category~~~ -->


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
                    <div class="user-info dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filter
                        </a>
                        <div class="dropdown-menu" aria-labelledby="userDropdown">
                            <div class="column">
                                <p>Filter by Price:</p>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByPrice" method="POST">
                                        <input type="hidden" value="Under-300000" name="priceFilter"/>
                                        <input type="submit" value="Under-300000">
                                    </form>
                                </div>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByPrice" method="POST">
                                        <input type="hidden" value="Above-300000" name="priceFilter"/>
                                        <input type="submit" value="Above-300000">
                                    </form>
                                </div>
                            </div>
                            <div class="column">
                                <p>Filter by Type:</p>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByType" method="POST">
                                        <input type="hidden" value="Digital" name="typeFilter"/>
                                        <input type="submit" value="Digital">
                                    </form>
                                </div>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByType" method="POST">
                                        <input type="hidden" value="Traditional" name="typeFilter"/>
                                        <input type="submit" value="Traditional">
                                    </form>
                                </div>
                            </div>
                            <div class="column">
                                <p>Filter by Level:</p>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByLevel" method="POST">
                                        <input type="hidden" value="Basic" name="levelFilter"/>
                                        <input type="submit" value="Basic">
                                    </form>
                                </div>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByLevel" method="POST">
                                        <input type="hidden" value="Intermediate" name="levelFilter"/>
                                        <input type="submit" value="Intermediate">
                                    </form>
                                </div>
                                <div class="dropdown-item">
                                    <form action="MainController?action=FilterByLevel" method="POST">
                                        <input type="hidden" value="Advanced" name="levelFilter"/>
                                        <input type="submit" value="Advanced">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center mb-30-none">
                        <%
                            List<CourseDTO> list = courseDAO.getlistCourse("");
                            if (list != null) {
                                if (list.size() > 0) {
                                    for (CourseDTO course : list) {
                        %>
                        <div class="col-xl-4 col-md-6 col-sm-10">  
                            <form action="MainController" method="POST" id="courseForm<%= course.getCourseID()%>">
                                <input type="hidden" value="ViewCourseDetail" name="action"/>
                                <input type="hidden" name="courseID" value="<%= course.getCourseID()%>">
                                <input type="hidden" name="courseName" value="<%= course.getName()%>">
                                <div class="course-item">
                                    <div class="thumb">
                                        <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" alt="course" id="courseImage">
                                    </div>
                                    <div class="content">
                                        <h5 class="title">
                                            <p id="courseName"><%= course.getName()%></p>
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
//                                                    float avgrate = courseFeedbackDAO.getAverageRate(course.getCourseID());
//                                                    for (int i = 0; i < avgrate; i++) {
                                                %>
<!--//                                                <span><i class="fas fa-star"></i></span>-->
                                                    <%
//                                                        }
//                                                        for (int i = 0; i < (5 - avgrate); i++) {
                                                    %>
<!--//                                                <span class="cl-theme-light"><i class="fas fa-star"></i></span>-->
                                                    <%
//                                                        }
                                                    %>
<!--//                                                <span>(<%= courseFeedbackDAO.getAverageRate(course.getCourseID())%>/5.00)</span>-->
                                            </div>
                                            <div class="price cl-1"><input type="hidden" name="price" value="<%=course.getPrice()%>">
                                                <span name="priceValue"></span> VND
                                            </div>
                                        </div>
                                    </div>           
                                </div>  
                            </form>                     
                        </div>

                        <%
                                    }
                                }
                            }
                        %> 
                    </div>
                </div>
                <div> 


                    <%
                        if (loginUser.getRole().equals("Instructor")) {
                    %>
                    <div class="text-center load-more mt-5">
                        <a href="instructorCourse.jsp" class="custom-button theme-one">Turn back to manager courses  <i class="fas fa-angle-right"></i></a>
                    </div>    
                    <% } else {
                    %>  
                    <div class="text-center load-more mt-5">
                        <a href="courses.jsp" class="custom-button theme-one">load more courses <i class="fas fa-angle-right"></i></a>
                    </div>    
                    <% }%>

                </div>
            </section>
            <%
                }
            %>                
            <!-- ~~~ Course Section ~~~ -->


            <!-- ~~~ Footer Section ~~~ -->
            <jsp:include page="layout/footer.jsp"/>
            <!-- ~~~ Footer Section ~~~ -->
        </div>

        <script>
            function loadPage() {

                var input = document.getElementsByName("price");
                var tmp1 = 0;
                for (var i = 0; i < input.length; i++) {
                    tmp1 = parseFloat(input[i].value);
                    document.getElementsByName("priceValue")[i].innerHTML = Intl.NumberFormat().format(tmp1.toFixed(3));
                }
            }
        </script>
        
        <script>
            var courseForms = document.querySelectorAll('form[id^="courseForm"]');

            courseForms.forEach(function(form) {
                var courseImage = form.querySelector('#courseImage');
                var courseName = form.querySelector('#courseName');

                courseImage.addEventListener('click', function() {
                    form.submit(); 
                });

                courseName.addEventListener('click', function() {
                    form.submit(); 
                });
            });
        </script>

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
