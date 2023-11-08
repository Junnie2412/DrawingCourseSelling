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
        <script src="assets/js/magnific-popup.min.js"></script>
        <style>
            .nav-bar{
                width: 100vw;
                background-color: white;
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
            <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-gallery.avif">

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
                                        <a href="assets/images/gallery/14.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/14.avif" alt="gallery" class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/15.jpg" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/15.jpg" alt="gallery"  class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/16.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/16.avif" alt="gallery" class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/17.webp" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/17.webp" alt="gallery" class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/18.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/18.avif" alt="gallery"  class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item item--lg">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/19.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/19.avif" alt="gallery"  class="magnific_img_popup">
                                </div>
                            </div>

                            <div class="grid-item item--lg">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/20.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/20.avif" alt="gallery"  class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/21.jpg" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/21.jpg" alt="gallery"  class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/22.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/22.avif" alt="gallery" class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/23.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/23.avif" alt="gallery" class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/24.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img src="assets/images/gallery/24.avif" alt="gallery" class="magnific_img_popup">
                                </div>
                            </div>
                            <div class="grid-item item--lg">
                                <div class="gallery-img">
                                    <div class="cont">
                                        <a href="assets/images/gallery/25.avif" >
                                            <i class="flaticon-add"></i>
                                        </a>
                                    </div>
                                    <img width="90" height="450"src="assets/images/gallery/25.avif" class="magnific_img_popup" alt="gallery">
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
           
<script>
$(document).ready(function() {
    $('.magnific_img_popup').magnificPopup({type: 'image'});
});
</script>

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
