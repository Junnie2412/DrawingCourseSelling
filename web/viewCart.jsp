<%-- 
    Document   : viewCart
    Created on : Oct 16, 2023, 6:14:47 PM
    Author     : HOANG DUNG
--%>

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
    </head>
    <body>
        <%
            Cart cart = (Cart) session.getAttribute("CART");

            CartDAO cartDAO = new CartDAO();
            CartItemDAO cartItemDAO = new CartItemDAO();

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            List<Date> createdDayList = cartDAO.getlistCreatedDay(loginUser.getAccountID());

            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
        <div>
            <div>
                Date: <%= createdDayList.get(0)%>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (CourseDTO course : cart.getCart().values()) {
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= count++%></td>
                        <td><input type="text" name="name" value="<%=course.getName()%>" readonly=""></td>
                        <td><%= course.getPrice()%>$</td>
                        <td>
                            <input type="submit" name="action" value="Remove">
                            <input type="hidden" name="courseID" value="<%= course.getCourseID()%>">
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

        <%
            if (createdDayList.size() > 0) {
                for (Date createdDay : createdDayList) {
        %>
        <br><div>
            Date: <%= createdDay%>
        </div>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <%
                    List<CartItemDTO> cartItemList = cartItemDAO.getlistCartItem(loginUser.getAccountID(), createdDay);
                    if (cartItemList.size() > 0) {
                        int count = 1;
                        for (CartItemDTO cartItem : cartItemList) {
                            CourseDTO course = cartItemDAO.getCourseFromCartItem(cartItem.getCourseID());
                %>
                <tbody>
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= count++%></td>
                        <td><input type="text" name="name" value="<%=course.getName()%>" readonly=""></td>
                        <td><%= course.getPrice()%>$</td>
                        <td>
                            <input type="submit" name="action" value="Remove">
                            <input type="hidden" name="courseID" value="<%= course.getCourseID()%>">
                        </td>
                    </tr>
                </form>
                </tbody>
                <%
                        }
                    }
                %>
            </table>
        </div>
        <%
                }
            }
        %>
    </body>
</html>
