<%-- 
    Document   : courses
    Created on : Sep 25, 2023, 8:34:17 AM
    Author     : Admin
--%>

<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="course.CourseDTO"%>
<%@page import="course.CourseDAO"%>
<%@page import="course.ModuleDAO"%>

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
            <section  class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-courses.avif">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Manager Courses</h1>
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
                        <h2 class="title"><span>Featured</span> Create Courses</h2>
                        <form action="MainController">
                            <button type="submit" name="action" value="CreateNewCourse" class="btn btn-primary">Create New Course</button>
                        </form>
                    </div>
                    <div class="section-header">

                        <h2 class="title"><span>Featured</span> Online Courses</h2>
                    </div>

                    <!-- Update Course-->
                    <%
                        CourseDAO courseDAO = new CourseDAO();
                        ModuleDAO moduleDAO = new ModuleDAO();

                        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

                        List<CourseDTO> listCourse = courseDAO.getlistCourseInstructor(user.getAccountID());
                    %>
                    <div class="row justify-content-center mb-30-none">
                        <%
                            for (CourseDTO course : listCourse) {
                        %>
                        <!--                        <form action="UpdateCourseController" method="GET">
                                                    <table border="1">
                                                        <input type="hidden" name="courseId" value="<%= course.getCourseID()%>"/>
                                                        <tbody>
                                                            <tr>
                                                                <td><img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td><%= course.getName()%></td>
                                                           </tr>
                                                           <tr>
                                                                <td><%= courseDAO.getAccount(course.getCourseID()).getFullName()%></td>
                                                            </tr>
                                                            <tr>
                                                                <td><button type="submit" name="action" value="UpdateCourse">Update Course</button></td>
                                                           </tr>
                                                        </tbody>
                                                    </table>
                                                    <br>
                                                </form>-->
                        <form action="UpdateCourseController" method="GET" class="col-xl-4 col-md-6 col-sm-10">
                            <div class="course-item">
                                <div class="thumb">
                                    <a href="course-details.jsp?courseID=<%= course.getCourseID()%>">
                                        <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" alt="course">
                                    </a>
                                </div>
                                <div class="content">
                                    <h5 class="title">
                                        <input type="hidden" name="courseId" value="<%= course.getCourseID()%>"/>
                                        <a href="course-details.jsp"><%= course.getName()%></a>
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
                                        <div class="price cl-1"><input type="hidden" name="price" value="<%=course.getPrice()%>">
                                            <span name="priceValue"></span> VND
                                        </div>
                                    </div>
                                    <button type="submit" name="action" value="UpdateCourse" class="btn btn-primary">Update Course</button>
                                </div>

                            </div>
                        </form>
                        <%
                            }
                        %>
                        <div class="text-center load-more mt-5">
                            <a href="courses.jsp" class="custom-button theme-one">See full courses <i class="fas fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ Course Section ~~~ -->


            <!-- ~~~ Footer Section ~~~ -->
            <jsp:include page="layout/footer.jsp"/>
            <!-- ~~~ Footer Section ~~~ -->
        </div>

        <script>
            window.addEventListener('load', function() {
                var input = document.getElementsByName("price");
                var tmp1 = 0;
                for (var i = 0; i < input.length; i++) {
                    tmp1 = parseFloat(input[i].value);
                    document.getElementsByName("priceValue")[i].innerHTML = Intl.NumberFormat().format(tmp1.toFixed(3));
                }
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

