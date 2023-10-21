<%-- 
    Document   : staff
    Created on : Oct 14, 2023, 3:14:36 PM
    Author     : PC
--%>

<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Page</title>
   
    </head>
    <body>
        <h1>Management System (Staff)</h1>
        <form action="MainController" method="POST">
            <input type="button" name="action" value="Show"/>
        </form>
        
        <%
        List<UserDTO> listInstructor = (List<UserDTO> )request.getAttribute("LIST_INSTRUCTOR");
        if(listInstructor != null){
            if(listInstructor.size() > 0){
        %>

        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Instructor ID</th>
                    <th>Full Name</th>
                    <th>Password</th>
                    <th>Date of Birth</th>
                    <th>isActive</th>
                    <th>Image</th>
                    <th>Email</th>

                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO ins : listInstructor) {
                %>
            <form action="MainController">
                <tr>
                    <td><%=count++%></td>
                    <td>
                        <input type="text" name="InstructorID" value="<%=  ins.getAccountID() %>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="Full name" value="<%=  ins.getFullName() %>" readonly=""/>
                    </td>
                    <td><%=ins.getPassword()%></td>
                    <td>
                        <input type="text" name="Date of Birth" value="<%=  ins.getDateOfBirth() %>" readonly=""/>
                    </td>
                    <td>
                        <input type="radio" checked="true" name="Active" value="<%= ins.isIsActive() %>" required=""/>
                    </td>
                    <td>
                        <img src="<%= ins.getImage() %>"
                    </td>
                    <td>
                        <input type="text" name="Email" value="<%=  ins.getEmail() %>" readonly=""/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value=""/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
        
        <%
            }   
        }
        %>
    </body>
</html>
