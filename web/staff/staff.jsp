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
    <link rel="shortcut icon" href="staff/assets/images/art1.png">

    <!-- jsvectormap css -->
    <link href="staff/libs/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css" />

    <!--Swiper slider css-->
    <link href="staff/assets/libs/swiper/swiper-bundle.min.css" rel="stylesheet" type="text/css" />

    <!-- Layout config Js -->
    <script src="staff/assets/js/layout.js"></script>
    <!-- Bootstrap Css -->
    <link href="staff/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="staff/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="staff/assets/css/app.min.css" rel="stylesheet" type="text/css" />
    <!-- custom Css-->
    <link href="staff/assets/css/custom.min.css" rel="stylesheet" type="text/css" />
     <!-- custom Css-->
    
      <!-- custom Css-->
      
    


</head>

<body>

    <!-- Begin page -->
    <%

        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
    %>
    <div id="layout-wrapper">

        <jsp:include page="layoutstaff//header.jsp"/>

<!-- removeNotificationModal -->
<!-- /.modal -->
        <!-- ========== App Menu ========== -->
        <jsp:include page="layoutstaff//slidebar.jsp"/>

        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">

                    

                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->

            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <script>document.write(new Date().getFullYear())</script> ? ArtCenter.
                        </div>
                        
                    </div>
                </div>
            </footer>
        </div>
        <!-- end main content-->

    </div>
    <!-- END layout-wrapper -->



    <!--start back-to-top-->
    >
    <!--end back-to-top-->

    <!--preloader-->
    
    <div class="customizer-setting d-none d-md-block">
        <div class="btn-info btn-rounded shadow-lg btn btn-icon btn-lg p-2" data-bs-toggle="offcanvas" data-bs-target="#theme-settings-offcanvas" aria-controls="theme-settings-offcanvas">
            <i class='mdi mdi-spin mdi-cog-outline fs-22'></i>
        </div>
    </div>

    <!-- Theme Settings -->
    

    <!-- JAVASCRIPT -->
    <script src="staff/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="staff/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="staff/assets/libs/node-waves/waves.min.js"></script>
    <script src="staff/assets/libs/feather-icons/feather.min.js"></script>
    <script src="staff/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
    <script src="staff/assets/js/plugins.js"></script>

    <!-- apexcharts -->
    <script src="staff/assets/libs/apexcharts/apexcharts.min.js"></script>

    <!-- Vector map-->
    <script src="staff/assets/libs/jsvectormap/js/jsvectormap.min.js"></script>
    <script src="staff/assets/libs/jsvectormap/maps/world-merc.js"></script>

    <!--Swiper slider js-->
    <script src="staff/assets/libs/swiper/swiper-bundle.min.js"></script>

    <!-- Dashboard init -->
    <script src="staff/assets/js/pages/dashboard-ecommerce.init.js"></script>

    <!-- App js -->
    <script src="staff/assets/js/app.js"></script>
</body>

</html>