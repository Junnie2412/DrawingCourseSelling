<%-- 
    Document   : learning
    Created on : Oct 25, 2023, 4:31:15 PM
    Author     : HOANG DUNG
--%>

<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Learning Courses</title>

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
            .container-learning{
                padding: 70px;
            }
            .learning-div{
                margin: 0 auto;
            }
            .learning-div a{
                font-size: 20px;
                color: black;
            }
            .title-learning{
                margin-top: 60px;
                margin-bottom: 20px;
            }
            .title-courses{
                margin-top: 60px;
                margin-bottom: 60px;
            }
            .processedBtn{
                margin-right: 30px;
            }
            .courseBox{
                padding-left: 50px;
                padding-right: 50px;
                width: 100%;
                display: flex;
                align-items: center;
            }

            .courseTitle{
                font-size: 25px;
                font-weight: bold;
                margin-bottom: 10px;   
            }

            .courseInstructor{
                font-size: 15px;
            }

            .processedBtn {
                appearance: button;
                background-color: #000;
                background-image: none;
                border: 1px solid #000;
                border-radius: 4px;
                box-shadow: #fff 4px 4px 0 0,#000 4px 4px 0 1px;
                box-sizing: border-box;
                color: #fff;
                cursor: pointer;
                display: inline-block;
                font-family: ITCAvantGardeStd-Bk,Arial,sans-serif;
                font-size: 14px;
                font-weight: 400;
                line-height: 20px;
                margin: 0 5px 10px 0;
                overflow: visible;
                padding: 12px 40px;
                text-align: center;
                text-transform: none;
                touch-action: manipulation;
                user-select: none;
                -webkit-user-select: none;
                vertical-align: middle;
                white-space: nowrap;
            }

            .processedBtn:focus {
                text-decoration: none;
            }

            .processedBtn:hover {
                text-decoration: none;
            }

            .processedBtn:active {
                box-shadow: rgba(0, 0, 0, .125) 0 3px 5px inset;
                outline: 0;
            }

            .processedBtn:not([disabled]):active {
                box-shadow: #fff 2px 2px 0 0, #000 2px 2px 0 1px;
                transform: translate(2px, 2px);
            }

            @media (min-width: 768px) {
                .processedBtn {
                    padding: 12px 50px;
                }
            }

            .finishedBtn {
                appearance: button;
                background-color: white;
                background-image: none;
                border: 1px solid #000;
                border-radius: 4px;
                box-shadow: #fff 4px 4px 0 0,#000 4px 4px 0 1px;
                box-sizing: border-box;
                color: black;
                cursor: pointer;
                display: inline-block;
                font-family: ITCAvantGardeStd-Bk,Arial,sans-serif;
                font-size: 14px;
                font-weight: 400;
                line-height: 20px;
                margin: 0 5px 10px 20px;
                overflow: visible;
                padding: 12px 40px;
                text-align: center;
                text-transform: none;
                touch-action: manipulation;
                user-select: none;
                -webkit-user-select: none;
                vertical-align: middle;
                white-space: nowrap;
            }

            .finishedBtn:focus {
                text-decoration: none;
            }

            .finishedBtn:hover {
                text-decoration: none;
            }

            .finishedBtn:active {
                box-shadow: rgba(0, 0, 0, .125) 0 3px 5px inset;
                outline: 0;
            }

            .finishedBtn:not([disabled]):active {
                box-shadow: #fff 2px 2px 0 0, #000 2px 2px 0 1px;
                transform: translate(2px, 2px);
            }

            @media (min-width: 768px) {
                .finishedBtn {
                    padding: 12px 50px;
                }
            }
            
            .coursePicture img{
                width: 200px; 
                height: 200px;
                margin-right: 50px;
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
            <section class="hero-section banner-overlay bg_img" data-img="https://images.unsplash.com/photo-1513364776144-60967b0f800f?auto=format&fit=crop&q=80&w=1471&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Learning</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Learning
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->

            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null) {
                    loginUser = new UserDTO();
                }
                if (!loginUser.getRole().equals("Customer")) {
                    response.sendRedirect("index.jsp");
                } else {
            %>
            <div class="container-learning">
                <div class="learning-div">
                    <div class="learning-navbar">
                        <a href="customer.jsp"><i class="fa fa-solid fa-house-user"></i> Home</a>
                        <a href="learning.jsp"> &nbsp; &nbsp; <i class="fa fa-solid fa-caret-left"></i> Learning</a>
                    </div>
                    <div class="title-learning">
                        <h1>My Learning</h1>
                    </div>
                    <div class="learning-button">
                        <button class="processedBtn" type="submit" id="processedBtnID" name="processedBtn" onclick="changeProcessedBtn()">Processed</button>
                        <button class="finishedBtn" type="submit" id="finishedBtnID" name="FinishedBtn" onclick="changeFinishedBtn()">Finished</button>
                    </div>
                    <div class="title-courses">
                        <h3>My Courses</h3>
                    </div>
                    <div class="showListCourse">
                        <div class="courseBox">
                            <div class="coursePicture">
                                <img src="https://images.squarespace-cdn.com/content/v1/5c93cd28f8135a1ac9578e4e/1560090560832-BY2TPFF1S9VABD0OBXOC/Envisage_sketch_Drazil_Final_01.jpg">
                            </div>
                            <div class="courseContent">
                                <div class="courseTitle">
                                    Architecture Sketching
                                </div>
                                <div class="courseInstructor">
                                    Nguyen Le Hoang Dung
                                </div>
                                <div>
                                    <button>Description</button>
                                </div>
                                <div>
                                    <a>Learn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>


            <!-- ~~~ Footer Section ~~~ -->
            <jsp:include page="layout/footer.jsp"/>
            <!-- ~~~ Footer Section ~~~ -->
        </div>

        <script>
            function changeFinishedBtn(){
                var finishedBtn = document.getElementById("finishedBtnID");
                var processedBtn = document.getElementById("processedBtnID");
                
                finishedBtn.style.backgroundColor = 'black';
                finishedBtn.style.color = 'white';
                processedBtn.style.backgroundColor = 'white';
                processedBtn.style.color = 'black';
            }
            
            function changeProcessedBtn(){
                var finishedBtn = document.getElementById("finishedBtnID");
                var processedBtn = document.getElementById("processedBtnID");
                
                finishedBtn.style.backgroundColor = 'white';
                finishedBtn.style.color = 'black';
                processedBtn.style.backgroundColor = 'black';
                processedBtn.style.color = 'white';
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
