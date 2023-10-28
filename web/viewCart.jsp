<%-- 
    Document   : viewCart
    Created on : Oct 16, 2023, 6:14:47 PM
    Author     : HOANG DUNG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="course.DescriptionDTO"%>
<%@page import="course.CourseDAO"%>
<%@page import="cart.CartItemDTO"%>
<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="cart.CartItemDAO"%>
<%@page import="cart.CartDAO"%>
<%@page import="cart.Cart"%>
<%@page import="course.CourseDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/owl.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <!-- Pheasant Buttons -->
        <!-- Pheasant Demure Buttons Reset: Optional -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons-reset.css" type="text/css" media="all" />
        <!-- Pheasant Demure Buttons Layout: Optional -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons-layout.css" type="text/css" media="all" />
        <!-- Pheasant Demure Buttons: Required -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons.css" type="text/css" media="all" />
        <link href="assets/css/main2.css" rel="stylesheet" type="text/css"/>

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">

        <style>
            .banner-overlay::before {
                left: 0;
                bottom: 0;
                top: 0;
                right: 0;
                background: rgba(59, 65, 66, 0.5);
            }

            .btn-viewCourse {
                background-color: #ebecec;
                color: black;
                border-radius: 0px;
                padding: 18px 36px;
                display: inline-block;
                font-family: "Lucida Console", Monaco, monospace;
                font-size: 14px;
                letter-spacing: 1px;
                cursor: pointer;
                box-shadow: inset 0 0 0 0 #eacda3;
                -webkit-transition: ease-out 0.4s;
                -moz-transition: ease-out 0.4s;
                transition: ease-out 0.7s;
            }

            .slide_right:hover {
                color: black;
                box-shadow: inset 400px 0 0 0 #eacda3;
            }

            .btn-createAccount {
                background-color: #eacda3;
                color: black;
                border-radius: 0px;
                padding: 18px 36px;
                display: inline-block;
                font-family: "Lucida Console", Monaco, monospace;
                font-size: 14px;
                letter-spacing: 1px;
                cursor: pointer;
                box-shadow: inset 0 0 0 0 #eacda3;
                -webkit-transition: ease-out 0.4s;
                -moz-transition: ease-out 0.4s;
                transition: ease-out 0.7s;
            }

            .slide_right2:hover {
                color: black;
                box-shadow: inset 400px 0 0 0 #ebecec;
            }

            .banner-button-area{
                display: flex;
            }

            .nav-bar{
                width: 100vw;
                background-color: white;
            }

            .bg-banner{
                height: 570px;
            }

            .feature-item {
                border: 2px solid black;
            }

            .feature-item1{
                background-color: rgba(230, 211, 154, 0.1);
            }

            .shopping-cart-container{
                padding: 60px;
                background-color: rgba(59, 65, 66, 0.1);
            }

            table th{
                padding: 20px;
                text-align: center;
            }

            table td{
                padding: 20px;
                text-align: center;
            }

            .shopping-cart{
                width: 1100px;
                padding: 40px;
                border: 2px solid gray;
                margin: 0 auto;
                border-radius: 5px;
                background-color: white;
            }

            table{
                margin: 0 auto;
            }

            .button-2{
                float: right;
            }

            .playground {
                text-align: center;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: flex;
            }

            button {
                transition: all .5s ease-out;
            }

            .turn-back-button{
                margin-top: 20px;
                margin-left: 20px;
                font-size: 14px;
                width: 60px;
                height: 60px;
                color: white;
                border-radius: 8px;
                background: linear-gradient(to right, rgb(88,100,125) 50%, rgba(221,168,75,255) 50%);
                background-size: 200% 100%;
                background-position: left;
            }

            .turn-back-button:hover{
                color: black;
                background-position: right;
            }

            .checkout-button{
                margin-top: 20px;
                margin-left: 20px;
                font-size: 14px;
                width: 60px;
                height: 60px;
                color: white;
                border-radius: 8px;
                background: linear-gradient(to right, rgba(221,168,75,255) 50%, rgb(88,100,125) 50%);
                background-size: 200% 100%;
                background-position: right bottom;
                transition: all .5s ease-out;
            }

            .checkout-button:hover{
                color: black;
                background-position: left bottom;
            }

        </style>
    </head>
    <body onload="loadPage()">
        <div class="nav-bar">
            <jsp:include page="layout/header.jsp"/>
        </div>

        <section class="hero-section banner-overlay bg_img" data-img="https://images.unsplash.com/photo-1528399783831-8318d62d10e5?auto=format&fit=crop&q=80&w=1374&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">

            <div class="custom-container">
                <div class="hero-content">
                    <h1 class="title uppercase cl-white">Shopping Cart</h1>
                    <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            Shopping Cart
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <form action="MainController" method="POST" style="position: absolute">
            <div class="play-ground">
                <button  class="turn-back-button" type="submit" name="action" value="TurnBack"><i class="fa fa-duotone fa-arrow-left"></i></button>
            </div>
        </form>

        <div class="shopping-cart-container">
            <div class="shopping-cart">

                <!-- use DAO -->
                <%
                    List<CourseDTO> listCou = new ArrayList<>();
                    Cart cart = (Cart) session.getAttribute("CART");

                    CartItemDAO cartItemDAO = new CartItemDAO();
                    CourseDAO courseDAO = new CourseDAO();

                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

                    if (cart != null) {
                        if (cart.getCart().size() > 0) {
                %>
                <div class="table-shopping-cart">
                    <div style="font-weight: bold; color: white; background-color: rgb(88,100,125); padding: 10px">
                        Buy Now
                    </div>
                    <table>
                        <thead>
                            <tr style="color: rgb(226,135,67)">
                                <th></th>
                                <th>No</th>
                                <th>Image</th>
                                <th style="width: 400px;">Name</th>
                                <th>Price</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for (CourseDTO course : cart.getCart().values()) {
                                    listCou.add(course);
                            %>
                        <form action="MainController" method="POST">
                            <tr style="border-top: 2px solid gray;">
                                <td><input name="price" value="<%= course.getPrice()%>" type="checkbox" checked onclick="calculation()"></td>
                                <td><%= count++%></td>
                                <td><img style="width: 100px; height: 100px" src="<%=courseDAO.getDescription(course.getCourseID()).getImage()%>"></td>
                                <td style="text-align: left; font-weight: bold"><%=course.getName()%></td>
                                <td style="font-weight: bold"><input name="cartPrice" value="<%= course.getPrice()%>" type="hidden"><span name="cartPriceValue"></span> VND</td>
                                <td>
                                    <a style="color: black; font-size: 15px" href="MainController?action=Remove&courseID=<%=course.getCourseID()%>"><i class="fa fa-light fa-trash"></i></a>
                                </td>
                            </tr>
                        </form>

                        <%
                            }
                        %>

                        </tbody>
                    </table>
                </div>
                <%
                        }

                    }
                %>
                <br><br>
                <div class="table-shopping-cart">
                    <div style="font-weight: bold; color: white; background-color: rgb(88,100,125); padding: 10px">
                        Waiting to Buy
                    </div>
                    <table>
                        <thead>
                            <tr style="color: rgb(226,135,67)">
                                <td></td>
                                <th>No</th>
                                <th>Image</th>
                                <th style="width: 400px;">Name</th>
                                <th>Price</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <%
                            List<CartItemDTO> cartItemList = cartItemDAO.getlistCartItem(loginUser.getAccountID());
                            if (cartItemList.size() > 0) {
                                int count = 1;
                                for (CartItemDTO cartItem : cartItemList) {
                                    CourseDTO course = cartItemDAO.getCourseFromCartItem(cartItem.getCourseID());
                                    if (cart == null || !cart.getCart().containsKey(course.getCourseID())) {
                                        listCou.add(course);
                        %>
                        <tbody>
                        <form action="MainController" method="POST">
                            <tr style="border-top: 2px solid gray;">
                                <td><input type="checkbox" onclick="calculation()" name="price" value="<%= (int) course.getPrice()%>"></td>
                                <td><%= count++%></td>
                                <td><img style="width: 100px; height: 100px" src="<%=courseDAO.getDescription(course.getCourseID()).getImage()%>"></td>
                                <td style="text-align: left; font-weight: bold"><%=course.getName()%>"</td>
                                <td style="font-weight: bold"><input type="hidden" name="priceList" value="<%=course.getPrice()%>"><span name="priceValue"></span> VND</td>
                                <td>
                                    <a style="color: black; font-size: 15px" href="MainController?action=Remove&courseID=<%=course.getCourseID()%>"><i class="fa fa-light fa-trash"></i></a>
                                </td>
                            </tr>
                        </form>
                        </tbody>
                        <%
                                    }
                                }
                                session.setAttribute("LISTBUYCOURSE", listCou);
                            }
                        %>
                    </table>
                </div>
                <br>
                <div style="text-align: right">
                    <div class="total" style="font-weight: bold; font-size: 20px">
                        Total: <span id="result"></span> VND
                    </div>
                    <div class="play-ground">
                        <a href="checkout.jsp"><button class="checkout-button" style="width: 150px; font-weight: bold"> Check Out &nbsp; <i class="fa fa-regular fa-money-check"></i></button></a>
                    </div>
                </div>
            </div>
        </div>

        <script>

            function loadPage() {

                var input = document.getElementsByName("cartPrice");
                var total = 0;
                for (var i = 0; i < input.length; i++) {
                    total += parseFloat(input[i].value);
                }
                document.getElementById("result").innerHTML = Intl.NumberFormat().format(total.toFixed(3));

                var tmp1 = 0;
                for (var i = 0; i < input.length; i++) {
                    tmp1 = parseFloat(input[i].value);
                    document.getElementsByName("cartPriceValue")[i].innerHTML = Intl.NumberFormat().format(tmp1.toFixed(3));
                }

                var input2 = document.getElementsByName("priceList");
                var tmp2 = 0;
                for (var i = 0; i < input2.length; i++) {
                    tmp2 = parseFloat(input2[i].value);
                    document.getElementsByName("priceValue")[i].innerHTML = Intl.NumberFormat().format(tmp2.toFixed(3));
                }
            }

            function calculation() {
                var input = document.getElementsByName("price");
                var total = 0;
                for (var i = 0; i < input.length; i++) {
                    if (input[i].checked) {
                        total += parseFloat(input[i].value);
                    }
                }
                document.getElementById("result").innerHTML = Intl.NumberFormat().format(total.toFixed(3));
            }
        </script>


        <script data-cfasync="false" src="../../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"></script>
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
