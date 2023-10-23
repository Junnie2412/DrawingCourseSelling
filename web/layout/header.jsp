<%-- 
    Document   : header
    Created on : Sep 25, 2023, 8:26:09 AM
    Author     : Admin
--%>

<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<%
    UserDTO loginUser = (UserDTO) session.getAttribute(("LOGIN_USER"));
    if (loginUser == null) {
        loginUser = new UserDTO();
    }
%>

<!-- ~~~ Header Section ~~~ -->
<header>
    <style>     
        .btn-grad {
            background-image: linear-gradient(to right, #24C6DC 0%, #514A9D  51%, #24C6DC  100%);
            margin: 10px;
            padding: 15px 10px;
            width: 130px;
            height: 50px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
        }

        .btn-grad:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
        }

        a:hover{
            text-decoration: none;
        }

        .btnfos {
            color: black;
            cursor: pointer;
            display: block;
            font-size: 16px;
            font-weight: 400;
            line-height: 45px;
            max-width: 160px;
            margin: 0 auto 2em;
            position: relative;
            text-transform: uppercase;
            vertical-align: middle;
            width: 100%;
            transition: 1s;
        }

        .btnfos-1 {
            margin-top: 20px;
            background: #ebecec;
            text-align: center;
            font-weight: 100;
        }
        .btnfos-1 svg {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 45px;
        }
        .btnfos-1 rect {
            fill: none;
            stroke: black;
            stroke-width: 1;
            stroke-dasharray: 422, 0;
        }

        .btnfos-1:hover {
            background: #ebecec;
            letter-spacing: 1px;
            font-weight: 500;
            transition: 1s;
        }
        .btnfos-1:hover rect {
            stroke-width: 5;
            stroke-dasharray: 15, 310;
            stroke-dashoffset: 48;
            -webkit-transition: all 1.35s cubic-bezier(0.19, 1, 0.22, 1);
            transition: all 1.35s cubic-bezier(0.19, 1, 0.22, 1);
        }

        .course-search-form input {
            height: 40px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            background: #ebecec;
            color: black;
        }

        .course-search-form input.rounded {
            -webkit-border-radius: 31px !important;
            -moz-border-radius: 31px !important;
            border-radius: 40px !important;
        }

        .course-search-form button {
            width: 30px;
            height: 30px;
            font-size: 15px;
            color: #ebecec;
            background: #07294D;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            position: absolute;
            right: -1px;
            bottom: 5px;
            outline: none;
            border: none;
        }

        .course-search-form button.rounded {
            -webkit-border-radius: 20px !important;
            -moz-border-radius: 20px !important;
            border-radius: 20px !important;

        }

        .course-search-form .select-bar {
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            height: 52px;
            position: absolute;
            top: 5px;
            left: 5px;
            width: 133px;
        }

        .course-search-form .select-bar.rounded {
            -webkit-border-radius: 26px !important;
            -moz-border-radius: 26px !important;
            border-radius: 26px !important;
        }

        .course-search-form .select-bar .list {
            max-height: 200px;
            overflow-y: auto;
        }

        .course-search-form .select-bar .list .option {
            padding-top: 0;
            padding-bottom: 0;
        }

        .course-search-form .select-bar .list .option.selected {
            font-weight: 500;
        }

        .course-search-form .select-bar::after {
            right: 20px;
            width: 8px;
            height: 8px;
            border-color: #d6ae7b;
        }

        .course-search-form .select-bar .current {
            line-height: 50px;
            color: #d6ae7b;
        }
    </style>
    <div class="custom-container">
        <div class="header-area">
            <div class="logo">
                <a href="index.jsp" style="text-decoration: none; color: black; margin-left: 30px; font-size: 20px;">
                    Art Center
                </a>
            </div>
            <ul class="menu d-none d-lg-flex flex-wrap" style="padding-top: 20px">
                <li>
                    <a href="index.jsp">Home</a>
                </li>

                <li>
                    <a href="about.jsp">About Us</a>
                </li>
                <li>
                    <%
                        if (loginUser.getRole().equals("Admin")) {
                    %>
                    <a href="adminCourse.jsp">Courses</a>
                    <%
                    } else if (loginUser.getRole().equals("Customer")) {
                    %>
                    <a href="courses.jsp">Courses</a>
                    <%
                    } else if (loginUser.getRole().equals("Instructor")) {
                    %>
                    <a href="instructorCourse.jsp">Courses</a>
                    <%
                    } else if (loginUser.getRole().equals("Staff")) {
                    %>
                    <a href="staffCourse.jsp">Courses</a>
                    <%
                    } else {
                    %>
                    <a href="courses.jsp">Courses</a>
                    <%
                        }
                    %>
                </li>
                <li>
                    <a href="instructor.jsp">Instructor</a>

                </li>
                <li>
                    <a href="gallery.jsp">Gallery</a>

                </li>
                <li>
                    <a href="blog.jsp">Blogs</a>

                </li>
                <li>
                    <a href="contact.jsp">Contact</a>
                </li>
            </ul>
            <div class="header-bar ml-4">
                <span></span>
                <span></span>
                <span></span>
            </div>

            <%
                String search = request.getParameter("searchName");
                if (search == null) {
                    search = "";
                }

            %> 
            <form class="course-search-form ml-auto mr-4" method="post" action="MainController?action=Search">
                <input type="text" name="searchName" value="<%= search%>" placeholder="Search Courses" class="rounded pl-0">
                <button type="submit" class="rounded" value="Search"><i class="flaticon-loupe"></i></button>
            </form> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%
                if (loginUser.getRole() == "") {
            %>
            <a class="btnfos btnfos-1" href="signin.jsp">
                <svg>
                <rect x="0" y="0" fill="none" width="100%" height="100%"/>
                </svg>
                Login
            </a> 
            <% } else {
            %>  
            <div class="user-info dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="<%=loginUser.getImage()%>" class="user-avatar" class="user-avatar">
                </a>
                <div class="dropdown-menu" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="courses.jsp">View Course</a>
                    <a class="dropdown-item" href="Editaccount.jsp">Manage your Account</a>
                    <a class="dropdown-item" href="viewCart.jsp">View Cart</a>
                    <a class="dropdown-item" href="MainController?action=SignOut">Logout</a>
                </div>
            </div>           
            <% }%>

        </div>
    </div>
</header>
<!-- ~~~ Header Section ~~~ -->

<!-- ~~~ Mobile Menu ~~~ -->
<div class="mobile-menu">
    <span class="close-mobile-menu">
        <i class="fas fa-times"></i>
    </span>
    <div class="w-100 d-flex flex-wrap justify-content-center align-items-center">
        <form class="course-search-form mr-sm-4">
            <select class="select-bar rounded">
                <option value="01">Category</option>
                <option value="02">Physics</option>
                <option value="03">Chemistry</option>
                <option value="04">History</option>
                <option value="05">Geometry</option>
                <option value="06">LoremIp</option>
                <option value="07">UI/UX</option>
                <option value="08">Laravel</option>
            </select>
            <input type="text" name="name" placeholder="Search Courses" class="rounded">
            <button type="submit" class="rounded"><i class="flaticon-loupe"></i></button>
        </form>
        <a href="#0" class="custom-button"><i class="fas fa-user"></i><span>Sign Up</span></a>
        <div class="w-100 d-lg-none">
            <ul class="menu">
                <li>
                    <a href="#0">Home</a>
                    <ul class="submenu">
                        <li>
                            <a href="index.jsp">Home 1</a>
                        </li>
                        <li>
                            <a href="index2.jsp">Home 2</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="about.jsp">About Us</a>
                </li>
                <li>
                    <a href="#0">Courses</a>
                    <ul class="submenu">
                        <li>
                            <a href="courses.jsp">Courses</a>
                        </li>
                        <li>
                            <a href="course-details.jsp">Course Details</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#0">Pages</a>
                    <ul class="submenu">
                        <li>
                            <a href="instructor.jsp">Instructor</a>
                        </li>
                        <li>
                            <a href="gallery.jsp">Gallery</a>
                        </li>
                        <li>
                            <a href="events.jsp">Event</a>
                        </li>
                        <li>
                            <a href="upcoming-events.jsp">Upcoming Events</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#0">Blog</a>
                    <ul class="submenu">
                        <li>
                            <a href="blog.jsp">Blogs</a>
                        </li>
                        <li>
                            <a href="blog-details.jsp">Blog Details</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="contact.jsp">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</div>

