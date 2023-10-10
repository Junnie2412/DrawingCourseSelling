<%-- 
    Document   : header
    Created on : Sep 25, 2023, 8:26:09 AM
    Author     : Admin
--%>

<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



        <%
            UserDTO loginUser = (UserDTO) session.getAttribute(("LOGIN_USER"));
            if(loginUser == null)
                loginUser = new UserDTO();
            boolean loggedIn = (loginUser == null);
        %>

        <!-- ~~~ Header Section ~~~ -->
        <header>
            <div class="custom-container">
                <div class="header-area">
                    <div class="logo">
                        <a href="index.jsp">
                            <img   height="100" width="100" src="assets/images/logo/logomain.png" alt="logo">
                        </a>
                    </div>
                    <ul class="menu d-none d-lg-flex flex-wrap">
                         <li>
                            <a href="index.jsp">Home</a>
                        </li>
                       
                        <li>
                            <a href="about.jsp">About Us</a>
                        </li>
                        <li>
                            <%
                                if(loginUser.getRole().equals("Admin")){
                            %>
                                <a href="adminCourse.jsp">Courses</a>
                            <%
                                }else if(loginUser.getRole().equals("Customer")){
                            %>
                                <a href="customerCourse.jsp">Courses</a>
                            <%
                                }else if(loginUser.getRole().equals("Instructor")){
                            %>
                                <a href="instructorCourse.jsp">Courses</a>
                            <%
                                }else if(loginUser.getRole().equals("Staff")){
                            %>
                                <a href="staffCourse.jsp">Courses</a>
                            <%
                                }else{
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
                    <form class="course-search-form ml-auto mr-4">
                        <input type="text" name="searchName" value="<%= search%>" placeholder="Search Courses" class="rounded pl-0">
                        <button type="submit" class="rounded" name="action" value="Search"><i class="flaticon-loupe"></i></button>
                    </form> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <% if (!loggedIn) { %>
            
           <a href="signin.jsp" class="custom-button"><i class="fas fa-user"></i><span>Log In</span></a>
        <% }else { %> <a href="signin.jsp" class="custom-button"><i class="fas fa-user"></i><span>Log Out</span></a> <% } %>
                        
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
        
