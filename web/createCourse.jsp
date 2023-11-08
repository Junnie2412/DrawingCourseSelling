<%-- 
    Document   : createCourse
    Created on : Oct 7, 2023, 1:51:19 PM
    Author     : HOANG DUNG
--%>

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
                width: 100px;
            }


        }
    </style>
    <body>
        <div class="nav-bar">
            <jsp:include page="layout/header.jsp"/>
        </div>


        <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-createAccount.avif">
            <div class="custom-container">
                <div class="hero-content">
                    <h1 class="title uppercase text-white">Create Courses</h1>
                    <ul class="breadcrumb text-white p-0 m-0" style="background-color: #e9ecef00">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            My Account
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <div class="container createTable" style="margin-top: 40px; margin-bottom: 100px" >
            <div class="row justify-content-center">
                <div class="col-md-7">
                    <form action="MainController" class="p-4" style="background-color: #fff; border-radius: 5px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);">
                        <div class="form-group">
                            <i class="bi bi-info-circle-fill"></i>
                            <label class="custom-label font-weight-bold larger-text">Information Of Courses</label>

                        </div>
                        <div class="form-group">
                            <label for="courseID" class="custom-label">Course ID</label>
                            <input type="text" class="form-control" id="courseID" name="courseID" required>
                        </div>
                        <div class="form-group">
                            <label for="coursePrice"  class="custom-label">Price</label>
                            <input type="text" class="form-control" id="coursePrice" name="coursePrice" required>
                        </div>
                        <div class="form-group">
                            <label for="courseName"  class="custom-label">Name</label>
                            <input type="text" class="form-control" id="courseName" name="courseName" required>
                        </div>
                        <div class="form-group">
                            <label for="courseDuration"  class="custom-label">Duration</label>
                            <input type="text" class="form-control" id="courseDuration" name="courseDuration" required>
                        </div>
                        <div class="form-group">
                            <label for="courseDatePublic"  class="custom-label">Date Public</label>
                            <input type="date" class="form-control" id="courseDatePublic" name="courseDatePublic" required>
                        </div>
                        <div class="form-group" style="margin-top: 50px">
                            <label class="custom-label font-weight-bold larger-text" style="color: black;">Description</label>
                        </div>
                        <div class="form-group">
                            <label for="descriptionContent"  class="custom-label">Content</label>
                            <input type="text" class="form-control" id="descriptionContent" name="descriptionContent" required>
                        </div>
                        <div class="form-group">
                            <label for="descriptionTarget"  class="custom-label">Target</label>
                            <input type="text" class="form-control" id="descriptionTarget" name="descriptionTarget" required>
                        </div>
                        <div class="form-group">
                            <label for="descriptionImage"  class="custom-label">Image</label>
                            <input type="text" class="form-control" id="descriptionImage" name="descriptionImage" required>
                        </div>
                        <div class="form-group">
                            <label for="descriptionType"  class="custom-label">Type</label>
                            <input type="text" class="form-control" id="descriptionType" name="descriptionType" required>
                        </div>
                        <div class="form-group">
                            <label for="descriptionLevel"  class="custom-label">Level</label>
                            <select class="form-control" id="descriptionLevel" name="descriptionLevel" required>
                                <option value="Basic">Basic</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Advanced">Advanced</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <%
                                String message = (String) request.getAttribute("MESSAGE");
                                if (message == null) {
                                    message = "";
                                }
                            %>
                            <p><%=message%></p>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-dark" name="action" value="TurnBackToCourses">Turn Back To Courses</button>
                            <button type="submit" class="btn btn-dark" name="action" value="CreateCourse">Create Course</button>
                        </div>
                    </form>
                </div>
            </div>

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
            document.getElementById("courseDatePublic").valueAsDate = new Date();
        </script>
    </body>
</html>