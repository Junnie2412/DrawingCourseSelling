<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="course.BillDTO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructor bill</title>

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
        <style>
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
    </head>
    <body>
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

            <%
                CourseDAO cd = new CourseDAO();

                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

                List<BillDTO> data = cd.getBillOfInstructor(user.getAccountID());
            %>

            <div class="nav-bar">
                <jsp:include page="layout/header.jsp"/>
            </div>
            <div style="min-height: 80vh;">
                <h1 class="text-center">Bill</h1>
                <div class="d-flex justify-content-center">
                    <table class="table" style="width: 80vw;">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Price</th>
                                <th scope="col">Course name</th>
                                <th scope="col">User Buy</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (BillDTO bill : data) {%>
                            <tr>
                                <td scope="row"><%= bill.getOrderDetailID()%></td>
                                <td scope="row"><%= bill.getQuantity()%></td>
                                <td scope="row"><%= bill.getPrice()%></td>
                                <td scope="row"><%= bill.getCourseName()%></td>
                                <td scope="row"><%= bill.getFullName()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>

            <jsp:include page="layout/footer.jsp"/>
        </div>

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
