<%-- 
    Document   : Editaccount
    Created on : Oct 18, 2023, 2:22:51 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="users.UserDTO"%>

<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

    <head>

        <meta charset="utf-8" />
        <title>ArtCenter - Online Drawing Course</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Layout config Js -->
        <script src="admin/assets/js/layout.js"></script>
        <!-- Bootstrap Css -->
        <link href="admin/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="admin/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="admin/assets/css/app.min.css" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        <link href="admin/assets/css/custom.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/owl.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link href="assets/css/main2.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">


    </head>
    <style>
        .nav-bar {
    height: 100px; 
    width: 1600px;
}
    </style>



    <body>
        
        
        
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute(("LOGIN_USER"));
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
        %>


        <div class="all-sections oh">
            <!-- ~~~ Loader & Go-Top ~~~ -->
            <div class="overlayer"></div>
            <span class="go-top">
                <i class="fas fa-angle-up"></i>
            </span>
            <!-- ~~~ Loader & Go-Top ~~~ -->

<div class="nav-bar">
                <jsp:include page="layout/header.jsp"/>
            </div>


            <!-- ~~~ Hero Section ~~~ -->
            <section class="hero-section banner-overlay bg_img" data-img="../assets/images/banner.png">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Account</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
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
            




            <div class="main-content custom-account">

                <div class="page-content container">
                    <div class="container-fluid">



                        <div class="row">
                            <div class="col-xxl-3">
                                <div class="card mt-n5">
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <div class="profile-user position-relative d-inline-block mx-auto  mb-4">
                                                <img src="<%=loginUser.getImage()%>" class="rounded-circle avatar-xl img-thumbnail user-profile-image  shadow" alt="user-profile-image">
                                                <div class="avatar-xs p-0 rounded-circle profile-photo-edit">
                                                    <input id="profile-img-file-input" type="file" class="profile-img-file-input">
                                                    <label for="profile-img-file-input" class="profile-photo-edit avatar-xs">
                                                        <span class="avatar-title rounded-circle bg-light text-body shadow">
                                                            <i class="ri-camera-fill"></i>
                                                        </span>
                                                    </label>
                                                </div>
                                            </div>
                                            <h5 class="fs-16 mb-1"><%=loginUser.getFullName()%></h5>

                                        </div>
                                    </div>
                                </div>
                                <!--end card-->


                                <!--end card-->
                            </div>
                            <!--end col-->
                            <div class="col-xxl-9">
                                <div class="card mt-xxl-n5">
                                    <div class="card-header">
                                        <ul class="nav nav-tabs-custom rounded card-header-tabs border-bottom-0" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-bs-toggle="tab" href="#personalDetails" role="tab">
                                                    <i class="fas fa-home"></i> Account
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#changePassword" role="tab">
                                                <i class="far fa-user"></i> Change Password
                                            </a>
                                        </li>
                                        </ul>
                                    </div>
                                    <div class="card-body p-4">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="personalDetails" role="tabpanel">
                                            <form action="UpdateUserController" method="POST">
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label for="firstnameInput" class="name">Username</label>
                                                <input type="text" name="fullName" value="<%=loginUser.getFullName()%>" required=""/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label for="emailInput" class="email">Email Address</label>
                                                <input type="text" name="email" value="<%=loginUser.getEmail()%>" required=""/>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label for="JoiningdatInput" class="date">Date</label>
                                                <input type="date" name="dateOfbirth" value="<%=loginUser.getDateOfBirth()%>" required=""/>
                                            </div>
                                        </div>
                                        <li class="list-inline-item edit" data-bs-toggle="tooltip"
                                            data-bs-trigger="hover" data-bs-placement="top"
                                            title="Edit">
                                            <button type="submit" name="action" value="updateUser" class="btn btn-primary">Save Change</button>
                                        </li>    
                                    </form>
                                        </div>
                                        <!--end tab-pane-->
                                        <div class="tab-pane" id="changePassword" role="tabpanel">
                                            <form action="ChangePasswordController" method="POST">
                                        <div class="container">
                                            <div class="row">
                                                
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        <input type="password" class="form-control" name="password" placeholder="Old Password">
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        <input type="password" class="form-control" name="newPassword" id="newpasswordInput" placeholder="New Password">
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        <input type="password" class="form-control" name="confirmNewPassword" id="confirmpasswordInput" placeholder="Confirm Password">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% if (request.getAttribute("msgError") != null) {%>
                                        <div style="color: red;"><%= request.getAttribute("msgError") %></div>
                                        <% }%>
                                        <% if (request.getAttribute("msgSuccess") != null) {%>
                                        <div style="color: green;"><%= request.getAttribute("msgSuccess") %></div>
                                        <% }%>
                                        <li class="list-inline-item edit" data-bs-toggle="tooltip"
                                            data-bs-trigger="hover" data-bs-placement="top"
                                            title="Edit">
                                            <button type="submit" name="action" value="updateUser" class="btn btn-primary">Save Change</button>
                                        </li>    
                                    </form>
                                            
                                        </div>
                                        <!--end tab-pane-->
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <!--end col-->
                        </div>
                        <!--end row-->

                    </div>
                    </div>
                    <!-- container-fluid -->
                </div><!-- End Page-content -->


            </div>
            <!-- end main content-->


            <!-- END layout-wrapper -->

            <jsp:include page="layout/footer.jsp"/>

            <!--start back-to-top-->





        

<!-- JAVASCRIPT -->
<script src="admin/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="admin/assets/libs/simplebar/simplebar.min.js"></script>
<script src="admin/assets/libs/node-waves/waves.min.js"></script>
<script src="admin/assets/libs/feather-icons/feather.min.js"></script>
<script src="admin/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
<script src="admin/assets/js/plugins.js"></script>

<!-- profile-setting init js -->
<script src="admin/assets/js/pages/profile-setting.init.js"></script>

<!-- App js -->
<script src="admin/assets/js/app.js"></script>

</body>

</html>
