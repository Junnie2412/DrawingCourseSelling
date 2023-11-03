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
<html><!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Create Video</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        header {
            background-color: rgba(59, 65, 66, 0.1);
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            margin: 0;
        }

        main {
            padding: 20px;
        }

        .createTable {
            width: 1100px;
            padding: 40px;
            border: 2px solid gray;
            margin: 0 auto;
            border-radius: 5px;
            background-color: white;
            margin-top: 50px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .modal-header {
            background-color: #fff;
            color: #fff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

        .video-content {
            width: 40%;
        }

        .video-time {
            width: 20%;
        }

        .video-function {
            width: 40%;
        }
        .video-title {
        font-size: 32px;
        font-weight: bold;
        margin-bottom: 10px;
        color: black; 
    }

    </style>
</head>
<body>
<header>
        <h1 class="video-title">Video</h1>
    </header>
<div class="createTable">
    <div class="">
        <table>
            <thead>
                <tr>
                    <th class="video-content">Title lesson</th>
                    <th class="video-time">Time</th>
                    <th class="video-function">Function</th>
                </tr>
            </thead>
            <% for (VideoDTO video : (List<VideoDTO>) (request.getAttribute("videos"))) { %>
            <tr>
                <td class="video-content">
                    <%= video.getContent() %>
                </td>
                <td class="video-time">
                    <span style="color: #333;"><%= video.getTime() %></span>
                </td>
                <td class="video-function">
                    <a href="#" data-toggle="modal" data-target="#modal-update-<%= video.getVideoID() %>">Edit</a>
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
            </tr>
            <% } %>
            <tr>
                <td colspan="3">
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
                            <input type="hidden" name="lessonId" value="${requestScope.lessonId}" />
                            <tr>
                                <td style="color: #333;">Content</td>
                                <td><input type="text" name="content" required></td>
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
