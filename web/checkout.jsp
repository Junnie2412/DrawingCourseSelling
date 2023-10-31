<%@page import="course.CourseDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cart.CartItemDTO"%>
<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page import="course.CourseDTO"%>
<%@page import="cart.Cart"%>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <title>ArtCenter - Online Drawing Course</title>

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/owl.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/main2.css">

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">   
    </head>
    <style>
        .banner-overlay::before {
            left: 0;
            bottom: 0;
            top: 0;
            right: 0;
            background: rgba(59, 65, 66, 0.5);
        }

        #order-summary {

            width: 100%;
            height: 600px; 
        }

        #billing-information {

            width: 100%;
            height: 450px; 

        }

        .payment-method {
            display: flex;
            align-items: center;
            width: 200px;     

        }

        .payment-icon {
            margin-right: 5px;
        }

        .payment-text {
            font-size: 14px;
            font-weight: bold;
            color: #333; 
        }    

        .page-container {
            background-color: rgba(59, 65, 66, 0.1); 
        }
        .section-title {
            font-weight: bold;
            font-size: 18px;
            color: #333; /* M�u ch? */
            margin-bottom: 10px; /* Kho?ng c�ch d??i */
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
    </style>
    <body onload="loadPage()">
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

            <section class="hero-section banner-overlay bg_img" data-img="https://images.unsplash.com/photo-1589758438368-0ad531db3366?auto=format&fit=crop&q=80&w=1632&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Check Out</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Check Out
                            </li>
                        </ul>
                    </div>
                </div>
            </section>


            <!-- Start right Content here -->
            <div class="main-content overflow-hidden container custom-billing "> 

                <div class="page-content">
                    <div class="container-fluid">

                        <!-- end page title -->
                        <div class="row">
                            <div class="col-xl-5">
                                <div class="card" id="billing-information">
                                    <div class="card-body checkout-tab">

                                        <div class="tab-content">
                                            <div class="tab-pane fade show active" id="pills-bill-info" role="tabpanel" aria-labelledby="pills-bill-info-tab">
                                                <div>
                                                    <h5 class="mb-1 section-title">Billing Information</h5>

                                                </div>

                                                <div>
                                                    <%
                                                        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                                    %>
                                                    <div class="row">
                                                        <div >
                                                            <div class="mb-3">
                                                                <label for="billinginfo-firstName" class="form-label" style="font-weight: bold; margin-top: 30px">Full Name</label>
                                                                <input type="text" class="form-control" id="billinginfo-firstName" placeholder="Enter first name" value="<%=loginUser.getFullName()%>">
                                                            </div>
                                                        </div>


                                                    </div>

                                                    <div class="row">
                                                        <div >
                                                            <div class="mb-3">
                                                                <label for="billinginfo-email" class="form-label" style="font-weight: bold">Email</label>
                                                                <input type="email" class="form-control" id="billinginfo-email" placeholder="Enter email" value="<%=loginUser.getEmail()%>">
                                                            </div>
                                                        </div>

                                                        <div >
                                                            <div class="mb-3">
                                                                <label for="billinginfo-phone" class="form-label" style="font-weight: bold">Phone <span class="text-muted">(Optional)</span></label>
                                                                <input type="text" class="form-control" id="billinginfo-phone" placeholder="Enter phone no.">
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <h5 class="mb-3" style="margin-top: 30px">Payment Method</h5>

                                                            <div class="col-sm-6">
                                                                <div class="form-check card-radio">
                                                                    <input id="paymentMethod02" name="paymentMethod" type="radio" class="form-check-input" checked>
                                                                    <label for="paymentMethod02" class="form-check-label">
                                                                        <div class="payment-method">
                                                                            <span class="payment-icon"><i class="ri-bank-card-fill align-bottom fs-18"></i></span>
                                                                            <span class="payment-text">VNPAY</span>
                                                                        </div>
                                                                    </label>
                                                                </div>
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

                            <div class="col-xl-7">
                                <div class="card" id="order-summary">
                                    <div class="card-header" style="background-color: rgba(88,100,125,255)">
                                        <div class="d-flex">
                                            <div class="flex-grow-1">
                                                <h5 class="card-title mb-0 section-title" style="color: white">Order Summary</h5>
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

                                                        <th scope="col">Product Info</th>
                                                        <th scope="col" class="text-end" colspan="2">Price</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%                                                       
                                                        float total = 0;
                                                        for (CourseDTO c : listCourseCheckout) {
                                                            total += c.getPrice();
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <h6 class="fs-14"><a href="apps-ecommerce-product-details.html" class="text-dark"><%=c.getName()%></a></h6>
                                                        </td>
                                                        <td class="text-end" colspan="2"><input type="hidden" name="priceList" value="<%=c.getPrice()%>"><span name="priceValue"></span> VND</td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>

                                                    <tr>
                                                        <td class="fw-semibold" colspan="2">Sub Total :</td>
                                                        <td class="fw-semibold text-end"><span id="subTotal"></span> VND</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="1">
                                                            <label for="voucher">Voucher:</label>
                                                            <div style="overflow: hidden;">
                                                                <form action="ApplyVoucherController" method="POST">
                                                                    <input type="text" style="width: 300px; float: left;" id="voucher" placeholder="Input voucher" name="voucherCode" value="">
                                                                    <button name="action" value="checkVoucher" class="btn btn-success" style="float: right; position: relative; top: -20px;  width: 100px; ">Apply</button>
                                                                    <div style="clear: both;"></div>
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
                                                            - <%=discount%>
                                                        </span>
                                                    </td>
                                                </tr><!-- comment -->
                                                <% }%>
                                                <tr class="table-active" style="background-color: rgba(88,100,125,255); color: white">
                                                    <th colspan="2">Total</th>
                                                    <td class="text-end">
                                                        <span class="fw-semibold">
                                                            <span id="total"></span> VND
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
            <jsp:include page="layout/footer.jsp"/>

        </div>

        <script>
            function loadPage() {
                var input = document.getElementsByName("priceList");
                var tmp = 0;
                for (var i = 0; i < input.length; i++) {
                    tmp = parseFloat(input[i].value);
                    document.getElementsByName("priceValue")[i].innerHTML = Intl.NumberFormat().format(tmp.toFixed(3));
                }
                
                var total = 0;
                for (var i = 0; i < input.length; i++) {
                    total += parseFloat(input[i].value);
                }
                document.getElementById("subTotal").innerHTML = Intl.NumberFormat().format(total.toFixed(3));
                
                var total = 0;
                for (var i = 0; i < input.length; i++) {
                    total += parseFloat(input[i].value);
                }
                document.getElementById("total").innerHTML = Intl.NumberFormat().format(total.toFixed(3));
            }
        </script>


        <script data-cfasync="false" src="../../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/magnific-popup.min.js"></script>

        <script src="assets/js/odometer.min.js"></script>
        <script src="assets/js/viewport.jquery.js"></script>
        <script src="assets/js/nice-select.js"></script>
        <script src="assets/js/owl.min.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>