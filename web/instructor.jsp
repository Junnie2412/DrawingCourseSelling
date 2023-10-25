<%-- 
    Document   : instructor
    Created on : Sep 25, 2023, 8:35:43 AM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="users.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
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
            .instructor-content{
                max-width: 400px;
            }
            .nav-bar{
                width: 100vw;
                background-color: rgba(59, 65, 66, 0.1);
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
    <%
    UserDTO loginUser = (UserDTO) session.getAttribute(("LOGIN_USER"));
    if (loginUser == null) {
        loginUser = new UserDTO();
    }
%>


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
            <section class="hero-section banner-overlay bg_img" data-img="https://images.unsplash.com/photo-1541753866388-0b3c701627d3?auto=format&fit=crop&q=80&w=1374&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">

                <div class="custom-container">
                    <div class="hero-content">
                        <%
                            if (loginUser.getRole().equals("Instructor")) {
                        %>
                        <h1 class="title uppercase cl-white">Hello Instructor</h1>
                        <% } else {
                        %>  
                        <li>
                            <h1 class="title uppercase cl-white">Instructor</h1>
                        </li>   
                        <% }%>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Instructor
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->

            <!-- Load Instructor List->
            <%
                UserDAO userDAO = new UserDAO();
                List<UserDTO> instructorList = userDAO.getInstructorList();
                if (instructorList == null) {
                    instructorList = new ArrayList<UserDTO>();
                }
            %>
    
    
            <!-- ~~~ Instructor Section ~~~ -->
            <div class="instructor-section pt-120 pb-120">
                <div class="container">
                    <div class="row justify-content-center mb-30-none">
                        <%
                            if (instructorList.size() > 0) {
                                for (UserDTO instructor : instructorList) {
                        %>
                        <div class="col-lg-4 col-sm-6">
                            <div class="instructor-item">
                                <div class="instructor-thumb">
                                    <a href="#0"><img src="<%= instructor.getImage()%>" alt="instructor" style="width: 200px; height: 200px"></a>
                                </div>
                                <div class="instructor-content">
                                    <h5 class="title"><a href="#0"><%= instructor.getFullName()%></a></h5>
                                    <span class="details">TEACHER</span>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                    <div class="text-center load-more mt-5">
                        <a href="instructor.jsp" class="custom-button theme-one">Load more Instructors <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- ~~~ Instructor Section ~~~ -->


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
