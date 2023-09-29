<%-- 
    Document   : courses
    Created on : Sep 25, 2023, 8:34:17 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>ArtCenter - Online Drawing Course</title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/odometer.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/owl.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/main.css">

    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
</head>


<body>



    <div class="all-sections oh">
        <!-- ~~~ Loader & Go-Top ~~~ -->
        <div class="overlayer"></div>
        <div class="loader">
            <div class="inner"></div>
        </div>
        <span class="go-top">
            <i class="fas fa-angle-up"></i>
        </span>
        <!-- ~~~ Loader & Go-Top ~~~ -->


        <jsp:include page="layout/header.jsp"/>


        <!-- ~~~ Hero Section ~~~ -->
        <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-bg.jpg">
            
            <div class="custom-container">
                <div class="hero-content">
                    <h1 class="title uppercase cl-white">Courses</h1>
                    <ul class="breadcrumb cl-white p-0 m-0">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            Courses
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- ~~~ Hero Section ~~~ -->


        <!-- ~~~ Course Section ~~~ -->
        <section class="course-section pt-120 pb-120">
            <div class="container">
                <div class="row align-items-center section-header">
                    <div class="col-lg-7">
                        <div class="section-header left-style mb-low mb-lg-0">
                            <span class="category">TOP COURSES</span>
                            <h2 class="title"><span>Featured</span> Online Courses</h2>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="d-flex flex-wrap justify-content-lg-end m--10">
                            <div class="course-select-item">
                                <select class="select-bar">
                                    <option value="c1">Photoshop</option>
                                    <option value="c2">Webdesign</option>
                                    <option value="c3">English</option>
                                    <option value="c4">History</option>
                                    <option value="c5">Wordpress</option>
                                    <option value="c6">Laravel</option>
                                    <option value="c7">Python</option>
                                    <option value="c8">Javascript</option>
                                </select>
                            </div>
                            <div class="course-select-item">
                                <select class="select-bar">
                                    <option value="o1">Select Order</option>
                                    <option value="o2">Webdesign</option>
                                    <option value="o3">English</option>
                                    <option value="o4">History</option>
                                    <option value="o5">Wordpress</option>
                                    <option value="o6">Laravel</option>
                                    <option value="o7">Python</option>
                                    <option value="o8">Javascript</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-30-none">
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/01.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/02.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/03.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/04.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/05.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/06.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/01.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/02.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="course-details.jsp">
                                    <img src="assets/images/course/03.png" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a href="course-details.jsp">Strategic Social Media & Marketing Policy</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span>Mark Parker</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span>15 Lessons</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>25 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-area">
                                    <div class="ratings cl-theme">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                        <span>(4.9/5.00)</span>
                                    </div>
                                    <div class="price cl-1">
                                        $29.99
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center load-more mt-5">
                    <a href="courses.jsp" class="custom-button theme-one">load more courses <i class="fas fa-angle-right"></i></a>
                </div>
            </div>
        </section>
        <!-- ~~~ Course Section ~~~ -->


        <!-- ~~~ Footer Section ~~~ -->
        <jsp:include page="layout/footer.jsp"/>
        <!-- ~~~ Footer Section ~~~ -->
    </div>


    <script data-cfasync="false" src="../../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>
    
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
