<%-- 
    Document   : manageCustomer
    Created on : Nov 2, 2023, 12:54:02 AM
    Author     : Win 10
--%>

<%@page import="users.UserDAO"%>
<%@page import="users.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

    <head>

        <meta charset="utf-8" />
        <title>ArtCenter - Online Drawing Course</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 

        <!-- Sweet Alert css-->
        <link href="admin/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

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
    </head>
    <body>
        <div id="layout-wrapper">
            <div style="margin-right: 100px">

                <jsp:include page="layoutadmin/header.jsp"/>
            </div>
            <jsp:include page="layoutadmin/slidebar.jsp"/>

            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col">

                                <div class="h-100">
                                    <div class="row mb-3 pb-1">
                                        <div class="col-12">
                                            <div class="d-flex align-items-lg-center flex-lg-row flex-column"> 
                                            </div><!-- end card header -->
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                    <%
                                        UserDAO dao = new UserDAO();
                                        int numberOfCustomer = dao.getNumberOfCustomer();
                                        int numberOfActiveCustomer = dao.getNumberOfActiveCustomer();
                                        int customerLearning = dao.getCustomerLearning();
                                    %>                                    
                                    <div class="row">
                                        <div class="col-xl-4 col-md-6">
                                            <!-- card -->
                                            <div class="card card-animate">
                                                <div class="card-body">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-grow-1 overflow-hidden">
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0"> TOTAL USERS</p>
                                                        </div>

                                                    </div>
                                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                                        <div>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=numberOfCustomer%>">0</span>VND </h4>

                                                        </div>

                                                    </div>
                                                </div><!-- end card body -->
                                            </div><!-- end card -->
                                        </div><!-- end col -->

                                        <div class="col-xl-4 col-md-6">
                                            <!-- card -->
                                            <div class="card card-animate">
                                                <div class="card-body">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-grow-1 overflow-hidden">
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0">ACTIVE MEMBERS</p>
                                                        </div>

                                                    </div>
                                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                                        <div>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=numberOfActiveCustomer%>">0</span></h4>                                                            
                                                        </div>                                                      
                                                    </div>
                                                </div><!-- end card body -->
                                            </div><!-- end card -->
                                        </div><!-- end col -->

                                        <div class="col-xl-4 col-md-6">
                                            <!-- card -->
                                            <div class="card card-animate">
                                                <div class="card-body">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-grow-1 overflow-hidden">
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0">New customer in month</p>
                                                        </div>

                                                    </div>
                                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                                        <div>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=customerLearning%>">0</span> </h4>                                                            
                                                        </div>

                                                    </div>
                                                </div><!-- end card body -->
                                            </div><!-- end card -->
                                        </div><!-- end col -->

                                    </div> <!-- end row-->
                                </div> <!-- end .h-100-->
                            </div> <!-- end col -->
                            <div class="table-responsive table-card " style="margin-left: 110px;">
                                <div>
                                    <%
                                        ArrayList<UserDTO> cusList = (ArrayList) session.getAttribute("CUSTOMER_LIST");
                                        if (cusList != null) {
                                            if (cusList.size() > 0) {
                                    %>

                                    <table class="table  table-manager-staff"  >
                                        <thead class="table-light">
                                            <tr>
                                                <th  data-sort="counter">No</th>
                                                <th  data-sort="name">Name</th>
                                                <th  data-sort="date">Birth Day</th>                                    
                                                <th  data-sort="isActive">Active</th>
                                                <th  data-sort="role">Role</th>
                                                <th  data-sort="email">Email</th>
                                                <th data-sort="image">Image</th>
                                                <th data-sort="function">Function</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 1;

                                                for (UserDTO u : cusList) {

                                            %>
                                        <form action="MainController" method="POST">
                                            <tr>                                               
                                                <td><%= count++%></td>

                                                <td class="name">

                                                    <input type="text" name="fullName" value="<%=u.getFullName()%>" required=""/>
                                                </td>
                                                <td class="date">
                                                    <input type="date" name="dateOfbirth" value="<%=u.getDateOfBirth()%>" required=""/>

                                                </td>

                                                <td class="isActive">
                                                    <input type="radio" name="isActive" value="<%=u.isIsActive()%>">
                                                </td>
                                                <td class="tags">
                                                    <span class="badge badge-soft-primary">Customer</span>
                                                </td>                                                                
                                                <td class="email">
                                                    <input type="text" name="email" value="<%=u.getEmail()%>" required=""/>

                                                </td>
                                                <td class="image"><img src="<%=u.getImage()%>" alt="<%=u.getFullName()%>" width="80" height="120">
                                                    <input type="hidden" name="image" value="<%=u.getImage()%>">
                                                </td>
                                                <td class="function">
                                                    <ul class="list-inline hstack gap-2 mb-0">
                                                        <li class="list-inline-item edit" data-bs-toggle="tooltip"
                                                            data-bs-trigger="hover" data-bs-placement="top"
                                                            title="Edit">
                                                            <input type="submit" name="action" value="Update Customer"/>
                                                        </li>                                                        
                                                    </ul>
                                                </td>
                                            </tr>
                                        </form>
                                        <%
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
                    </div>
                </div>
            </div>    
        </div>
        <script src="admin/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="admin/assets/libs/simplebar/simplebar.min.js"></script>
        <script src="admin/assets/libs/node-waves/waves.min.js"></script>
        <script src="admin/assets/libs/feather-icons/feather.min.js"></script>
        <script src="admin/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
        <script src="admin/assets/js/plugins.js"></script>

        <!-- apexcharts -->
        <script src="admin/assets/libs/apexcharts/apexcharts.min.js"></script>

        <!-- Vector map-->
        <script src="admin/assets/libs/jsvectormap/js/jsvectormap.min.js"></script>
        <script src="admin/assets/libs/jsvectormap/maps/world-merc.js"></script>

        <!--Swiper slider js-->
        <script src="admin/assets/libs/swiper/swiper-bundle.min.js"></script>

        <!-- Dashboard init -->
        <script src="admin/assets/js/pages/dashboard-ecommerce.init.js"></script>

        <!-- App js -->
        <script src="admin/assets/js/app.js"></script>
    </body>
</html>
