<%-- 
    Document   : courses
    Created on : Sep 25, 2023, 8:34:17 AM
    Author     : Admin
--%>

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


            <jsp:include page="layout/header.jsp"/>


            <!-- ~~~ Hero Section ~~~ -->
            <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner.png">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Courses</h1>
                        <ul class="breadcrumb cl-white p-0 m-0">
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
                CourseDAO courseDAO = new CourseDAO();
                List<CourseDTO> listCourse = (List<CourseDTO>) request.getAttribute("LIST_COURSE");
                if (listCourse != null) {
                    if (listCourse.size() > 0) {

            %>

            <%            for (CourseDTO course : listCourse) {
            %>

            <table border="1">

                <tbody>
                    <tr>
                        <td><img style="width: 400px; height:350px" src = "<%= courseDAO.getDescription(course.getCourseID()).getImage()%>"</td>
                    </tr>
                    <tr>
                        <td><%= course.getName()%></td>
                    </tr>
                    <tr>
                        <td><%= courseDAO.getAccount(course.getCourseID()).getFullName()%></td>
                    </tr>
                    <tr>
                        <td><%= course.getPrice()%></td>
                    </tr>
                    <tr>
                        <td><%= course.getDuration()%></td>
                    </tr>
                    <tr>
                        <td><%= courseDAO.getDescription(course.getCourseID()).getLevel()%></td>
                    </tr>
                </tbody>
            </table>

            <%
                }
            %>
            <%
                    }
                }
            %>

            <!-- ~~~ End SEARCH by name~~~ -->

            <!-- ~~~ SEARCH by category~~~ -->
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
                    <div class="row justify-content-center mb-30-none">
                        <% 
                            CourseFeedbackDAO courseFeedbackDAO = new CourseFeedbackDAO();
                            ModuleDAO moduleDAO = new ModuleDAO();
                            List<CourseDTO> list = courseDAO.getlistCourse();
                            if (list != null) {
                            if (list.size() > 0) {
                            for (CourseDTO course : list) {
                        %>
                        <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp?courseID=<%= course.getCourseID() %>">
                                    <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp?courseID=<%= course.getCourseID() %>"><%= course.getName() %></a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span><%= courseDAO.getAccount(course.getCourseID()).getFullName() %></span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span><%= moduleDAO.getQuantityOfModules(course.getCourseID()) %> Modules</span>
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
                                        <span>(<%= courseFeedbackDAO.getAverageRate(course.getCourseID()) %>/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        <%= course.getPrice() %>đ
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
                    <div class="text-center load-more mt-5">
                        <a href="courses.jsp" class="custom-button theme-one">load more courses <i class="fas fa-angle-right"></i></a>
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

        <!-- ~~~ Hero Section ~~~ -->
        <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner.png">
            
            <div class="custom-container">
                <div class="hero-content">
                    <h1 class="title uppercase cl-white">Courses</h1>
                    <ul class="breadcrumb cl-white p-0 m-0">
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
      
        
        <!-- ~~~ End SEARCH by name~~~ -->
        
        <!-- ~~~ SEARCH by category~~~ -->
    <!--    <form action="MainController">
            
            <table border="1">
                
                <tbody>
                    <tr>
                        <td>
                        Price
                        <input name="coursePrice" type="radio" value="Under-150000"/> Under-150000
                        <input name="coursePrice" type="radio" value="Approximately-150000"/>Approximately-150000
                        <input name="coursePrice" type="radio" value="Below-150000"/>Below-150000    
                            
                        </td>
                        <td>
                        Type
                        <input name="courseType" type="radio" value="Digital"/> Digital
                        <input name="courseType" type="radio" value="Traditional"/> Traditional    
                        </td>
                    </tr>
                    <tr>
                        <td>
                        Level
                        <input name="courseLevel" type="radio" value="Basic"/>Basic
                        <input name="courseLevel" type="radio" value="Intermediate"/>Intermediate
                        <input name="courseLevel" type="radio" value="Advanced"/>Advanced   
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            
            Search button <button type="submit" name="action" value="SearchCategory"></button>
        </form>
        -->
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
                <div class="row justify-content-center mb-30-none">
                    <% 
                        if (list != null) {
                        if (list.size() > 0) {
                        for (CourseDTO course : list) {
                    %>
                        <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp?courseID=<%= course.getCourseID() %>">
                                    <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp?courseID=<%= course.getCourseID() %>"><%= course.getName() %></a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span><%= courseDAO.getAccount(course.getCourseID()).getFullName() %></span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span><%= moduleDAO.getQuantityOfModules(course.getCourseID()) %> Modules</span>
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
                                        <span>(<%= courseFeedbackDAO.getAverageRate(course.getCourseID()) %>/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        <%= course.getPrice() %>đ
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
                <div class="text-center load-more mt-5">
                    <a href="courses.jsp" class="custom-button theme-one">load more courses <i class="fas fa-angle-right"></i></a>
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
</body>
        <script src="assets/js/odometer.min.js"></script>
        <script src="assets/js/viewport.jquery.js"></script>
        <script src="assets/js/nice-select.js"></script>
        <script src="assets/js/owl.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>
