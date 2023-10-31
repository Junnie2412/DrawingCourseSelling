<%@page import="java.util.ArrayList"%>
<%@page import="users.UserDTO"%>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

    <head>

        <meta charset="utf-8" />
        <title>ArtCenter - Online Drawing Course</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 

        <!-- Sweet Alert css-->
        <link href="admin/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

        <!-- Layout config Js -->
        <script src="admin/assets/js/layout.js"></script>
        <!-- Bootstrap Css -->
        <link href="admin/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="admin/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="admin/assets/css/app.min.css" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        <link href="admin/assets/css/custom.min.css" rel="stylesheet" type="text/css" />
    </head>
    <style>
    .table-manager-staff {
    background-color: rgba(59, 30, 66, 0.1); 
    
     
}
.table-container {
    display: flex;
    justify-content: flex-end;
}
      #manageStaff {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    
    </style>
    <body>
        
        
        <div class="nav-bar">
           <jsp:include page="layoutadmin/header.jsp"/>
        </div>
        
        
        
        <div id="layout-wrapper">
            
            <jsp:include page="layoutadmin/slidebar.jsp"/>
        </div>

                     

            <div class="container mt-5">
                <ul class="nav nav-tabs justify-content-center" style="margin-top: 80px; margin-bottom: 50px">
                    <li class="nav-item">
                        <a class="nav-link active btn btn-primary" data-bs-toggle="tab" href="#addStaff">Add Staff</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-primary" data-bs-toggle="tab" href="#manageStaff">Manager Staff</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane container active" id="addStaff">
                        <div class="container" style="width: 50%">
                    <form action="MainController" method="POST">
                            <div class="mb-3">
                                <label for="accountID" class="form-label">Account ID</label>
                                <input type="text" class="form-control" name="accountID" required>
                                <p style="color: red;">${requestScope.USER_ERROR.userIDError}</p>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" required>
                                <p style="color: red;">${requestScope.USER_ERROR.passwordError}</p>
                            </div>
                            <div class="mb-3">
                                <label for="confirm" class="form-label">Confirm</label>
                                <input type="password" class="form-control" name="confirm" required>
                                <p style="color: red;">${requestScope.USER_ERROR.confirmError}</p>
                            </div>
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Name</label>
                                <input type="text" class="form-control" name="fullname" required>
                                <p style="color: red;">${requestScope.USER_ERROR.fullNameError}</p>
                            </div>
                            <div class="mb-3">
                                <label for="dateOfbirth" class="form-label">Date Of Birth</label>
                                <input type="date" class="form-control" name="dateOfbirth" required>

                            </div>
                            <div class="mb-3">
                                <label for="isActive" class="form-label">Status</label>
                                <select name="isActive">
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="role" class="form-label">Role</label>
                                <input type="text" class="form-control" name="role" readonly="">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" class="form-control" name="email" required>
                                <p style="color: red;">${requestScope.USER_ERROR.emailError}</p>
                            </div>
                            <div class="mb-3">
                                <label for="image" class="form-label">Image</label>
                                <input type="text" class="form-control" name="image" required>
                            </div>
                            <input class="btn btn-outline-primary" type="submit" name="action" value="Add Staff">
                        </form>   
                    </div>
                </div>
                            <div class="tab-pane container fade" id="manageStaff" style="width: 100%; padding: 0;">
                                <div class="table-responsive table-card">
                                    <div class="w-100">
                        <%
                            ArrayList<UserDTO> staffList = (ArrayList) session.getAttribute("STAFF_LIST");
                            if (staffList != null) {
                                if (staffList.size() > 0) {
                        %>
                        
                            <table class="table  table-manager-staff"  >
                                <thead class="table-light">
                                    <tr>
                                        <th  data-sort="counter">No</th>
                                        
                                        
                                        <th  data-sort="name">Name</th>
                                        <th  data-sort="date">Birth Day</th>                                    
                                        <th  data-sort="isActive">Active</th>
                                        <th  data-sort="role">Role</th>
                                        <th  data-sort="email">Email</th>
                                        <th data-sort="image">Image</th>
                                        <th data-sort="function">Function</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int count = 1;

                                        for (UserDTO u : staffList) {

                                    %>
                                <form action="MainController" method="POST">
                                    <tr>                                               
                                        <td><%= count++%></td>
                                        <!-- <td class="id" style="display:none;"><a href="javascript:void(0);" class="fw-medium link-primary">#VZ2101</a></td>-->
                                        
                                        
                                        <td class="name">

                                            <input type="text" name="fullName" value="<%=u.getFullName()%>" required=""/>
                                        </td>
                                        <td class="date">
                                            <input type="date" name="dateOfbirth" value="<%=u.getDateOfBirth()%>" required=""/>

                                        </td>

                                        <td class="isActive">
                                            <input type="radio" name="isActive" value="<%=u.isIsActive()%>">
                                        </td>
                                        <td class="tags">
                                            <span class="badge badge-soft-primary">Staff</span>
                                        </td>                                                                
                                        <td class="email">
                                            <input type="text" name="email" value="<%=u.getEmail()%>" required=""/>

                                        </td>
                                        <td class="image"><img src="<%=u.getImage()%>" alt="<%=u.getFullName()%>" width="80" height="120">
                                            <input type="hidden" name="image" value="<%=u.getImage()%>">
                                        </td>
                                        <td class="function">
                                            <ul class="list-inline hstack gap-2 mb-0">
                                                <li class="list-inline-item edit" data-bs-toggle="tooltip"
                                                    data-bs-trigger="hover" data-bs-placement="top"
                                                    title="Edit">
                                                    <input type="submit" name="action" value="updateStaff"/>
                                                </li>                                                        
                                            </ul>
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
                        </div>
                    </div>
                </div>
            </div>      
        </div>
         


        <!-- JAVASCRIPT -->
        <script src="admin/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="admin/assets/libs/simplebar/simplebar.min.js"></script>
        <script src="admin/assets/libs/node-waves/waves.min.js"></script>
        <script src="admin/assets/libs/feather-icons/feather.min.js"></script>
        <script src="admin/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
        <script src="admin/assets/js/plugins.js"></script>

        <!-- list.js min js -->
        <script src="admin/assets/libs/list.js/list.min.js"></script>
        <script src="admin/assets/libs/list.pagination.js/list.pagination.min.js"></script>

        <!-- Sweet Alerts js -->
        <script src="admin/assets/libs/sweetalert2/sweetalert2.min.js"></script>
        <!-- crm leads init -->
        <script src="admin/assets/js/pages/crm-leads.init.js"></script>

        <!-- App js -->
        <script src="admin/assets/js/app.js"></script>
    </body>

</html>