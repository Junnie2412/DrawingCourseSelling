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
        <link href="admin/assets/css/custom.min.css" rel="stylesheet" type="text/css" />     
    </head>
    
    <body>
        <div class="vertical-overlay"></div>
        <div class="main-content overflow-hidden container">
            <div class="page-content container">
                <div class="container-fluid">
                    <div class="row">
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
                                                <%                                        float total = 0;
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
                                                    <td colspan="3" style="height: 20px;"></td>
                                                </tr>
                                                <tr class="table-active">
                                                    <th colspan="2">Total (VND) </th>
                                                    <td class="text-end">
                                                        <span class="fw-semibold">
                                                            <%= total%>
                                                        </span>
                                                    </td>
                                                </tr>
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
                        <div class="col-xl-7">
                            <div class="card">
                                <div class="card-body checkout-tab">
                                    <%
                                        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
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
                                        ////
                                        CourseDAO dao = new CourseDAO();
                                        boolean check = dao.inserOrder(user, listCourseCheckout);

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
                                                <label><%=request.getParameter("vnp_Amount")%></label>
                                            </div>  
                                            <div class="form-group">
                                                <label >Mô tả giao dịch:</label>
                                                <label><%=request.getParameter("vnp_OrderInfo")%></label>
                                            </div> 
                                            <%--   <div class="form-group">
                                                    <label >Mã lỗi thanh toán:</label>
                                                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                                                </div> --%>
                                            <div class="form-group">
                                                <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                                                <label><%=request.getParameter("vnp_TransactionNo")%></label>
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
                                        <footer class="footer">
                                            <p>&copy; VNPAY 2020</p>
                                        </footer>
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
