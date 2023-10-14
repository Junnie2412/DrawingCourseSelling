<%-- 
    Document   : reviewCourse
    Created on : Oct 14, 2023, 1:13:39 PM
    Author     : HOANG DUNG
--%>

<%@page import="course.CourseDTO"%>
<%@page import="java.util.List"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Review Courses</title>

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
            body{
                padding: 30px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h3>Unapproved Course</h3>
        <!-- Get list Unapproved Courses-->
        <%
            CourseDAO courseDAO = new CourseDAO();
            List<CourseDTO> courseList = courseDAO.getUnapprovedCoursesList();
            if (courseList.size() > 0) {
                for (CourseDTO course : courseList) {
        %>
        <div class="col-lg-4 col-sm-6 unapproved-course-form">
            <img src="<%=course.getImage()%>">
            <h3><%=course.getName()%></h3>
            <h3><%=course.getDatePublic()%></h3>
        </div>
        <%
                }
            }
        %>
    </body>
</html>
