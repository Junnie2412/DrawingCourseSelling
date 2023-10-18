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
                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Checkout</h1>
                        <ul class="breadcrumb cl-white p-0 m-0">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Checkout
                            </li>
                        </ul>
                    </div>
                </div>
            </section>


            <!-- removeNotificationModal -->
            <!-- /.modal -->
            <!-- ========== App Menu ========== -->

            <!-- Left Sidebar End -->
            <!-- Vertical Overlay-->
            <div class="vertical-overlay"></div>


            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="main-content overflow-hidden container">

                <div class="page-content" container>
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <h4 class="mb-sm-0">Voucher <span class="voucher-label">Voucher here</span></h4>
                                </div>
                            </div>
                        </div>

                        <!-- end page title -->

                        <div class="row">
                            <div class="col-xl-8">
                                <div class="card">
                                    <div class="card-body checkout-tab">

                                        <form action="#">


                                            <div class="tab-content">
                                                <div class="tab-pane fade show active" id="pills-bill-info" role="tabpanel" aria-labelledby="pills-bill-info-tab">
                                                    <div>
                                                        <h5 class="mb-1">Billing Information</h5>

                                                    </div>

                                                    <div>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="mb-3">
                                                                    <label for="billinginfo-firstName" class="form-label">First Name</label>
                                                                    <input type="text" class="form-control" id="billinginfo-firstName" placeholder="Enter first name" value="">
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <div class="mb-3">
                                                                    <label for="billinginfo-lastName" class="form-label">Last Name</label>
                                                                    <input type="text" class="form-control" id="billinginfo-lastName" placeholder="Enter last name" value="">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="mb-3">
                                                                    <label for="billinginfo-email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                                                                    <input type="email" class="form-control" id="billinginfo-email" placeholder="Enter email">
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <div class="mb-3">
                                                                    <label for="billinginfo-phone" class="form-label">Phone</label>
                                                                    <input type="text" class="form-control" id="billinginfo-phone" placeholder="Enter phone no.">
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <h5 class="mb-1">Payment Selection</h5>
                                                                <p class="text-muted mb-4">Please select and enter your billing information</p>
                                                            </div>
                                                            <div class="row g-4">
                                                                <div class="col-lg-4 col-sm-6">
                                                                    <div data-bs-toggle="collapse" data-bs-target="#paymentmethodCollapse.show" aria-expanded="false" aria-controls="paymentmethodCollapse">
                                                                        <div class="form-check card-radio">
                                                                            <input id="paymentMethod01" name="paymentMethod" type="radio" class="form-check-input">
                                                                            <label class="form-check-label" for="paymentMethod01">
                                                                                <span class="fs-16 text-muted me-2"><i class="ri-paypal-fill align-bottom"></i></span>
                                                                                <span class="fs-14 text-wrap">Paypal</span>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-sm-6">
                                                                    <div data-bs-toggle="collapse" data-bs-target="#paymentmethodCollapse" aria-expanded="true" aria-controls="paymentmethodCollapse">
                                                                        <div class="form-check card-radio">
                                                                            <input id="paymentMethod02" name="paymentMethod" type="radio" class="form-check-input" checked>
                                                                            <label class="form-check-label" for="paymentMethod02">
                                                                                <span class="fs-16 text-muted me-2"><i class="ri-bank-card-fill align-bottom"></i></span>
                                                                                <span class="fs-14 text-wrap">Credit / Debit Card</span>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="collapse show" id="paymentmethodCollapse">
                                                                    <div class="card p-4 border shadow-none mb-0 mt-4">
                                                                        <div class="row gy-3">
                                                                            <div class="col-md-12">
                                                                                <label for="cc-name" class="form-label">Name on card</label>
                                                                                <input type="text" class="form-control" id="cc-name" placeholder="Enter name">
                                                                                <small class="text-muted">Full name as displayed on card</small>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <label for="cc-number" class="form-label">Credit card number</label>
                                                                                <input type="text" class="form-control" id="cc-number" placeholder="xxxx xxxx xxxx xxxx">
                                                                            </div>

                                                                            <div class="col-md-3">
                                                                                <label for="cc-expiration" class="form-label">Expiration</label>
                                                                                <input type="text" class="form-control" id="cc-expiration" placeholder="MM/YY">
                                                                            </div>

                                                                            <div class="col-md-3">
                                                                                <label for="cc-cvv" class="form-label">CVV</label>
                                                                                <input type="text" class="form-control" id="cc-cvv" placeholder="xxx">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="text-muted mt-2 fst-italic">
                                                                        <i data-feather="lock" class="text-muted icon-xs"></i> Your transaction is secured with SSL encryption
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="tab-pane fade" id="pills-finish" role="tabpanel" aria-labelledby="pills-finish-tab">
                                                    <div class="text-center py-5">

                                                        <div class="mb-4">
                                                            <lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon>
                                                        </div>
                                                        <h5>Thank you ! Your Order is Completed !</h5>
                                                        <p class="text-muted">You will receive an order confirmation email with details of your order.</p>

                                                        <h3 class="fw-semibold">Order ID: <a href="apps-ecommerce-order-details.html" class="text-decoration-underline">VZ2451</a></h3>
                                                    </div>
                                                </div>
                                                <!-- end tab pane -->
                                            </div>
                                            <!-- end tab content -->
                                        </form>
                                    </div>
                                    <!-- end card body -->
                                </div>
                                <!-- end card -->
                            </div>
                            <!-- end col -->

                            <div class="col-xl-4">
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
                                                Cart cart = (Cart) session.getAttribute("CART");
                                                if (cart != null) {
                                                    if (cart.getCart().size() > 0) {
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
                                                    <%
                                                        double total = 0;
                                                        for (CourseDTO c : cart.getCart().values()) {
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
                                                                <form action="MainController" method="POST">
                                                                    <input type="text"  id="voucher" placeholder="Input voucher">
                                                                    <button id="applyVoucher" class="btn btn-success">Apply</button>
                                                                </form>

                                                            </div>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" style="height: 20px;"></td>
                                                    </tr>


                                                    <tr class="table-active">
                                                        <th colspan="2">Total (VND) :</th>
                                                        <td class="text-end">
                                                            <span class="fw-semibold">
                                                                $353.15
                                                            </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" class="text-end">
                                                            <form action="MainController" method="POST">
                                                                <button name="action" value="payment" class="btn btn-primary">Pay</button>
                                                            </form>

                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <%
                                                    }
                                                }
                                            %>
                                            <%
                                                String error = (String) request.getAttribute("ERROR");
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
                        <!-- end row -->

                    </div>
                    <!-- container-fluid -->
                </div>
                <!-- End Page-content -->


            </div>
            <jsp:include page="layout/footer.jsp"/>
            <!-- end main content-->

        </div>


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