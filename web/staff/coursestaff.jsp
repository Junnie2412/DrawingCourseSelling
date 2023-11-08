<%-- 
    Document   : courseadmin
    Created on : Oct 14, 2023, 12:54:32 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="users.UserDTO"%>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

    <head>

        
        =======
        <meta charset="utf-8" />
        <title>ArtCenter - Online Drawing Course</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">
        

        <!-- Sweet Alert css-->
        <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

        <!-- Layout config Js -->
        <script src="assets/js/layout.js"></script>
        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        <link href="assets/css/custom.min.css" rel="stylesheet" type="text/css" />
         
        
        


    </head>
    <style>
        .table-manager-staff {
            background-color: rgba(59, 65, 66, 0.1);
    border: 1px solid #ddd;
    border-collapse: collapse;
    width: 100%;

        }
       

        .custom-tabs {
            display: flex; /* Hi?n th? các ph?n t? theo chi?u ngang */
            justify-content: flex-start;
            margin-left: 50px;/* ??a các ph?n t? ra bên trái */
        }

        .nav-item {
            margin-right: 10px; /* T?o kho?ng cách gi?a các ph?n t? */
        }
        .formAdd {
            width: 70%; 
            margin-left: 300px;
            border-style: solid;
            background-color: rgb(245 245 245);
            padding: 50px;
            margin-top: 10px;
            float:left;
            border-width: medium;
        }
        .formAdd h4{
            color: #184785;
            font-size: 38px;
            margin-left: 170px;
        }

    </style>

    <body>
    <jsp:include page="layoutadmin/header.jsp"/>
    <div id="layout-wrapper">
        <jsp:include page="layoutadmin/slidebar.jsp"/>
        <div class="container mt-5">
            <ul class="nav nav-tabs custom-tabs" style="margin-top: 80px; margin-bottom: 50px;">
                <li class="nav-item">
                    <a class="nav-link active btn-primary" data-bs-toggle="tab" href="#Coursewaiting">Courses Waiting</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn-primary" data-bs-toggle="tab" href="#Courseactive">Courses Active</a>
                </li>
            </ul>
        </div>
        <div class="tab-content">
            <div class="tab-pane container active" id="Coursewaiting" style="margin-right: 150px;">
                <table class="table table-manager-staff">
                    <thead>
                        <tr>
                            <th>Course ID</th>
                            <th>Name Course</th>
                            <th>Price</th>
                            <th>Instructor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Fill this section with data for "Courses Waiting" -->
                    </tbody>
                </table>
            </div>
            <div class="tab-pane container" id="Courseactive" style="margin-right: 150px;">
                <table class="table table-manager-staff">
                    <thead>
                        <tr>
                            <th>Course ID</th>
                            <th>Name Course</th>
                            <th>Price</th>
                            <th>Instructor</th>
                            <th>Active</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Fill this section with data for "Courses Active" -->
                    </tbody>
                </table>
            </div>
        </div>
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
        <script src="assets/libs/feather-icons/feather.min.js"></script>
        <script src="assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
        <script src="assets/js/plugins.js"></script>

        <!-- list.js min js -->
        <script src="assets/libs/list.js/list.min.js"></script>
        <script src="assets/libs/list.pagination.js/list.pagination.min.js"></script>

        <!-- Sweet Alerts js -->
        <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
        <!-- crm leads init -->
        <script src="assets/js/pages/crm-leads.init.js"></script>

        <!-- App js -->
        <script src="assets/js/app.js"></script>
        
    </div>
</body>

</html>

