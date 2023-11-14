<%@page import="java.util.Base64"%>
<%@page import="submisson.SubmissionDTO"%>
<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="course.BillDTO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructor Grading Detail</title>

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
            #fullImageOverlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.8);
                justify-content: center;
                align-items: center;
                z-index: 2; /* Đảm bảo overlay nằm trên cùng */
            }

            #fullImageOverlay img {
                max-width: 80%;
                max-height: 80%;
            }

            #fullImageCheckbox:checked + #fullImageOverlay {
                display: flex;
            }

            /* Khi overlay được hiển thị, làm mờ phần còn lại của trang */
            #fullImageCheckbox:checked ~ .all-sections {
                filter: blur(5px); /* Điều chỉnh mức độ mờ tùy chọn */
                pointer-events: none; /* Ngăn chặn sự tương tác với phần còn lại của trang */
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

            <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-gradingDetail.avif">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Grading Detail</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="instructor.jsp">Home</a>
                            </li>
                            <li>
                                Grading Detail
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null) {
                    loginUser = new UserDTO();
                }
                if (loginUser.getRole() != "") {
                    String submissionIDStr= (String) request.getAttribute("SUBMISSION_ID");
                    int submissionID =0;
                    
                    if(submissionIDStr != null){
                        submissionID = Integer.parseInt(submissionIDStr);
                    }
                    String courseName = (String) request.getAttribute("COURSE_NAME");
                    String studentName = (String) request.getAttribute("STUDENT_NAME");
                    String topicName = (String) request.getAttribute("TOPIC_NAME");
                    byte[] imageData = (byte[]) request.getAttribute("IMAGE_DATA");
                    String error = (String) request.getAttribute("ERROR");
                    String message = (String) request.getAttribute("MESSAGE");

                    if (error == null) {
                        error = "";
                    }

                    if (message == null) {
                        message = "";
                    }
            %>

            <div style="min-height: 80vh;">
                <h3 style="margin-top: 100px; margin-bottom: 30px; margin-left: 100px;">Student: <%=studentName%></h3>
                <div class="d-flex justify-content-center" style="padding-left: 100px; padding-right: 100px">
                    <div class="left" style="width: 60%; margin-right: 50px">
                        <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(imageData)%>" style="width: 100%; height: 100%" />
                    </div>
                    <div class="right" style="width: 40%">
                        <form action="GradingDetailController?courseName=<%=courseName%>&studentName=<%=studentName%>&topicName=<%=topicName%>&submissionID=<%=submissionID%>" method="POST">

                            <h4 style="background-color: rgb(21,76,121); color: white; padding: 20px"><%=courseName%></h4>
                            <h5 style="margin-top: 30px; margin-bottom: 30px"><span style="font-weight: bold">Topic: </span> <%=topicName%></h5>
                            <div>
                                <h6 style="font-weight: bold">NOTE:</h6>
                                <input type="text" name="note"></input>
                                <h6 style="font-weight: bold; margin-top: 50px">GRADE:</h6>
                                <input type="text" name="grade"></input>
                                <h6 style="color: red; margin-top: 30px"><%=error%></h6>
                                <button type="submit" style=" margin-top: 80px; background-color: rgb(226,135,67); padding-left: 20px;padding-right: 20px; color: black; font-weight:  bold">Submit</button>
                                <span style="color: green; font-weight: bold"> &nbsp; <%=message%></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div style="height: 200px">

            </div>

            <jsp:include page="layout/footer.jsp"/>

            <%
                }
            %>
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
            document.getElementById('fullImageOverlay').addEventListener('click', function () {
                document.getElementById('fullImageCheckbox').checked = false;
            });
        </script>
    </body>
</html>

