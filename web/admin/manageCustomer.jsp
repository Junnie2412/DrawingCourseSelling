<%-- 
    Document   : manageCustomer
    Created on : Nov 2, 2023, 12:54:02 AM
    Author     : Win 10
--%>

<%@page import="users.UserError"%>
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
        <link rel="shortcut icon" href="../assets/images/art1.png">
        <!-- App favicon -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 

        <!-- Sweet Alert css-->
        <link href="/Wedproject2_temp1/admin/assets/libs/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css" />
        <link href="/Wedproject2_temp1/admin/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
        <link href="/Wedproject2_temp1/admin/assets/libs/swiper/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
        <!-- Layout config Js -->
        <script src="/Wedproject2_temp1/admin/assets/js/layout.js"></script>
        <!-- Bootstrap Css -->
        <link href="/Wedproject2_temp1/admin/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="/Wedproject2_temp1/admin/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="/Wedproject2_temp1/admin/assets/css/app.min.css" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        <link href="/Wedproject2_temp1/admin/assets/css/custom.min.css" rel="stylesheet" type="text/css" />
        <link href="/Wedproject2_temp1/admin/assets/css/bootstrap-rtl.min.css" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        <link href="/Wedproject2_temp1/admin/assets/css/app-rtl.min.css" rel="stylesheet" type="text/css" />
        <style>
            .formAdd {
                width: 90%;

                background-color: rgb(245 245 245);
                padding: 50px;
                margin-top: 10px;
                float:left;
                border-width: medium;
                border: 2px solid graytext;
                border-radius: 10px;
            }
            .formAdd h4{
                color: #184785;
                font-size: 38px;
                margin-left: 230px;
            }
        </style>
    </head>
    <body>      
        <div id="layout-wrapper">
            <div class="container-fluid" style="margin-right: 100px;">
                <jsp:include page="layoutadmin/header.jsp"/>
            </div>

            <jsp:include page="layoutadmin/slidebar.jsp"/>

            <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col">

                                <div class="h-100" style="margin-left: 15%;">
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
                                        <div class="col-xl-3 col-md-6">
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
                                                            <h4 style="margin-left: 85px;color: blue;" class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=numberOfCustomer%>">0</span> </h4>

                                                        </div>

                                                    </div>
                                                </div><!-- end card body -->
                                            </div><!-- end card -->
                                        </div><!-- end col -->

                                        <div class="col-xl-3 col-md-6">
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
                                                            <h4 style="margin-left: 85px;color: green;" class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=numberOfActiveCustomer%>">0</span></h4>                                                            
                                                        </div>                                                      
                                                    </div>
                                                </div><!-- end card body -->
                                            </div><!-- end card -->
                                        </div><!-- end col -->

                                        <div class="col-xl-3 col-md-6">
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
                                                            <h4 style="margin-left: 85px;color: darkturquoise;" class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=customerLearning%>">0</span> </h4>                                                            
                                                        </div>

                                                    </div>
                                                </div><!-- end card body -->
                                            </div><!-- end card -->
                                        </div><!-- end col -->

                                    </div>


                                </div> <!-- end .h-100-->

                            </div> <!-- end col -->

                            <!-- end col -->
                        </div>
                        <%--order tbale --%>
                        <div class="row">
                            <div class="container mt-5">
                                <div class="col" style="margin-left: 0%;">
                                    <ul class="nav nav-tabs custom-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active btn-primary" data-bs-toggle="tab" href="#addCustomer">Add Customer</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link btn-primary" data-bs-toggle="tab" href="#manageCustomer">Manager Customer</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" >
                                        <div class="tab-pane container active" id="addCustomer">
                                            <%
                                                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                                            %>
                                            <div class="formAdd">
                                                <h4>Add Customer Account</h4>
                                                <form action="/Wedproject2_temp1/AddCustomerController" method="POST">
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label for="accountID" class="form-label">Account ID</label>
                                                            <input type="text" class="form-control" name="accountID" required>
                                                            <%if (userError != null) {%> 
                                                            <p style="color: red;"><%= userError.getUserIDError()%></p>
                                                            <% } %>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="dateOfbirth" class="form-label">Date Of Birth</label>
                                                            <input type="date" class="form-control" name="dateOfbirth" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label for="password" class="form-label">Password (default)</label>
                                                            <input type="text" class="form-control" name="password" readonly="" value="user123">                                       
                                                        </div> 
                                                        <div class="form-group col-md-6">
                                                            <label for="role" class="form-label">Role</label><br>
                                                            <span class="badge badge-soft-primary" style="font-size: 17px;">Customer</span>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label for="fullname" class="form-label">Name</label>
                                                            <input type="text" class="form-control" name="fullName" required>
                                                            <%if (userError != null) {%> 
                                                            <p style="color: red;"><%= userError.getFullNameError()%></p>
                                                            <% }%>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="email" class="form-label">Email</label><br/>
                                                            <input type="text" class="form-control" name="email" required>

                                                            <%if (userError != null) {%>
                                                            <p style="color: red;"><%= userError.getEmailError()%></p>
                                                            <% } %>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="image" class="form-label">Image</label>
                                                        <input type="text" class="form-control" name="image" required>
                                                    </div>
                                                    <div class="form-row">

                                                        <div class="form-group col-md-6">
                                                            <%
                                                                String mess = (String) request.getAttribute("MESSAGE_ADD");
                                                                String er = (String) request.getAttribute("ERROR");
                                                                if (mess != null) {
                                                            %>
                                                            <div class="alert alert-success">
                                                                <p><%=mess%></p>
                                                            </div>
                                                            <%
                                                            } else if (er != null) {
                                                            %>
                                                            <div class="alert alert-danger">
                                                                <p><%=er%></p>
                                                            </div>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                        <div class="form-group col-md-6" style="margin-left: 85%;">
                                                            <input class="btn btn-outline-primary" type="submit" name="action" value="Add Customer">
                                                        </div>
                                                    </div>    

                                                </form>   

                                            </div>
                                        </div>
                                        <div class="tab-pane container fade" id="manageCustomer">
                                            <div class="row" style="margin-top: 70px;">                      
                                                <div class="table-responsive table-card ">
                                                    <div>
                                                        <%
                                                            UserError uEr = (UserError) request.getAttribute("USER_ERROR_UPDATE");
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
                                                            <form action="/Wedproject2_temp1/MainController" method="POST">
                                                                <tr>                                               
                                                                    <td><%= count++%></td>

                                                                    <td class="name">

                                                                        <input type="text" name="fullName" value="<%=u.getFullName()%>" required=""/>
                                                                        
                                                                        <p style="color: red;">${requestScope.USER_ERROR_UPDATE.fullNameError}</p>
                                                                        
                                                                    </td>
                                                                    <td class="date">
                                                                        <input type="date" name="dateOfbirth" value="<%=u.getDateOfBirth()%>" required=""/>
                                                                        
                                                                       <%-- <p style="color: red;"><%=uEr.getDateError()%></p> --%>
                                                                        
                                                                    </td>

                                                                    <td class="tags">
                                                                        <span class="badge badge-soft-primary">Customer</span>
                                                                    </td>                                                                
                                                                    <td class="email">
                                                                        <input type="text" name="email" value="<%=u.getEmail()%>" required=""/>
                                                                        
                                                                        <%--<p style="color: red;"><%=uEr.getEmailError()%></p>--%>
                                                                        
                                                                    </td>
                                                                    <td class="image"><img src="<%=u.getImage()%>" alt="<%=u.getFullName()%>" width="80" height="120">
                                                                        <input type="hidden" name="image" value="<%=u.getImage()%>">
                                                                    </td>
                                                                    <td class="function">
                                                                        <ul class="list-inline hstack gap-2 mb-0">
                                                                            <li class="list-inline-item edit" data-bs-toggle="tooltip"
                                                                                data-bs-trigger="hover" data-bs-placement="top"
                                                                                title="Edit">
                                                                                <input type="hidden" name="accountID" value="<%=u.getAccountID()%>">
                                                                                <input type="hidden" name="password" value="<%=u.getPassword()%>">
                                                                                <input class="btn btn-primary" type="submit" name="action" value="Update Customer"/>
                                                                            </li>  
                                                                            <li class="list-inline-item edit" data-bs-toggle="tooltip"
                                                                                data-bs-trigger="hover" data-bs-placement="top"
                                                                                title="Inactive"> 
                                                                                
                                                                                    <input type="hidden" name="accountID" value="<%=u.getAccountID()%>">
                                                                                    <input class="btn btn-danger" type="submit" name="action" value="Inactive Customer"/>
                                                                                


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
                        </div>

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
        </div>

        <script src="/Wedproject2_temp1/admin/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="/Wedproject2_temp1/admin/assets/libs/simplebar/simplebar.min.js"></script>
        <script src="/Wedproject2_temp1/admin/assets/libs/node-waves/waves.min.js"></script>
        <script src="/Wedproject2_temp1/admin/assets/libs/feather-icons/feather.min.js"></script>
        <script src="/Wedproject2_temp1/admin/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
        <script src="/Wedproject2_temp1/admin/assets/js/plugins.js"></script>

        <!-- apexcharts -->
        <script src="/Wedproject2_temp1/admin/assets/libs/apexcharts/apexcharts.min.js"></script>

        <!-- Vector map-->
        <script src="/Wedproject2_temp1/admin/assets/libs/jsvectormap/js/jsvectormap.min.js"></script>
        <script src="/Wedproject2_temp1/admin/assets/libs/jsvectormap/maps/world-merc.js"></script>

        <!--Swiper slider js-->
        <script src="/Wedproject2_temp1/admin/assets/libs/swiper/swiper-bundle.min.js"></script>

        <!-- Dashboard init -->
        <script src="/Wedproject2_temp1/admin/assets/js/pages/dashboard-ecommerce.init.js"></script>

        <!-- App js -->
        <script src="/Wedproject2_temp1/admin/assets/js/app.js"></script>
    </body>
</html>
