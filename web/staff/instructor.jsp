<%-- 
    Document   : instructor
    Created on : Nov 14, 2023, 8:14:49 PM
    Author     : PC
--%>

<%@page import="users.UserError"%>
<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
    <head>
        <meta charset="utf-8" />
        <title>ArtCenter - Online Drawing Course</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">


        <!-- Sweet Alert css-->
        <link href="staff/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

        <!-- Layout config Js -->
        <script src="staff/assets/js/layout.js"></script>
        <!-- Bootstrap Css -->
        <link href="staff/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="staff/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="staff/assets/css/app.min.css" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
    </head>
    <style>
        
        .formAdd {
            width: 70%;
            margin-left: 300px;
            border-style: solid;
            background-color: rgb(245 245 245);
            padding: 50px;
            margin-top: 10px;
            float:left;
            border-width: medium;
            padding-bottom: 10px;
        }
        .formAdd h4{
            color: #184785;
            font-size: 38px;
            margin-left: 170px;
        }

    </style>
    <body>
        <!-- Begin page -->
        <jsp:include page="layoutstaff/header.jsp"/>

            <!-- removeNotificationModal -->

            <!-- ========== App Menu ========== -->
            <jsp:include page="layoutstaff/slidebar.jsp"/>
            <!-- Left Sidebar End -->
            <!-- Vertical Overlay-->
            <div class="vertical-overlay"></div>
            <div class="container-fluid">
        <div class="main-content">
            <div class="page-content">
                <ul class="nav nav-tabs" style="margin-bottom: 50px">
                    <li class="nav-item">
                        <a class="nav-link active btn-primary" data-toggle="tab"  href="#addInstructor">Add Instructor Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-primary" data-toggle="tab"  href="#manageInstructor">Manage Instructor Account</a>
                    </li>
                    <form action="MainController" method="POST">
                        <button type="submit" name="action" value="TurnBackStaff">Turn Back</button>
                    </form>
                </ul>   
                        <div class="tab-content">
                            <div class="tab-pane container active" id="addInstructor">
                                <%
                                    UserError userError = (UserError) request.getAttribute("USER_ERROR");
                                %>
                                <div class="formAdd">
                                    <h4>Add Staff Account</h4>
                                    <form action="MainController" method="POST">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="accountID" class="form-label">Account ID</label>
                                                <input type="text" class="form-control" name="accountID" required>
                                                <%if (userError != null) {%> 
                                                <p style="color: red;"><%= userError.getUserIDError()%></p>
                                                <% } %>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="dateOfbirth" class="form-label">Date Of Birth</label>
                                                <input type="date" class="form-control" name="dateOfbirth" required>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="password" class="form-label">Password (default)</label>
                                                <input type="text" class="form-control" name="password" readonly="" value="user123">                                       
                                            </div> 
                                            <div class="form-group col-md-6">
                                                <label for="role" class="form-label">Role</label><br>
                                                <span class="badge badge-soft-primary" style="font-size: 17px;">Instructor</span>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="fullname" class="form-label">Name</label>
                                                <input type="text" class="form-control" name="fullName" required>
                                                <%if (userError != null) {%> 
                                                <p style="color: red;"><%= userError.getFullNameError()%></p>
                                                <% }%>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="email" class="form-label">Email</label><br/>
                                                <input type="text" class="form-control" name="email" required>
                                                <%if (userError != null) {%>
                                                <p style="color: red;"><%= userError.getEmailError()%></p>
                                                <% } %>
                                            </div>
                                        </div> 
                                        <div class="mb-3">
                                            <label for="image" class="form-label">Image</label>
                                            <input type="text" class="form-control" name="image" required>

                                        </div>
                                        <div class="form-row">

                                            <div class="form-group col-md-6">
                                                <%
                                                    String mess = (String) request.getAttribute("MESSAGE");
                                                    String er = (String) request.getAttribute("ERROR");
                                                    if (mess != null) {
                                                %>
                                                <div class="alert alert-success">
                                                    <p><%=mess%></p>
                                                </div> 
                                                <% } else if (er != null) {%>
                                                <div class="alert alert-danger">
                                                    <p><%=er%></p>
                                                </div>    
                                                <% } %>
                                            </div>
                                            <div class="form-group col-md-6" style="margin-left: 85%;">
                                                <input class="btn btn-outline-primary" type="submit" name="action" value="Add Instructor">
                                            </div>



                                        </div>   
                                    </form>   

                                </div>
                            </div>

                            <div class="tab-pane container" id="manageInstructor">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card" id="leadsList">
                                            <div class="card-header border-0">
                                                <%
                                                        String noti = (String) request.getAttribute("MESSAGE1");
                                                        
                                                        if (noti != null) {
                                                            out.print("<h6 style=\"color: green;\">" + noti + "</h6>");
                                                        }
                                                        
                                                        String notiHide = (String) request.getAttribute("MESSAGE2");
                                                        
                                                        if (notiHide != null) {
                                                            out.print("<h6 style=\"color: green;\">" + notiHide + "</h6>");
                                                        }
                                                        
                                                        
                                                %>
                                                <div class="row g-4 align-items-center">
                                                    <div class="col-sm-3">
                                                        
                                                    </div>
                                                    <div class="col-sm-auto ms-auto">
                                                        <div class="hstack gap-2">
                                                            <button class="btn btn-soft-danger" id="remove-actions" onClick="deleteMultiple()"><i class="ri-delete-bin-2-line"></i></button>

                                                            

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div>
                                                    <%
                                                        List<UserDTO> listInstructor = (List<UserDTO>) request.getAttribute("LIST_INSTRUCTOR");
                                                        if (listInstructor != null) {
                                                            if (listInstructor.size() > 0) {
                                                    %>
                                                    <div class="table-responsive table-card">
                                                        <table class="table align-middle" id="customerTable">
                                                            <thead class="table-light">

                                                                <tr>
                                                                    <th scope="col" style="width: 50px;">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="checkAll" value="option">
                                                                        </div>
                                                                    </th>
                                                                    <th  data-sort="counter">No</th>
                                                                    <th  data-sort="accountID">Account ID</th>
                                                                    <th  data-sort="password">Password</th>
                                                                    <th  data-sort="name">Name</th>
                                                                    <th  data-sort="date">Birth Day</th>                                    

                                                                    <th  data-sort="isActive">Active</th>
                                                                    <th  data-sort="role">Role</th>
                                                                    <th  data-sort="email">Email</th>
                                                                    <th data-sort="image">Image</th>
                                                                    <th data-sort="function">Function</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody class="list form-check-all">
                                                                <%
                                                                    int count = 1;

                                                                    for (UserDTO u : listInstructor) {
                                                                        if(u.isIsActive() == true){
                                                                        

                                                                %>
                                                            <form action="MainController" method="POST">
                                                                <tr>
                                                                    <th scope="row">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" name="chk_child" value="option1">
                                                                        </div>
                                                                    </th>
                                                                    <td><%= count++%></td>
                                                                    <!-- <td class="id" style="display:none;"><a href="javascript:void(0);" class="fw-medium link-primary">#VZ2101</a></td>-->
                                                                    <td>
                                                                        <div class="accountID">
                                                                            <input type="hidden" name="accountID" value="<%=u.getAccountID()%>" readonly=""/>
                                                                        </div>
                                                                    </td>
                                                                    <td class="password">
                                                                        <input type="hidden" name="password" value="<%=u.getPassword()%>" readonly=""/>

                                                                    </td>
                                                                    <td class="name">

                                                                        <input type="text" name="fullName" value="<%=u.getFullName()%>" required=""/>
                                                                    </td>
                                                                    <td class="date">
                                                                        <input type="date" id="birthday" name="dateOfbirth" value="<%=u.getDateOfBirth()%>" required=""/>

                                                                    </td>

                                                                    <td class="isActive">
                                                                        <input type="radio" checked="true" name="isActive" value="<%=u.isIsActive()%>" readonly="">
                                                                    </td>
                                                                    <td class="tags">
                                                                        <span class="badge badge-soft-primary">Instructor</span>
                                                                    </td>                                                                
                                                                    <td class="email">
                                                                        <input type="text" name="email" value="<%=u.getEmail()%>" required=""/>

                                                                    </td>
                                                                    <td class="image">
                                                                        <img src="<%=u.getImage()%>" alt="<%=u.getFullName()%>" width="80" height="120">
                                                                        <input name="image" value="<%=u.getImage()%>" type="hidden"/>
                                                                    </td>
                                                                    <td class="function">
                                                                        <ul class="list-inline hstack gap-2 mb-0">
                                                                            <li class="list-inline-item edit" data-bs-toggle="tooltip"
                                                                                data-bs-trigger="hover" data-bs-placement="top"
                                                                                title="Edit">
                                                                                <button type="submit" name="action" value="editInstructor">Edit</button>
                                                                            </li>
                                                                            <li class="list-inline-item" data-bs-toggle="tooltip"
                                                                                data-bs-trigger="hover" data-bs-placement="top"
                                                                                title="Deactive">
                                                                                <button type="submit" name="action" value="hideInstructor">Deactive</button>
                                                                            </li>
                                                                        </ul>
                                                                    </td>

                                                                </tr>

                                                            </form>
                                                            <%
                                                                }
                                                                }
                                                            %>
                                                            </tbody>
                                                        </table>                                                                                                       
                                                        <%
                                                                }
                                                            }
                                                        %> 

                                                    </div>
                                                    <div class="d-flex justify-content-end mt-3">
                                                        <div class="pagination-wrap hstack gap-2">
                                                            <a class="page-item pagination-prev disabled" href="#">
                                                                Previous
                                                            </a>
                                                            <ul class="pagination listjs-pagination mb-0"></ul>
                                                            <a class="page-item pagination-next" href="#">
                                                                Next
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- container-fluid -->
                </div>
            </div>
                
            
    </body>
</html>
