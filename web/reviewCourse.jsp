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
            }

            .unapproved-course-form img{
                width: 300px;
                height: 300px;
                margin-bottom: 10px;
            }

            .course-form{
                display: flex;
            }

            h3{
                text-align: center;
            }

        </style>
    </head>
    <body>
        <h3>Unapproved Course</h3>
        <br>
        <!-- Get list Unapproved Courses-->
        <div class="unapproved-course-form">
            <%
                CourseDAO courseDAO = new CourseDAO();
                List<CourseDTO> courseList = courseDAO.getUnapprovedCoursesList();
                if (courseList.size() > 0) {
                    for (CourseDTO course : courseList) {
            %>
            <div class="course-form">
                <div>
                    <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>">
                </div>
                <div>
                    <h6><%=course.getName()%></h6><br>
                    <p>Price: <%= course.getPrice()%></p>
                    <p>Duration: <%= course.getDuration()%></p>
                    <p>Instructor: <%= courseDAO.getAccount(course.getCourseID()).getFullName()%></p>
                    <p><%=course.getDatePublic()%></p><br>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>
