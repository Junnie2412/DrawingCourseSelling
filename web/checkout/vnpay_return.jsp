<%@page import="email.SendEmail"%>
<%@page import="cart.CartItemDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="order.TransactionDTO"%>
<%@page import="java.sql.Date"%>
<%@page import="course.CourseDTO"%>
<%@page import="users.UserDTO"%>
<%@page import="course.CourseDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="com.vnpay.common.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="/Wedproject2_temp1/assets/jquery-1.11.3.min.js"></script>
        <link href="../assets/css/custom.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/all.min.css">
        <link rel="stylesheet" href="../assets/css/animate.css">
        <link rel="stylesheet" href="../assets/css/odometer.css">
        <link rel="stylesheet" href="../assets/css/nice-select.css">
        <link rel="stylesheet" href="../assets/css/owl.min.css">
        <link rel="stylesheet" href="../assets/css/magnific-popup.css">
        <link rel="stylesheet" href="../assets/css/flaticon.css">
        <link href="../assets/css/main2.css" rel="stylesheet" type="text/css"/>

        <link rel="shortcut icon" href="../assets/images/art1.png" type="image/x-icon"> 
    </head>
    <style>
        .nav-bar {
            height: 100px;
            width: 1600px;
        }
        .learning-button {
            margin-top: 15px;
        }
    </style>


    <body>

        <jsp:include page="../layout/header.jsp"/>

        <div id="layout-wrapper">
            <section class="hero-section banner-overlay bg_img" data-img="assets/images/hinhnen.png" style="height: 290px; display: flex; align-items: center;">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white" style="margin: 0 auto;">Payment Result</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="../index.jsp">Home</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </section>

        </div>


        <div class="main-content container custom-billing ">
            <div class="page-content">
                <div class="container-fluid">

                    <div class="row">              
                        <div class="col-xl-7">
                            <div class="card">
                                <div class="card-body checkout-tab">
                                    <%
                                        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

                                        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                        SendEmail.send(loginUser.getEmail(), "Check Your Order Right Now", "<h3>Your Order On ArtCenter</h3>"
                                                + "<img src=\"https://i.etsystatic.com/37593498/c/1920/1080/0/0/il/8fe1cb/4204255055/il_340x270.4204255055_3r7q.jpg\">"
                                                + "<p>Thank your for your order</p>");

                                        int totalInt = (int) session.getAttribute("total");
                                        //Begin process return from VNPAY
                                        Map fields = new HashMap();
                                        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                                            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                                            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                                            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                                                fields.put(fieldName, fieldValue);
                                            }
                                        }

                                        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
                                        if (fields.containsKey("vnp_SecureHashType")) {
                                            fields.remove("vnp_SecureHashType");
                                        }
                                        if (fields.containsKey("vnp_SecureHash")) {
                                            fields.remove("vnp_SecureHash");
                                        }
                                        String signValue = Config.hashAllFields(fields);

                                    %>
                                    <!--Begin display -->
                                    <div class="container">

                                        <div class="header clearfix">
                                            <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
                                        </div>
                                        <div class="table-responsive alert alert-success">
                                            <div class="form-group">
                                                <label >Mã giao dịch thanh toán:</label>
                                                <label><%=request.getParameter("vnp_TxnRef")%></label>
                                            </div>    
                                            <div class="form-group">
                                                <label >Số tiền: VND</label>
                                                <% String soTien = request.getParameter("vnp_Amount");
                                                    int soTienInt = Integer.parseInt(soTien);
                                                    soTienInt = soTienInt / 100;
                                                %>
                                                <label><%=soTienInt%></label>
                                            </div>                                              
                                            <div class="form-group">
                                                <label >Ngân hàng thanh toán:</label>
                                                <label><%=request.getParameter("vnp_BankCode")%></label>
                                            </div> 
                                            <div class="form-group">
                                                <label >Thời gian thanh toán:</label>
                                                <label><%=request.getParameter("vnp_PayDate")%></label>
                                            </div> 
                                            <div class="form-group">
                                                <label >Tình trạng giao dịch:</label>
                                                <label>
                                                    <%
                                                        if (signValue.equals(vnp_SecureHash)) {
                                                            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                                                out.print("Thành công");
                                                            } else {
                                                                out.print("Không thành công");
                                                            }

                                                        } else {
                                                            out.print("invalid signature");
                                                        }
                                                    %></label>
                                            </div> 
                                        </div>
                                        <p>
                                            &nbsp;
                                        </p>

                                    </div>  

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive table-card">
                                        <%
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
                                                <%
                                                    for (CourseDTO c : listCourseCheckout) {

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
                                                    <td colspan="3" style="height: 20px;"></td>
                                                </tr>
                                                <tr class="table-active">
                                                    <th colspan="2">Total (VND) </th>
                                                    <td class="text-end">
                                                        <span class="fw-semibold">
                                                            <%= totalInt%>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <%
                                                }
                                            }
                                            String transactionID = request.getParameter("vnp_TxnRef");
                                            String bankName = request.getParameter("vnp_BankCode");
                                            int amount = soTienInt;
                                            boolean flag = false;
                                            String voucherCode = (String) session.getAttribute("VOUCHERCODE");
                                            if (signValue.equals(vnp_SecureHash)) {
                                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                                    flag = true;
                                                }
                                            }
                                            boolean status = flag;
                                            //
                                            TransactionDTO trans = new TransactionDTO();
                                            trans.setTransactionID(transactionID);
                                            trans.setBankName(bankName);
                                            trans.setStatus(status);
                                            trans.setAmount(amount);
                                            //
                                            CourseDAO dao = new CourseDAO();
                                            boolean check = dao.inserOrder(user, listCourseCheckout, trans, totalInt, voucherCode);
                                            if (check) {
                                                // cart clear
                                                CartItemDAO cartDao = new CartItemDAO();
                                                for (CourseDTO course : listCourseCheckout) {
                                                    cartDao.removeCartItem(user.getAccountID(), course.getCourseID());
                                                }

                                        %>
                                        <a href="/Wedproject2_temp1/learning.jsp" class=" btn-md btn-viewCourse slide_right learning-button"><span style="text-align: center;border-radius: 25px;">LEARNING</span> <i class="fa fa-book" aria-hidden="true"></i></a>
                                            <%                                            }
                                            %>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>

</html>
