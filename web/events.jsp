<%-- 
    Document   : events
    Created on : Sep 25, 2023, 8:34:42 AM
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
                    <h1 class="title uppercase cl-white">Events</h1>
                    <ul class="breadcrumb cl-white p-0 m-0">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            Events
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- ~~~ Hero Section ~~~ -->


        <!-- ~~~ Events Section ~~~ -->
        <section class="events-section pt-120 pb-120">
            <div class="container">
                <div class="events-tab">
                    <ul class="nav nav-tabs">
                        <li>
                            <a href="#date1" class="active" data-toggle="tab">
                                <h5 class="title">Day 1</h5>
                                <span>28 june, 2023</span>
                            </a>
                        </li>
                        <li>
                            <a href="#date2" data-toggle="tab">
                                <h5 class="title">Day 2</h5>
                                <span>29 june, 2023</span>
                            </a>
                        </li>
                        <li>
                            <a href="#date3" data-toggle="tab">
                                <h5 class="title">Day 3</h5>
                                <span>30 june, 2023</span>
                            </a>
                        </li>
                        <li>
                            <a href="#date4" data-toggle="tab">
                                <h5 class="title">Day 4</h5>
                                <span>01 july, 2023</span>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="date1">
                            <div class="events-area">
                                <div class="event-item active open">
                                    <div class="thumb">
                                        <img src="assets/images/events/01.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/02.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/03.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/04.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/05.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/06.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="date2">
                            <div class="events-area">
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/01.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item active open">
                                    <div class="thumb">
                                        <img src="assets/images/events/02.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/03.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/04.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/05.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/06.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="date3">
                            <div class="events-area">
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/01.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/02.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item active open">
                                    <div class="thumb">
                                        <img src="assets/images/events/03.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/04.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/05.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/06.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="date4">
                            <div class="events-area">
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/01.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/02.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/03.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/04.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item">
                                    <div class="thumb">
                                        <img src="assets/images/events/05.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="event-item active open">
                                    <div class="thumb">
                                        <img src="assets/images/events/06.png" alt="events">
                                    </div>
                                    <div class="cont">
                                        <h5 class="title">Web Design Principle and Best Practise</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur viverra odio sit amet venenatis. Sed sodales ex vel iaculis mattis. Suspendisse condimentum pellentesque leo eu consequat. Curabitur sollicitudin volutpat ante, ullamcorper lacinia sem. Nulla in ipsum.</p>
                                        <div class="extra-cont">
                                            <div class="meta-post">
                                                <span class="meta-item">Start: 12.00 PM</span>
                                                <span class="meta-item">End: 15.00 PM</span>
                                                <span class="meta-item">Location: Hall 1 , Building A, Golden Street, Southafrica</span>
                                            </div>
                                            <a href="#0" class="custom-button">get tickets <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center load-more mt-5">
                        <a href="#0" class="custom-button theme-one">load more<i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </section>
        <!-- ~~~ Events Section ~~~ -->


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
