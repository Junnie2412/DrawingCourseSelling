<%@page import="java.util.ArrayList"%>
<%@page import="cart.CartItemDTO"%>
<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page import="course.CourseDTO"%>
<%@page import="cart.Cart"%>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

    <head>

        <meta charset="utf-8" />
        <title>ArtCenter - Online Drawing Course</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/art1.png">

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
    </head>

    <body>
        <!-- Begin page -->

        <div id="layout-wrapper">
            <section class="hero-section banner-overlay bg_img" data-img="../assets/images/banner/banner.png">
                <div class="container" style="padding: 30px;">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">ART CENTER | <span style="color: red;">Checkout</span></h1>
                        <ul class="breadcrumb cl-white p-0 m-0">
                            <li>
                                <a href="index.jsp">Home</a><br>
                            </li>

                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <div class="vertical-overlay"></div>

        <!-- Start right Content here -->
        <div class="main-content overflow-hidden container">

            <div class="page-content container">
                <div class="container-fluid">

                    <!-- end page title -->
                    <div class="row">
                        <div class="col-xl-7">
                            <div class="card">
                                <div class="card-body checkout-tab">

                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="pills-bill-info" role="tabpanel" aria-labelledby="pills-bill-info-tab">
                                            <div>
                                                <h5 class="mb-1">Billing Information</h5>

                                            </div>


                                            <%
                                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                            %>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <label for="billinginfo-firstName" class="form-label">Full Name</label>
                                                        <input type="text" class="form-control" id="billinginfo-firstName" placeholder="Enter first name" value="<%=loginUser.getFullName()%>">
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <label for="billinginfo-lastName" class="form-label">Account ID</label>
                                                        <input type="text" class="form-control" id="billinginfo-lastName" placeholder="Account ID" value="<%=loginUser.getAccountID()%>" readonly="">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <label for="billinginfo-email" class="form-label">Email</label>
                                                        <input type="email" class="form-control" id="billinginfo-email" placeholder="Enter email" value="<%=loginUser.getEmail()%>">
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <label for="billinginfo-phone" class="form-label">Phone <span class="text-muted">(Optional)</span></label>
                                                        <input type="text" class="form-control" id="billinginfo-phone" placeholder="Enter phone no.">
                                                    </div>
                                                </div>
                                                <div>
                                                    <h5 class="mb-1">Payment </h5>

                                                    <div class="col-sm-3">
                                                        <div class="form-check card-radio">
                                                            <input id="paymentMethod02" name="paymentMethod" type="radio" class="form-check-input" checked>
                                                            <label class="form-check-label" for="paymentMethod02">
                                                                <span class="fs-16 text-muted me-2"><i class="ri-bank-card-fill align-bottom"></i></span>
                                                                <span class="fs-14 text-wrap">VNPAY</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>                                                            
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- end tab content -->
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->

                        <!-- end col -->

                        <div class="col-xl-5">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <h5 class="card-title mb-0">Order Summary</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive table-card">
                                        <%
                                            //List<CartItemDTO> cartItemList = (List<CartItemDTO>) session.getAttribute("CARTITEM");
                                            //if (cartItemList != null) {
                                            //for (CartItemDTO cartItem : cartItemList) {

                                            List<CourseDTO> listCourseCheckout = (List<CourseDTO>) session.getAttribute("LISTBUYCOURSE");
                                            if (listCourseCheckout != null) {
                                                if (listCourseCheckout.size() > 0) {

                                        %>
                                        <table class="table table-borderless align-middle mb-0">
                                            <thead class="table-light text-muted">
                                                <tr>
                                                    <th style="width: 90px;" scope="col">Product</th>
                                                    <th scope="col">Product Info</th>
                                                    <th scope="col" class="text-end">Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%                                                        float total = 0;
                                                    for (CourseDTO c : listCourseCheckout) {
                                                        total += c.getPrice();
                                                %>
                                                <tr>
                                                    <td>
                                                        <div class="avatar-md bg-light rounded p-1">
                                                            <img src="<%=c.getImage()%>" alt="" class="img-fluid d-block">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <h5 class="fs-14"><a href="apps-ecommerce-product-details.html" class="text-dark"><%=c.getName()%></a></h5>
                                                    </td>
                                                    <td class="text-end"><%=c.getPrice()%></td>
                                                </tr>
                                                <%
                                                    }
                                                %>

                                                <tr>
                                                    <td class="fw-semibold" colspan="2">Sub Total :</td>
                                                    <td class="fw-semibold text-end"><%= total%></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <label for="voucher">Voucher:</label>
                                                        <div class="d-flex gap-2">
                                                            <form action="ApplyVoucherController" method="POST">
                                                                <input type="text"  id="voucher" placeholder="Input voucher" name="voucherCode" value="">
                                                                <input type="hidden" name="total" value="<%= total%>">
                                                                <button name="action" value="checkVoucher" class="btn btn-success">Apply</button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <%
                                                    int discount = 0;
                                                    String notice = (String) request.getAttribute("ERROR");
                                                    if (notice != null) {
                                                %>
                                                <tr>
                                            <div>
                                                <td style="color: red;"><%=notice%></td>
                                            </div>
                                            </tr>
                                            <%
                                                }
                                                if (session.getAttribute("DISCOUNT") != null) {
                                                    discount = (int) session.getAttribute("DISCOUNT");
                                                    total = total - discount;
                                                }
                                            %>

                                            <tr>
                                                <td colspan="3" style="height: 20px;"></td>
                                            </tr>

                                            <%
                                                if (discount != 0) {
                                            %>
                                            <tr class="table-active">
                                                <th colspan="2">Discount </th>
                                                <td class="text-end">
                                                    <span class="fw-semibold" style="color: green;font-style: italic;">
                                                        -<%=discount%>
                                                    </span>
                                                </td>
                                            </tr><!-- comment -->
                                            <% }%>
                                            <tr class="table-active">
                                                <th colspan="2">Total (VND) </th>
                                                <td class="text-end">
                                                    <span class="fw-semibold">
                                                        <%= total%>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>    
                                                <% int intTotal = (int) total;%>
                                                <td colspan="3" class="text-end">
                                                    <form action="checkout/vnpay_pay.jsp" method="post">
                                                        <input type="hidden" name="amount" value="<%=intTotal%>">
                                                        <button type="submit" class="btn btn-danger">Go to payment</button>
                                                    </form>                                                       
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <%
                                                    session.setAttribute("total", intTotal);
                                                }
                                            }

                                        %>
                                        <%                                            String error = (String) request.getAttribute("ERROR");
                                            if (error == null) {
                                                error = "";
                                            }
                                        %>

                                    </div>
                                </div>
                                <!-- end card body -->
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                </div>
                <!-- end row -->

            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->


        <!-- end main content-->
        <!-- JAVASCRIPT -->

        <script src="admin/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="admin/assets/libs/simplebar/simplebar.min.js"></script>
        <script src="admin/assets/libs/node-waves/waves.min.js"></script>
        <script src="admin/assets/libs/feather-icons/feather.min.js"></script>
        <script src="admin/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
        <script src="admin/assets/js/plugins.js"></script>

        <!-- init js -->
        <script src="admin/assets/js/pages/ecommerce-product-checkout.init.js"></script>

        <!-- App js -->
        <script src="admin/assets/js/app.js"></script>

    </body>
</html>