<%-- 
    Document   : createCourse
    Created on : Oct 7, 2023, 1:51:19 PM
    Author     : HOANG DUNG
--%>

<%@page import="java.util.List"%>
<%@page import="course.ModuleDTO"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ArtCenter - Create Courses</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link href="assets/css/main2.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">
    </head>
    <style>
        .custom-label {
            font-weight: bold;
            color: #0b0a0a; /* Màu n?i b?t c?a ch? */
        }
        .larger-text{
            font-size: 20px;

            .custom-container{
                background-color: rgba(59, 65, 66, 0.1);
            }

            .nav-bar {
                height: 100px; 
                width: 1600px;
            }

        }
    </style>
    <body>
        <div class="nav-bar">
            <jsp:include page="layout/header.jsp"/>
        </div>

        <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-updateCourse.avif">
            <div class="custom-container">
                <div class="hero-content">
                    <h1 class="title uppercase text-white">Update Courses</h1>
                    <ul class="breadcrumb text-white p-0 m-0" style="background-color: #e9ecef00">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            My Courses
                        </li>
                    </ul>
                </div>
            </div>
        </section>


        <div class="container" style="margin-top: 40px; margin-bottom: 100px" >
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form action="UpdateCourseController" method="POST" class="p-4" style="background-color: #fff; border-radius: 5px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);">

                        <div class="form-group">
                            <i class="bi bi-info-circle-fill"></i>
                            <label class="custom-label font-weight-bold larger-text">Course Information</label>

                        </div>
                        <div class="form-group">
                            <label for="courseID">Course ID</label>
                            <input readonly type="text" class="form-control" id="courseID" name="courseID" value="${requestScope.course.getCourseID()}">
                        </div>
                        <div class="form-group">
                            <label for="coursePrice">Price</label>
                            <input type="text" class="form-control" id="coursePrice" name="coursePrice" value="${requestScope.course.getPrice()}">
                        </div>
                        <div class="form-group">
                            <label for="courseName">Name</label>
                            <input type="text" class="form-control" id="courseName" name="courseName" value="${requestScope.course.getName()}">
                        </div>
                        <div class="form-group">
                            <label for="courseDuration">Duration</label>
                            <input type="text" class="form-control" id="courseDuration" name="courseDuration" value="${requestScope.course.getDuration()}">
                        </div>
                        <div class="form-group">
                            <label for="courseDatePublic">Date Public</label>
                            <input type="date" class="form-control" id="courseDatePublic" name="courseDatePublic" value="${requestScope.course.getDatePublic()}">
                        </div>




                        <div class="form-group" style="margin-top: 40px">
                            <i class="bi bi-info-circle-fill"></i>
                            <label class="custom-label font-weight-bold larger-text">Description</label>

                        </div>
                        <input type="hidden" name="descriptionId" value="${requestScope.description.getDescriptionID()}">
                        <div class="form-group">
                            <label for="descriptionContent">Content</label>
                            <input type="text" class="form-control" id="descriptionContent" name="descriptionContent" value="${requestScope.description.getContent()}">
                        </div>
                        <div class="form-group">
                            <label for="descriptionTarget">Target</label>
                            <input type="text" class="form-control" id="descriptionTarget" name="descriptionTarget" value="${requestScope.description.getTarget()}">
                        </div>
                        <div class="form-group">
                            <label for="descriptionImage">Image</label>
                            <input type="text" class="form-control" id="descriptionImage" name="descriptionImage" value="${requestScope.description.getImage()}">
                        </div>
                        <div class="form-group">
                            <label for="descriptionType">Type</label>
                            <input type="text" class="form-control" id="descriptionType" name="descriptionType" value="${requestScope.description.getType()}">
                        </div>
                        <div class="form-group">
                            <label for="descriptionLevel">Level</label>
                            <select class="form-control" id="descriptionLevel" name="descriptionLevel">
                                <option value="Basic" ${requestScope.description.getLevel() == "Basic" ? "selected" : ""}>Basic</option>
                                <option value="Intermediate" ${requestScope.description.getLevel() == "Intermediate" ? "selected" : ""}>Intermediate</option>
                                <option value="Advanced" ${requestScope.description.getLevel() == "Advanced" ? "selected" : ""}>Advanced</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <p class="text-danger">
                                <%
                                    String message = (String) request.getAttribute("MESSAGE");
                                    if (message == null) {
                                        message = "";
                                    }
                                %>
                                <%=message%>
                            </p>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-dark">Turn Back To Courses</button>
                            <button type="submit" class="btn btn-dark">Update Course</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    <container>
        <h1>Update and Create Module</h1>
    </container>

    <div class="createTable">
        <div class="card">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Title Module</th>
                        <th>Function</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (ModuleDTO module : (List<ModuleDTO>) request.getAttribute("modules")) {%>
                    <tr>
                        <td><%= module.getTitle()%></td>
                        <td>
                            <a href="CreateLessonController?moduleId=<%= module.getModuleID()%>" class="btn btn-primary">edit</a>
                        </td>
                    </tr>
                    <% }%>
                    <tr>
                <form action="CreateModuleController" method="POST">
                    <td>
                        <input type="hidden" name="courseId" value="${requestScope.course.getCourseID()}" />
                        <input type="text" name="title" placeholder="Title" required class="form-control">
                    </td>
                    <td>
                        <button type="submit" class="btn btn-dark">Create Module</button>
                    </td>
                </form>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script>
        document.getElementById("todayDate").valueAsDate = new Date();
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>