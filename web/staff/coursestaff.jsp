<%-- 
    Document   : courseadmin
    Created on : Oct 14, 2023, 12:54:32 PM
    Author     : Admin
--%>

<%@page import="course.CourseDTO"%>
<%@page import="java.util.List"%>
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
        <link href="staff/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

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
        <jsp:include page="layoutstaff/header.jsp"/>
    <div id="layout-wrapper">
        <jsp:include page="layoutstaff/slidebar.jsp"/>
        <div class="container mt-5">
            <ul class="nav nav-tabs custom-tabs" style="margin-top: 80px; margin-bottom: 50px;">
                <li class="nav-item">
                    <a class="nav-link active btn-primary" data-toggle="tab" href="#Coursewaiting">Courses Waiting</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn-primary" data-toggle="tab" href="#Courseactive">Courses Active</a>
                </li>
            </ul>
        </div>
        <div class="tab-content">
            <%
                List<CourseDTO> listAllCourse = (List<CourseDTO>) request.getAttribute("LIST_ALL_COURSE");
                if (listAllCourse != null) {
                    if (listAllCourse.size() > 0) {
            %>
            <div class="tab-pane container active" id="Coursewaiting" style="margin-right: 150px;">
                <%
                    String noti = (String) request.getAttribute("APPROVED");
                    
                    if (noti != null) {
                        out.print("<h6 style=\"color: green;\">" + noti + "</h6>");
                    } 

                %>
                <table class="table table-manager-staff">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Course ID</th>
                            <th>Name Course</th>
                            <th>Price</th>
                            <th>Instructor</th>
                            <th>Approve</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Fill this section with data for "Courses Waiting" -->
                        <%
                            int count = 1;
                            for(CourseDTO course : listAllCourse){
                                if(course.isIsActive() == false){
                            
                        %>
                    <form action="MainController" method="POST">
                        <tr>
                            <td><%= count++%></td>
                            <td>
                                <input type="text" name="courseID" value="<%= course.getCourseID() %>" readonly=""/>
                            </td>
                            <td>
                                <input type="text" name="name" value="<%= course.getName()%>" readonly=""/>
                            </td>
                            <td>
                                <input type="text" name="price" value="<%= course.getPrice()%>" readonly=""/>
                            </td>
                            <td>
                                <input type="text" name="instructor" value="<%= course.getAccountID()%>" readonly=""/>
                            </td>
                            <td>
                                <button type="submit" name="action" value="ApproveCourse"> Approve</button>
                            </td>
                        </tr>
                    </form>
                        
                        
                        <% 
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
                           
            <div class="tab-pane container " id="Courseactive" style="margin-right: 150px;">
                <%
                    
                    String deactive = (String)request.getAttribute("DEACTIVE");
                    if(deactive != null){
                        out.print("<h6 style=\"color: green;\">" + deactive + "</h6>");
                    }
                %>
                <table class="table table-manager-staff">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Course ID</th>
                            <th>Name Course</th>
                            <th>Price</th>
                            <th>Instructor</th>
                            <th>Deactive</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Fill this section with data for "Courses Active" -->
                        <%
                            int count1 = 1;
                            for(CourseDTO course : listAllCourse){
                                if(course.isIsActive() == true){
                            
                        %>
                        
                        <form action="MainController" method="POST">
                        <tr>
                            <td><%= count1++%></td>
                            <td>
                                <input type="text" name="courseID" value="<%= course.getCourseID() %>" readonly=""/>
                            </td>
                            <td>
                                <input type="text" name="name" value="<%= course.getName()%>" readonly=""/>
                            </td>
                            <td>
                                <input type="text" name="price" value="<%= course.getPrice()%>" readonly=""/>
                            </td>
                            <td>
                                <input type="text" name="instructor" value="<%= course.getAccountID()%>" readonly=""/>
                            </td>
                            <td>
                                <button type="submit" name="action" value="DeactiveCourse">Deactive</button>
                            </td>
                        </tr>
                    </form>
                        
                        <% 
                                }
                            }
                        %>
                    </tbody>
                </table>
                <%
                        }
                    }
                %> 
            </div>
        </div>
        </div>
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
        
    </div>
</body>

</html>

