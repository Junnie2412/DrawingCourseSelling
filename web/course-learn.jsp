<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
        <title>ArtCenter - Online Drawing Course</title>

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/owl.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link href="assets/css/main2.css" rel="stylesheet" type="text/css"/>

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .lesson {
                padding: 1rem;
                border-bottom: 1px solid #ccc;
                display: flex;
                align-items: center;
                justify-content: space-between;
                cursor: pointer;
            }
        </style>
        
    </head>
    <body>
        <jsp:include page="layout/header.jsp"/>
        <div style="min-height: 100vh;">
            <div style="height: 60px; background-color: wheat">

            </div>
            <div class="row" style="width: 101%;">
                <div class="col-3" style="min-height: calc(100vh - 60px); border-right: 1px solid #ccc; padding-right: 0;">
                    <div style="padding: 1rem .5rem;">
                        <h3>Course name</h3>
                    </div>
                    <div id="accordion">
                        <div class="card" style="border-radius: 0;">
                            <div class="card-header" id="headingOne" style="padding: 0;">
                                <button style="width: 100%; height: 100%; padding: 1rem;" class="btn" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
                                    Module 1
                                </button>
                            </div>

                            <div id="collapse1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="lesson">
                                    <span data-toggle="collapse" data-target="#lesson1-content">
                                        lesson l
                                    </span>
                                    <span>
                                        &#10140;
                                    </span>
                                </div>

                                
                                <div class="lesson">
                                    <span>
                                        Lesson 2
                                    </span>                                        
                                    <span>
                                        &#10140;
                                    </span>
                                </div>
                                <div class="lesson">
                                    <span>
                                        Lesson 3
                                    </span>                                        
                                    <span>
                                        &#10140;
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="card" style="border-radius: 0;">
                            <div class="card-header" id="headingTwo" style="padding: 0;">
                                <button style="width: 100%; height: 100%; padding: 1rem;" class="btn" data-toggle="collapse" data-target="#collapse2" aria-expanded="true" aria-controls="collapse2">
                                    Module 2
                                </button>
                            </div>

                            <div id="collapse2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                <div class="lesson">
                                    <span>
                                        Lesson 1
                                    </span>                                        
                                    <span>
                                        &#10140;
                                    </span>
                                </div>
                                <div class="lesson">
                                    <span>
                                        Lesson 2
                                    </span>                                        
                                    <span>
                                        &#10140;
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-9" style="padding: 0;">
                    <div style="padding: 1rem .5rem 1rem 2rem;">
                        <h3>Name lesson</h3>
                    </div>
                    <div class="d-flex justify-content-center align-items-center" style="height: 400px; background-color: #24C6DC">
                        video
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="layout/footer.jsp"/>
    </body>
</html>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>