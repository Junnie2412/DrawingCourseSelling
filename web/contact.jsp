<%-- 
    Document   : contact
    Created on : Sep 25, 2023, 8:33:38 AM
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
            <section class="hero-section banner-overlay bg_img" data-img="https://images.unsplash.com/photo-1577563908411-5077b6dc7624?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Contacts</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Contacts
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->


            <!-- ~~~ Contact Section ~~~ -->
            <section class="contact-section pt-120 pb-120">
                <div class="container">
                    <div class="row justify-content-between">
                        <div class="col-lg-6 col-xl-5">
                            <div class="section-header left-style mb-lg-0">
                                <h2 class="title">We look forward <span>to hearing from you!</span></h2>
                                <p>To send us a message, simply fill out all fields marked 
                                    with and click on "Submit". You can also send us an email to 
                                    <a href="https://bestwpware.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="f5969a9b81949681b598949c99db969a98">[email&#160;protected]</a> or contact us at the following address:</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-6">
                            <div class="contact-info">
                                <div class="contact-info-item">
                                    <div class="icon">
                                        <i class="flaticon-email"></i>
                                    </div>
                                    <h6 class="title">Email Address</h6>
                                    <ul>
                                        <li>
                                            <a href="Mailto:urmail@mail.com"><span class="__cf_email__" data-cfemail="c9bcbba4a8a0a589a4a8a0a5e7aaa6a4">[email&#160;protected]</span></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="contact-info-item">
                                    <div class="icon">
                                        <i class="flaticon-call"></i>
                                    </div>
                                    <h6 class="title">Phone Number</h6>
                                    <ul>
                                        <li>
                                            <a href="Tel:0766052061">076 605 20 61</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="contact-info-item">
                                    <div class="icon">
                                        <i class="flaticon-destination"></i>
                                    </div>
                                    <h6 class="title">Location</h6>
                                    <ul>
                                        <li>
                                            Emmenegger GmbH, Mettle, 6170 Schüpfheim  
                                        </li>
                                    </ul>
                                </div>
                                <div class="contact-info-item">
                                    <div class="icon">
                                        <i class="flaticon-earth-grid-symbol"></i>
                                    </div>
                                    <h6 class="title">Website</h6>
                                    <ul>
                                        <li>
                                            <a href="#0" target="_blank">www.yoursite.ccom</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ Contact Section ~~~ -->


            <!-- ~~~ Maps Section ~~~ -->
            <div class="maps"></div>
            <!-- ~~~ Maps Section ~~~ -->


            <!-- ~~~ Contact Section ~~~ -->
            <section class="contact-section pb-120">
                <div class="container">
                    <div class="gradient-bg mt--360 contact-wrapper">
                        <div class="contact-header">
                            <h2 class="title">Get In Touch</h2>
                        </div>
                        <form class="contact-form row" id="contact_form_submit">
                            <div class="col-md-6">
                                <div class="contact-form-group">
                                    <label class="icon" for="first_name"><i class="fas fa-user"></i></label>
                                    <input type="text" placeholder="First Name" id="first_name">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="contact-form-group">
                                    <label class="icon" for="last_name"><i class="fas fa-user"></i></label>
                                    <input type="text" placeholder="Last Name" id="last_name">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="contact-form-group">
                                    <label class="icon" for="email"><i class="fas fa-envelope"></i></label>
                                    <input type="text" placeholder="Enter Email" id="email">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="contact-form-group">
                                    <label class="icon" for="company_name"><i class="fas fa-briefcase"></i></label>
                                    <input type="text" placeholder="Company Name" id="company_name">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="contact-form-group">
                                    <label class="icon" for="subject"><i class="fas fa-pen"></i></label>
                                    <input type="text" placeholder="Subject" id="subject">
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div class="contact-form-group">
                                    <label class="icon" for="phone"><i class="fas fa-phone-alt"></i></label>
                                    <input type="text" placeholder="Phone" id="phone">
                                </div>
                            </div>
                            <div class="col-md-6 col-xl-4">
                                <div class="contact-form-group">
                                    <label class="icon" for="house"><i class="fas fa-map-marker"></i></label>
                                    <input type="text" placeholder="Street, house number" id="house">
                                </div>
                            </div>
                            <div class="col-md-6 col-xl-4">
                                <div class="contact-form-group">
                                    <label class="icon" for="postcode"><i class="fas fa-map-marker"></i></label>
                                    <input type="text" placeholder="Postcode / town" id="postcode">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="contact-form-group">
                                    <label class="icon" for="message"><i class="far fa-envelope"></i></label>
                                    <textarea name="message" id="message" placeholder="Message"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="contact-form-group">
                                    <div class="contact-form-group-select">
                                        <select class="select-bar">
                                            <option value="j0">How did you hear about us?</option>
                                            <option value="j1">Facebook</option>
                                            <option value="j2">Twitter</option>
                                            <option value="j3">Instagram</option>
                                            <option value="j4">Friend</option>
                                            <option value="j5">Teacher</option>
                                            <option value="j6">Students</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="contact-form-group">
                                    <div class="contact-form-group-select">
                                        <select class="select-bar">
                                            <option value="l0">Preferred Contact</option>
                                            <option value="l1">Facebook</option>
                                            <option value="l2">Mail</option>
                                            <option value="l3">Phone</option>
                                            <option value="l4">Direct</option>
                                            <option value="l5">Anything Else</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 text-center mt-4">
                                <div class="contact-form-group mb-0">
                                    <button type="submit">Send Message <i class="fas fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <!-- ~~~ Contact Section ~~~ -->


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
        <script src="https://maps.google.com/maps/api/js?key=AIzaSyCo_pcAdFNbTDCAvMwAD19oRTuEmb9M50c"></script>
        <script src="assets/js/map.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>
