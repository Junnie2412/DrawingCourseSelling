
<%@page import="java.text.DecimalFormat"%>
<%@page import="order.PaymentDTO"%>
<%@page import="course.CourseDTO"%>
<%@page import="order.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="order.OrderDTO"%>
<%@page import="course.CourseDAO"%>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

    <head>

        <meta charset="utf-8" />
        <title>ArtCenter - Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <link rel="shortcut icon" href="../assets/images/art1.png">

        <!-- jsvectormap css -->
        <link href="/Wedproject2_temp1/admin/assets/libs/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css" />

        <!--Swiper slider css-->
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
        <!-- custom Css-->
        <link href="/Wedproject2_temp1/admin/assets/css/bootstrap-rtl.min.css" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        <link href="/Wedproject2_temp1/admin/assets/css/app-rtl.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!-- Begin page -->
        <div id="layout-wrapper">
            <div style="margin-right: 100px">

                <jsp:include page="layoutadmin/header.jsp"/>
            </div>

            <!-- removeNotificationModal -->
            <div id="removeNotificationModal" class="modal fade zoomIn" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="NotificationModalbtn-close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mt-2 text-center">
                                <lord-icon src="https://cdn.lordicon.com/gsqxdxog.json" trigger="loop" colors="primary:#f7b84b,secondary:#f06548" style="width:100px;height:100px"></lord-icon>
                                <div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
                                    <h4>Are you sure ?</h4>
                                    <p class="text-muted mx-4 mb-0">Are you sure you want to remove this Notification ?</p>
                                </div>
                            </div>
                            <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                                <button type="button" class="btn w-sm btn-light" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn w-sm btn-danger" id="delete-notification">Yes, Delete It!</button>
                            </div>
                        </div>

                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!-- ========== App Menu ========== -->

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
                                        CourseDAO dao = new CourseDAO();
                                        float profit = dao.getProfit();
                                        int numOrder = dao.getNumOrder();
                                        int numOfCustomers = dao.getNumOfCustomers();
                                    %>                                    
                                    <div class="row">
                                        <div class="col-xl-3 col-md-6">
                                            <!-- card -->
                                            <div class="card card-animate">
                                                <div class="card-body">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-grow-1 overflow-hidden">
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0"> Total Earnings</p>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <h5 class="text-success fs-14 mb-0">
                                                                <i class="ri-arrow-right-up-line fs-13 align-middle"></i> +16.24 %
                                                            </h5>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                                        <div>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=profit%>">0</span>VND </h4>
                                                            <a href="#" class="text-decoration-underline">View net earnings</a>
                                                        </div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-success rounded fs-3">
                                                                <i class="bx bx-dollar-circle"></i>
                                                            </span>
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
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0">Orders</p>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <h5 class="text-danger fs-14 mb-0">
                                                                <i class="ri-arrow-right-down-line fs-13 align-middle"></i> -3.57 %
                                                            </h5>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                                        <div>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=numOrder%>">0</span></h4>
                                                            <a href="#" class="text-decoration-underline">View all orders</a>
                                                        </div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-info rounded fs-3">
                                                                <i class="bx bx-shopping-bag"></i>
                                                            </span>
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
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0">Customers</p>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <h5 class="text-success fs-14 mb-0">
                                                                <i class="ri-arrow-right-up-line fs-13 align-middle"></i> +29.08 %
                                                            </h5>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                                        <div>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=numOfCustomers%>">0</span> </h4>
                                                            <a href="#" class="text-decoration-underline">See details</a>
                                                        </div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-warning rounded fs-3">
                                                                <i class="bx bx-user-circle"></i>
                                                            </span>
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
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0"> My Balance</p>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <h5 class="text-muted fs-14 mb-0">
                                                                +0.00 %
                                                            </h5>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                                        <div>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="<%=profit%>">0</span>VND </h4>
                                                            <a href="#" class="text-decoration-underline">Withdraw money</a>
                                                        </div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-danger rounded fs-3">
                                                                <i class="bx bx-wallet"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div><!-- end card body -->
                                            </div><!-- end card -->
                                        </div><!-- end col -->
                                    </div> <!-- end row-->


                                </div> <!-- end .h-100-->
                            </div>
                        </div> <!-- end col -->
                        <div class="row" style="width: 80%;border: 3px;border-radius: 30px;">
                            <div class="col-xl-7">
                                <table class="table table-borderless align-middle mb-0">
                                    <thead class="table-light text-muted">
                                        <tr>
                                            <td scope="col-sm-2">Course</td>
                                            <th scope="col-sm-4">Course name</th>
                                            <th scope="col-sm-3" colspan="2">Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            DecimalFormat formatter = new DecimalFormat("###,###,###");
                                            int orderID = Integer.parseInt(request.getParameter("orderID"));
                                            OrderDAO orDao = new OrderDAO();
                                            CourseDAO cDao = new CourseDAO();
                                            List<CourseDTO> courseOrder = orDao.getCourseByOrderID(orderID);
                                            if (courseOrder != null) {
                                                for (CourseDTO c : courseOrder) {
                                        %>
                                        <tr>
                                            <td class="col-sm-3">
                                                <img src="<%= cDao.getDescription(c.getCourseID()).getImage()%>" alt="course" width="75%">
                                            </td>
                                            <td class="col-sm-5">
                                                <h6 class="fs-14"><a href="apps-ecommerce-product-details.html" class="text-dark"><%=c.getName()%></a></h6>
                                            </td>
                                            <td class="col-sm-5"><%=formatter.format(c.getPrice())%><span></span> VND</td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>                
                                        <tr>
                                            <td colspan="3" style="height: 20px;"></td>
                                        </tr>        
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-5">
                                <%
                                    PaymentDTO pm = orDao.getPaymentInforByOrderID(orderID);
                                    int amountPayment = (int) pm.getAmount();
                                    if (pm != null) {
                                %>
                                <div class="container">

                                    <div class="header clearfix">
                                        <h4 class="text-muted">TRANSACTION INFOR</h4>
                                    </div>
                                    <div class="table-responsive">
                                        <div class="form-group">
                                            <label >Transaction number:</label>
                                            <label><%=pm.getNumTransaction()%></label>
                                        </div>  
                                        <div class="form-group">
                                            <label >Amount:</label>
                                            <label><%=formatter.format(amountPayment)%></label>
                                        </div> 
                                        <div class="form-group">
                                            <label >Bank:</label>
                                            <label><%=pm.getProvider()%></label>
                                        </div> 
                                        <div class="form-group">
                                            <label >Status:</label>
                                            <%
                                                if (pm.isStatus()) {
                                            %>
                                            <td><span class="badge badge-pill badge-success">Success</span></td>
                                            <%
                                            } else {
                                            %>
                                            <td><span class="badge badge-pill badge-danger">Fail</span></td>
                                            <%
                                                }
                                            %>
                                        </div> 
                                        <div class="form-group">
                                            <label>Date transaction:</label>
                                            <label><%=pm.getCreatedAt()%></label>
                                        </div> 
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <!-- end col -->
                        </div>
                        <%--order tbale --%>


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
            <button onclick="topFunction()" class="btn btn-danger btn-icon" id="back-to-top">
                <i class="ri-arrow-up-line"></i>
            </button>


            <!-- JAVASCRIPT -->

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