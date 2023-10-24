<%-- 
    Document   : gallery
    Created on : Sep 25, 2023, 8:35:06 AM
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
        <link rel="stylesheet" href="assets/css/main2.css">

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">
        <style>
            .nav-bar{
                width: 100vw;
                background-color: rgba(59, 65, 66, 0.1);
            }
            .banner-overlay::before {
                left: 0;
                bottom: 0;
                top: 0;
                right: 0;
                background: rgba(59, 65, 66, 0.5);
            }
        </style>
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


            <div class="nav-bar">
                <jsp:include page="layout/header.jsp"/>
            </div>


            <!-- ~~~ Hero Section ~~~ -->
            <section class="hero-section banner-overlay bg_img" data-img="https://images.unsplash.com/photo-1578926078640-668b1fb75403?auto=format&fit=crop&q=80&w=1366&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Gallery</h1>
                        <ul class="breadcrumb cl-white p-0 m-0 bg-transparent">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Gallery
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->


            <!-- ~~~ Gallery Section ~~~ -->
            <section class="gallery-section pt-120 pb-120">
                <div class="container">
                    <div class="d-flex flex-wrap align-items-center mb-5 mb-sm-5">
                        <div class="gallery-header-left">
                            <h2 class="title">Let's See Our <span class="cl-theme fw-400">Gallery</span></h2>
                        </div>
                        <div class="gallery-header-right">
                            <p>Let's see how the paintings of the students who have registered to study at the Art Center look like: the works are painted very meticulously and carefully by the students.</p>
                        </div>
                    </div>
                    <div class="m--15">
                        <div class="grid-area">
                            <div class="grid-item item--lg">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1584285405429-136bf988919c?auto=format&fit=crop&q=80&w=1473&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1584285405429-136bf988919c?auto=format&fit=crop&q=80&w=1473&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://i.pinimg.com/originals/1f/0a/2f/1f0a2f6f47d3738e115b9d2fc7522bd8.jpg" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://i.pinimg.com/originals/1f/0a/2f/1f0a2f6f47d3738e115b9d2fc7522bd8.jpg" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1584278773680-8d940a213dcf?auto=format&fit=crop&q=80&w=1480&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1584278773680-8d940a213dcf?auto=format&fit=crop&q=80&w=1480&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://www.everwallpaper.co.uk/cdn/shop/collections/kid_s_room_wallpaper.jpg?v=1660119168" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://www.everwallpaper.co.uk/cdn/shop/collections/kid_s_room_wallpaper.jpg?v=1660119168" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1575995872537-3793d29d972c?auto=format&fit=crop&q=80&w=1448&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1575995872537-3793d29d972c?auto=format&fit=crop&q=80&w=1448&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item item--lg">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1581343109298-4a103c86d940?auto=format&fit=crop&q=80&w=1412&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1581343109298-4a103c86d940?auto=format&fit=crop&q=80&w=1412&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>

                            <div class="grid-item item--lg">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1581342995886-14044cadee77?auto=format&fit=crop&q=80&w=1555&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1581342995886-14044cadee77?auto=format&fit=crop&q=80&w=1555&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://i.pinimg.com/564x/11/f0/46/11f046e43f3beecfd6b37b9d90f94616.jpg" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://i.pinimg.com/564x/11/f0/46/11f046e43f3beecfd6b37b9d90f94616.jpg" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1597730945481-f35a5cf39021?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1597730945481-f35a5cf39021?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1579762593175-20226054cad0?auto=format&fit=crop&q=80&w=1536&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1579762593175-20226054cad0?auto=format&fit=crop&q=80&w=1536&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?auto=format&fit=crop&q=80&w=1496&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?auto=format&fit=crop&q=80&w=1496&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>
                            <div class="grid-item item--lg">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="https://images.unsplash.com/photo-1583502071282-169ac4fead6a?auto=format&fit=crop&q=80&w=1489&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="magnific_img_popup">
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img width="90" height="450"src="https://images.unsplash.com/photo-1583502071282-169ac4fead6a?auto=format&fit=crop&q=80&w=1489&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="gallery">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center load-more mt-5">
                        <a href="#0" class="custom-button theme-one">load more courses <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </section>
            <!-- ~~~ Gallery Section ~~~ -->


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
