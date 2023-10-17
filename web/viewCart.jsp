<%-- 
    Document   : viewCart
    Created on : Oct 16, 2023, 6:14:47 PM
    Author     : HOANG DUNG
--%>

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
            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
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
    </body>
</html>
