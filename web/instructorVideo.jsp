<%-- 
    Document   : createCourse
    Created on : Oct 7, 2023, 1:51:19 PM
    Author     : HOANG DUNG
--%>

<%@page import="course.VideoDTO"%>
<%@page import="course.LessonDTO"%>
<%@page import="java.util.List"%>
<%@page import="course.ModuleDTO"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Create Course</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url('https://aap.cornell.edu/sites/default/files/archhome1_2000x1320_0_1.png'); 
                background-size: cover; 
                background-repeat: no-repeat; 
                background-attachment: fixed; 
                background-position: center center; 
                color: white;
            }

            h1 {
                text-align: center;
                color: black;
            }

            form,
            .createTable {
                margin: 0 auto;
                background-color: rgba(133, 134, 133, 0.8);
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            table {
                width: 100%;
            }

            table td {
                padding: 10px;
            }

            input[type="text"],
            input[type="date"],
            select {
                width: 90%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                background-color: #333;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
                background-color: #555;
            }

            .createTable{
                display: flex;

            }

            .table1{
                width: 40%;
            }

            .table2{
                width: 50%;
            }



        </style>
    </head>
    <body>
    <container>
        <h1>Video</h1>
    </container>
    <div class="createTable">
        <div class="">
            <table>
                <% for (VideoDTO video : (List<VideoDTO>) (request.getAttribute("videos"))) {%>
                <tr>
                    <td>
                        <%= video.getContent()%>
                        <span style="color: #333;"><%= video.getTime()%></span>
                    </td>
                    <td>
                        <a href="#" data-toggle="modal" data-target="#modal-update-<%= video.getVideoID()%>">Edit</a>
                        <div class="modal fade" id="modal-update-<%= video.getVideoID()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <form class="modal-content" style="padding: 0;" action="UpdateVideoController" method="POST">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel" style="color: #333">Update video</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <table>
                                            <input type="hidden" name="lessonId" value="${requestScope.lessonId}"/>
                                            <input type="hidden" name="videoId" value="<%= video.getVideoID() %>"/>
                                            <tr>
                                                <td style="color: #333;">Content</td>
                                                <td><input type="text" name="content" value="<%= video.getContent() %>"></td>
                                            </tr>
                                            <tr>
                                                <td style="color: #333;">Time</td>
                                                <td><input type="text" name="time" value="<%= video.getTime() %>"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </td>

                    <!--Modal-->
                </tr>
                <% }%>
                <tr>
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-create">
                            + Create Video
                        </button>
                    </td>
                </tr>
            </table>

            <!-- Modal -->
            <div class="modal fade" id="modal-create" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <form class="modal-content" style="padding: 0;" action="CreateVideoController" method="POST">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel" style="color: #333">Create Video</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <input type="hidden" name="lessonId" value="${requestScope.lessonId}"/>
                                <tr>
                                    <td style="color: #333;">Content</td>
                                    <td><input type="text" name="content"></td>
                                </tr>
                                <tr>
                                    <td style="color: #333;">Time</td>
                                    <td><input type="text" name="time"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("todayDate").valueAsDate = new Date();
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>