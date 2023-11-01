<%-- 
    Document   : course-learning
    Created on : Nov 1, 2023, 9:59:51 AM
    Author     : HOANG DUNG
--%>

<%@page import="users.UserDTO"%>
<%@page import="course.LessonDTO"%>
<%@page import="course.ModuleDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="course.ModuleDAO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Learning Course</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/owl.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <!-- Pheasant Buttons -->
        <!-- Pheasant Demure Buttons Reset: Optional -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons-reset.css" type="text/css" media="all" />
        <!-- Pheasant Demure Buttons Layout: Optional -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons-layout.css" type="text/css" media="all" />
        <!-- Pheasant Demure Buttons: Required -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons.css" type="text/css" media="all" />
        <link href="assets/css/main2.css" rel="stylesheet" type="text/css"/>

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">

        <style>
            .nav-bar{
                width: 100vw;
                background-color: white;
                height: 90px;
            }
            .navbar-learning{
                padding: 50px;
            }
            .learning-container{
                width: 100vw;
                justify-content: space-between;
            }
            .learning-right{
                width: 70%;
                height: 80vh;
                position: absolute;
            }
            .module-title{
                background-color: rgba(88,100,125,255);
                padding: 10px;
                padding-left: 30px;
            }
            .module-title a {
                color: white;
                font-size: 20px;
            }
            .module-title a:hover {
                color: white;
                font-size: 20px;
            }
            .navbar-learning a{
                color: black;
                font-size: 20px;
            }
            .navbar-learning{
                border-top: 1px solid gray;
            }
            .lesson-title:hover{
                background-color: rgb(230, 228, 228);
                border-left: 10px solid rgb(21,76,121);
            }
        </style>
    </head>
    <body onload="pageLoad()">
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

            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if(loginUser == null){
                    loginUser = new UserDTO();
                }
                if (loginUser.getRole() != "") {
            %>
            <div class="learning-right" style="position: absolute; top: 27%; right:-10px ">
                <div style="margin-bottom: 20px">
                    <h1 id="titleLessonSpan" ></h1>
                </div>
                <iframe id="changeVideo" width="90%" height="80%" src="" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                <div style="margin-top: 30px">
                    <h4 style="margin-bottom: 20px">Description</h4>
                    <p id="descriptionLessonSpan" style="background-color: rgb(240, 238, 238); width: 90%; padding: 50px; font-size: 17px">
                    </p>
                </div>
            </div>
            <%
                String courseID = request.getParameter("courseID");
                ModuleDAO moduleDAO = new ModuleDAO();
                List<ModuleDTO> listModule = moduleDAO.getModulesByCourseId(courseID);
            %>

            <div class="navbar-learning">
                <a href="customer.jsp"><i class="fa fa-solid fa-house-user"></i> Home</a>
                <a href="learning.jsp"> &nbsp; &nbsp; <i class="fa fa-solid fa-caret-left"></i> Learning</a>
                <a href=""> &nbsp; &nbsp; <i class="fa fa-solid fa-caret-left"></i> Lesson</a>
            </div>

            <%
                for (ModuleDTO module : listModule) {
            %>
            <div class="learning-container">
                <div class="learning-left">
                    <div class="module-title" style="width: 25%">
                        <a href=""><%=module.getTitle()%></a>
                    </div>
                    <%
                        List<LessonDTO> listLesson = moduleDAO.getLessonList(module.getModuleID());
                        for (LessonDTO lesson : listLesson) {
                    %>
                    <div style="width: 25%">
                        <input type="hidden" id="titleLessonID" name="titleLessonList" value="<%=lesson.getTitle()%>">
                        <input type="hidden" id="descriptionLessonID" name="descriptionLessonList" value="<%=lesson.getDescription()%>">
                        <input type="hidden" id="videoID" name="videoList" value="<%=moduleDAO.getVideo(lesson.getLessonID()).getContent()%>">
                        <div name="lessonList" value="<%=lesson.getLessonID()%>" class="lesson-title" style="font-size: 17px; color: black; padding: 10px; padding-left: 30%">
                            <a href="#" style="width: 100%; color:black" onclick="changeLesson()"><%=lesson.getTitle()%></a>
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
        
        <script>
            function pageLoad(){
                var titleList = document.getElementsByName("titleLessonList");
                var descriptionList = document.getElementsByName("descriptionLessonList");
                var videoList = document.getElementsByName("videoList");
                
                document.getElementById("titleLessonSpan").innerHTML = titleList[0].value;
                document.getElementById("descriptionLessonSpan").innerHTML = descriptionList[0].value;
                document.getElementById("changeVideo").src = videoList[0].value;
            }
            
            function changeLesson(){
                var title = document.getElementById("titleLessonID");
                var description = document.getElementById("descriptionLessonID");
                var video = document.getElementById("videoID");
                
                document.getElementById("titleLessonSpan").innerHTML = title.value;
                document.getElementById("descriptionLessonSpan").innerHTML = description.value;
                document.getElementById("changeVideo").src = video.value;
            }
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"></script>

        <script data-cfasync="false" src="../../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/magnific-popup.min.js"></script>

        <script src="assets/js/odometer.min.js"></script>
        <script src="assets/js/viewport.jquery.js"></script>
        <script src="assets/js/nice-select.js"></script>
        <script src="assets/js/owl.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/odometer.min.js"></script>
        <script src="assets/js/viewport.jquery.js"></script>
        <script src="assets/js/nice-select.js"></script>
        <script src="assets/js/owl.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
