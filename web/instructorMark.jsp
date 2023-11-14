<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="course.BillDTO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructor bill</title>

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
            #fullImageOverlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.8);
                justify-content: center;
                align-items: center;
                z-index: 2; /* Đảm bảo overlay nằm trên cùng */
            }

            #fullImageOverlay img {
                max-width: 80%;
                max-height: 80%;
            }

            #fullImageCheckbox:checked + #fullImageOverlay {
                display: flex;
            }

            /* Khi overlay được hiển thị, làm mờ phần còn lại của trang */
            #fullImageCheckbox:checked ~ .all-sections {
                filter: blur(5px); /* Điều chỉnh mức độ mờ tùy chọn */
                pointer-events: none; /* Ngăn chặn sự tương tác với phần còn lại của trang */
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
            <div style="min-height: 80vh;">
                <h1 class="text-center">Mark for students</h1>
                <div class="d-flex justify-content-center">
                    <table class="table" style="width: 80vw;">
                        <thead>
                            <tr>
                                <th scope="col">ID Students</th>
                                
                                <th scope="col">Name of Courses</th>
                                <th scope="col">picture of Students</th>
                                <th scope="col">Function</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td><!-- Thay thế với ID học sinh thực tế -->
                                <td>Name off scores </td>
                                <td>
                                    <label for="fullImageCheckbox">
                                        <img src="assets/images/art1.png" alt="Hình ảnh học sinh" style="width: 80px; height: 80px; object-fit: cover;">
                                    </label>
                                    <input type="checkbox" id="fullImageCheckbox" style="display: none;">
                                    <div id="fullImageOverlay">
                                        <img src="assets/images/art1.png" alt="Hình ảnh học sinh" style="max-width: 100%; max-height: 100%;">
                                    </div>
                                    
                                </td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" style="width: 50px; border: " placeholder="Note" aria-label="Note" >
                                        <input type="text" class="form-control" style="width: 50px; border: " placeholder="Score" aria-label="Score" >
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button" id="button-addon2">Sent</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Thêm nhiều dòng khác cho các học sinh khác nếu cần -->
                        </tbody>

                    </table>
                </div>
            </div>

            <jsp:include page="layout/footer.jsp"/>
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
        <script>
    document.getElementById('fullImageOverlay').addEventListener('click', function () {
        document.getElementById('fullImageCheckbox').checked = false;
    });
</script>
    </body>
</html>
