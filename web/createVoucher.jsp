<%-- 
    Document   : createCourse
    Created on : Oct 7, 2023, 1:51:19 PM
    Author     : HOANG DUNG
--%>

<%@page import="order.VoucherError"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Voucher</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url('https://images.unsplash.com/photo-1602566178436-8cf72756f4cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'); 
                background-size: cover; 
                background-repeat: no-repeat; 
                background-attachment: fixed; 
                background-position: center center; 
                color: white;
                padding-top: 30px;
            }

            h1 {
                text-align: center;
                color: black;
            }

            form {
                max-width: 500px;
                margin: 0 auto;
                background-color: rgba(133, 134, 133, 0.8);
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            table {
                width: 100%;
            }

            table td {
                padding: 10px;
            }

            input[type="text"],
            input[type="date"],
            select {
                width: 90%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                background-color: #333;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
                background-color: #555;
            }
        </style>
    </head>
    <body>
        <%
            VoucherError voucherError = (VoucherError) request.getAttribute("VOUCHER_ERROR");
            if(voucherError == null)
                voucherError = new VoucherError();
        %>
    <container>
        <h1>CREATE COUPON</h1>
        <form action="MainController" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Discount Percent</td>
                        <td>
                            <input type="text" name="discountPercent"><br>
                            <%= voucherError.getDiscountPercentError()%>
                        </td>
                    </tr>
                    <tr>
                        <td>Voucher Code</td>
                        <td>
                            <input type="text" name="voucherCode"><br>
                            <%= voucherError.getVoucherCodeError()%>
                        </td>
                    </tr>
                    <tr>
                        <td>Created Day</td>
                        <td><input type="date" id="todayDate1" name="createdDay" readonly=""></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Expired Day</td>
                        <td>
                            <input type="date" id="todayDate2" name="expiredDay"><br>
                            <%= voucherError.getExpiredDayError()%>
                        </td>
                    </tr>
                    <tr>
                        <td><%
                                String message = (String) request.getAttribute("MESSAGE");
                                if(message == null)
                                    message = "";
                            %>
                        </td>
                        <td><%= message%></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="submit" name="action" value="TurnBackStaff">Turn Back</button><span>&nbsp; &nbsp; &nbsp; &nbsp;</span>
                            <button type="submit" name="action" value="CreateVoucher">Create Voucher</button>
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </container> 
    <script>
            document.getElementById("todayDate1").valueAsDate = new Date();
            document.getElementById("todayDate2").valueAsDate = new Date();
        </script>    
    </body>
</html>
