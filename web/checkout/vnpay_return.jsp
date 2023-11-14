
<%@page import="learningCourse.LearningCourseDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
        <title>CHECKOUT | NOTICE</title>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
                                        DecimalFormat formatter = new DecimalFormat("###,###,###");
                                        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

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
                                            <h3 class="text-muted" class="text-success">Payment Information</h3>
                                        </div>
                                        <div class="table">
                                            <div class="form-group">
                                                <label >Transaction number:</label>
                                                <label><%=request.getParameter("vnp_TxnRef")%></label>
                                            </div>    
                                            <div class="form-group">
                                                <label >Amount:</label>
                                                <% String soTien = request.getParameter("vnp_Amount");
                                                    int soTienInt = Integer.parseInt(soTien);
                                                    soTienInt = soTienInt / 100;
                                                %>
                                                <label><%=formatter.format(soTienInt)%></label><lebel>VND</lebel>
                                            </div>                                              
                                            <div class="form-group">
                                                <label >Bank:</label>
                                                <label><%=request.getParameter("vnp_BankCode")%></label>
                                            </div> 
                                            <div class="form-group">
                                                <label >Created at:</label>
                                                <%
                                                    String d = request.getParameter("vnp_PayDate");
                                                    DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
                                                    DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");

                                                    // Parse the input string as a LocalDateTime object
                                                    LocalDateTime dateTime = LocalDateTime.parse(d, inputFormat);

                                                    // Format the LocalDateTime object as a new string
                                                    String outputString = dateTime.format(outputFormat);
                                                %>
                                                <label><%=outputString%></label>
                                            </div> 
                                            <div class="form-group">
                                                <label>Status payment:</label>

                                                <%
                                                    if (signValue.equals(vnp_SecureHash)) {
                                                        if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {

                                                %>
                                                <label><span class="badge bg-success">Success</span></label>
                                                <%                                                    } else {
                                                %>
                                                <label><span class="badge bg-danger">Danger</span></label>
                                                <%
                                                        }

                                                    } else {
                                                        out.print("invalid signature");
                                                    }
                                                %>
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
                                            String voucherCode = (String) session.getAttribute("VOUCHERCODE");
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
                                                    CourseDAO cDao = new CourseDAO();
                                                    for (CourseDTO c : listCourseCheckout) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <div class="avatar-md bg-light rounded p-1">
                                                            <img src="<%= cDao.getDescription(c.getCourseID()).getImage()%>" alt="" class="img-fluid d-block">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <h5 class= text-primary fs-14"><a href="apps-ecommerce-product-details.html" class="text-dark"><%=c.getName()%></a></h5>
                                                    </td>
                                                    <td class="text-end"><%=formatter.format(c.getPrice())%></td>
                                                </tr>
                                                <%
                                                    }
                                                %>                                 
                                                <tr>
                                                    <td colspan="3" style="height: 20px;"></td>
                                                </tr>
                                                <tr >
                                                    <th colspan="2">Voucher:  </th>
                                                    <td class="text-end">
                                                        <% if (voucherCode != null) {%>
                                                        <span class="bg-success">
                                                            <%
                                                                if(voucherCode == null){
                                                                    voucherCode = "";
                                                                }
                                                            %>
                                                            <%=voucherCode%>
                                                        </span>
                                                        <% }%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">Total (VND) </th>
                                                    <td class="text-end">
                                                        <span class="fw-semibold">
                                                            <%= formatter.format(totalInt)%>
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
                                                LearningCourseDAO learningCourseDAO = new LearningCourseDAO();
                                                for (CourseDTO course : listCourseCheckout) {
                                                    LocalDate currentDate = LocalDate.now();
                                                    LocalDate futureDate = currentDate.plusMonths(4);
                                                    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                                    String expiredDay = futureDate.format(formatter2);
                                                    learningCourseDAO.createLearningCourse(true, expiredDay,course.getCourseID(), user.getAccountID());
                                                }

                                                // cart clear
                                                CartItemDAO cartDao = new CartItemDAO();
                                                for (CourseDTO course : listCourseCheckout) {
                                                    cartDao.removeCartItem(user.getAccountID(), course.getCourseID());
                                                }

                                        %>
                                        <a href="/Wedproject2_temp1/LearningController" class=" btn-md btn-viewCourse slide_right learning-button"><span style="text-align: center;border-radius: 25px;">LEARNING</span> <i class="fa fa-book" aria-hidden="true"></i></a>
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
