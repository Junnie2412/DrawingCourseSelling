<%-- 
    Document   : blog-details
    Created on : Sep 25, 2023, 8:33:16 AM
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
            <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner.png">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Blog Details</h1>
                        <ul class="breadcrumb cl-white p-0 m-0">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Blog Details
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->


            <!-- ~~~ Blog Section ~~~ -->
            <div class="blog-section pt-120 pb-120">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <article class="pr-xl-20 blog-posts">
                                <div class="post-item post-details p-0">
                                    <div class="post-thumb">
                                        <img src="assets/images/blog/blog2.png" alt="blog">
                                    </div>
                                    <div class="post-content">
                                        <div class="meta">
                                            <div class="meta-area">
                                                <a href="#0"><i class="far fa-user"></i>Posted by <span class="cl-theme">Admin</span></a>
                                                <a href="#0"><i class="far fa-calendar-alt"></i>25 June, 2023</a>
                                                <a href="#0"><i class="far fa-comment-alt"></i>25 Comments</a>
                                            </div>
                                        </div>
                                        <h4 class="title">How to become a best sale marketer in a year!</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a diam blandit, luctus mauris sit amet, cursus nulla. In lobortis ex quis neque tempor, vitae egestas dolor tincidunt. Nulla vel lectus faucibus, malesuada nibh ac, vulputate nunc. Integer accumsan arcu ligula, eget dictum augue egestas sed. Curabitur bibendum, lorem ac dapibus pellentesque, justo lectus bibendum enim, vel ullamcorper nisi diam et risus. Maecenas fermentum felis id ligula dictum, vitae varius lorem tincidunt. Aenean hendrerit congue tortor. In hac habitasse platea dictumst. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a diam blandit.
                                        </p>
                                        <p>
                                            Curabitur bibendum, lorem ac dapibus pellentesque, justo lectus bibendum enim, vel ullamcorper nisi diam et risus. Maecenas fermentum felis id ligula dictum, vitae varius lorem tincidunt. Aenean hendrerit congue tortor platea dictumst. Lorem ipsum dolor sit amet.
                                        </p>
                                        <blockquote>
                                            Curabitur bibendum, lorem ac dapibus pellentesque, justo lectus bibendum enim, vel ullamcorper nisi diam et risus. Maecenas fermentum felis id ligula dictum, vitae varius lorem tincidunt. Aenean hendrerit congue tortor.
                                        </blockquote>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a diam blandit, luctus mauris sit amet, cursus nulla. In lobortis ex quis neque tempor, vitae egestas dolor tincidunt. Nulla vel lectus faucibus, malesuada nibh ac, vulputate nunc. Integer accumsan arcu ligula, eget dictum augue egestas sed. Curabitur bibendum, lorem ac dapibus pellentesque, justo lectus bibendum enim, vel ullamcorper nisi diam et risus. Maecenas fermentum felis id ligula dictum, vitae varius lorem tincidunt. Aenean hendrerit congue tortor. In hac habitasse platea dictumst.
                                        </p>
                                        <p>
                                            Integer accumsan arcu ligula, eget dictum augue egestas sed. Curabitur bibendum, lorem ac dapibus pellentesque, justo lectus bibendum enim, vel ullamcorper nisi diam et risus. Maecenas fermentum felis id ligula dictum, vitae varius lorem tincidunt.
                                        </p>
                                        <div class="tags-area">
                                            <div class="tags">
                                                <span class="title">Related Tags:</span>
                                                <a href="#0">#Design</a>
                                                <a href="#0">#Logo</a>
                                                <a href="#0">#Branding</a>
                                            </div>
                                            <div class="share">
                                                <span class="title">Share On:</span>
                                                <a href="#0">
                                                    <i class="fab fa-facebook-f"></i>
                                                </a>
                                                <a href="#0">
                                                    <i class="fab fa-twitter"></i>
                                                </a>
                                                <a href="#0">
                                                    <i class="fab fa-instagram"></i>
                                                </a>
                                                <a href="#0">
                                                    <i class="fab fa-linkedin-in"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment-area">
                                    <h5 class="title">03 Comments</h5>
                                    <ul class="comment-wrapper">
                                        <li>
                                            <div class="comment-item d-flex flex-wrap">
                                                <div class="comment-thumb">
                                                    <a href="#0">
                                                        <img src="assets/images/blog/blog-comment01.png" alt="blog">
                                                    </a>
                                                </div>
                                                <div class="comment-content">
                                                    <div class="comment-header d-flex flex-wrap justify-content-between">
                                                        <div class="comment-header-left ">
                                                            <h6 class="sub-title"><a href="#0">Mithila Islam</a></h6>
                                                            <span>25 June, 19</span>
                                                        </div>
                                                        <a href="#0" class="reply-button"><i class="fas fa-reply"></i>Reply</a>
                                                    </div>
                                                    <p>Proactively envisioned multimedia based expertise and cross-media growth strategies. 
                                                        Seamlessly ize quality intellectual capital without superior collaboration and idea-
                                                        sharing. Holistically pontificate installed.</p>
                                                </div>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="comment-item d-flex flex-wrap">
                                                        <div class="comment-thumb">
                                                            <a href="#0">
                                                                <img src="assets/images/blog/blog-comment01.png" alt="blog">
                                                            </a>
                                                        </div>
                                                        <div class="comment-content">
                                                            <div class="comment-header d-flex flex-wrap justify-content-between">
                                                                <div class="comment-header-left ">
                                                                    <h6 class="sub-title"><a href="#0">Mithila Islam </a></h6>
                                                                    <span>25 June, 19</span>
                                                                </div>
                                                                <a href="#0" class="reply-button"><i class="fas fa-reply"></i>Reply</a>
                                                            </div>
                                                            <p>Proactively envisioned multimedia based expertise and cross-media 
                                                                growth strategies. Seamlessly ize quality intellectual capital without superior collaboration and idea-sharing.</p>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <div class="comment-item d-flex flex-wrap">
                                                <div class="comment-thumb">
                                                    <a href="#0">
                                                        <img src="assets/images/blog/blog-comment01.png" alt="blog">
                                                    </a>
                                                </div>
                                                <div class="comment-content">
                                                    <div class="comment-header d-flex flex-wrap justify-content-between">
                                                        <div class="comment-header-left ">
                                                            <h6 class="sub-title"><a href="#0">Mithila Islam</a></h6>
                                                            <span>25 June, 19</span>
                                                        </div>
                                                        <a href="#0" class="reply-button"><i class="fas fa-reply"></i>Reply</a>
                                                    </div>
                                                    <p>Proactively envisioned multimedia based expertise and cross-media growth strategies. 
                                                        Seamlessly ize quality intellectual capital without superior collaboration and idea-
                                                        sharing. Holistically pontificate installed.</p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="comment-area mb-0">
                                    <h5 class="title">Leave a comment</h5>
                                    <form class="comment-form row mb-30-none">
                                        <div class="col-sm-6 comment-form-group">
                                            <input type="text" placeholder="Name" name="name">
                                        </div>
                                        <div class="col-sm-6 comment-form-group">
                                            <input type="text" placeholder="Email" name="email">
                                        </div>
                                        <div class="col-sm-12 comment-form-group">
                                            <textarea name="message" placeholder="Your Comment"></textarea>
                                        </div>
                                        <div class="col-sm-12 comment-form-group">
                                            <button type="submit">post comment <i class="fas fa-angle-right"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </article>
                        </div>
                        <div class="col-lg-4">
                            <aside class="pl-xl-10">
                                <div class="widget widget-search">
                                    <h5 class="title">Search</h5>
                                    <div class="blog-search">
                                        <input type="text" placeholder="Search Here....">
                                        <button type="submit">Search</button>
                                    </div>
                                </div>
                                <div class="widget widget-post">
                                    <h5 class="title">Recent Post</h5>
                                    <ul class="widget-post-body">
                                        <li>
                                            <a href="#0">
                                                <div class="thumb">
                                                    <img src="assets/images/blog/side2.png" alt="blog">
                                                </div>
                                                <div class="cont">
                                                    <span class="subtitle d-block">Building Diverse Design Was Teams Innovation.</span>
                                                    <span class="date"><span class="cl-theme">calendar</span> 05 July 2023</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0">
                                                <div class="thumb">
                                                    <img src="assets/images/blog/side3.png" alt="blog">
                                                </div>
                                                <div class="cont">
                                                    <span class="subtitle d-block">7 Step Social Media Marke ting Strategy</span>
                                                    <span class="date"><span class="cl-theme">calendar</span> 05 August 2023</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0">
                                                <div class="thumb">
                                                    <img src="assets/images/blog/side1.png" alt="blog">
                                                </div>
                                                <div class="cont">
                                                    <span class="subtitle d-block">The Best Places to Find Artis tic Inspiration</span>
                                                    <span class="date"><span class="cl-theme">calendar</span> 15 August 2023</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="widget widget-category">
                                    <h5 class="title">Blog Catagories</h5>
                                    <ul class="widget-category-body">
                                        <li>
                                            <a href="#0"><span>Construction</span><span>(17)</span></a>
                                        </li>
                                        <li>
                                            <a href="#0"><span>Interior Design</span><span>(17)</span></a>
                                        </li>
                                        <li>
                                            <a href="#0"><span>Photography</span><span>(17)</span></a>
                                        </li>
                                        <li>
                                            <a href="#0"><span>Industry</span><span>(17)</span></a>
                                        </li>
                                        <li>
                                            <a href="#0"><span>Branding Design</span><span>(17)</span></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="widget widget-archive">
                                    <h5 class="title">Archive Posts</h5>
                                    <ul class="widget-archive-body">
                                        <li>
                                            <a href="#0"><i class="far fa-folder"></i> August 2020</a>
                                        </li>
                                        <li>
                                            <a href="#0"><i class="far fa-folder"></i> Octeber 2021</a>
                                        </li>
                                        <li>
                                            <a href="#0"><i class="far fa-folder"></i> February 2022</a>
                                        </li>
                                        <li>
                                            <a href="#0"><i class="far fa-folder"></i> January 2023</a>
                                        </li>
                                        <li>
                                            <a href="#0"><i class="far fa-folder"></i> January 2023</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="widget widget-meta">
                                    <h5 class="title">Meta</h5>
                                    <ul class="widget-meta-body">
                                        <li>
                                            <a href="#0">Log In</a>
                                        </li>
                                        <li>
                                            <a href="#0">Entries RSS</a>
                                        </li>
                                        <li>
                                            <a href="#0">Comments RSS</a>
                                        </li>
                                        <li>
                                            <a href="#0">WordPress.Org</a>
                                        </li>
                                    </ul>
                                </div>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ~~~ Blog Section ~~~ -->


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