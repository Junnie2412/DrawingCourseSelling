<%-- 
    Document   : createCourse
    Created on : Oct 7, 2023, 1:51:19 PM
    Author     : HOANG DUNG
--%>

<%@page import="course.LessonDTO"%>
<%@page import="java.util.List"%>
<%@page import="course.ModuleDTO"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ArtCenter - Create Courses</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link href="assets/css/main2.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body><!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ArtCenter - Create Lesson</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link rel="stylesheet" href="assets/css/main2.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
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
    </style>
</head>

<body>
    <header>
        <h1> Create Lesson</h1>
    </header>
    <main>
        <div class="container createTable">
    <table style="background-color: white">
        <thead>
            <tr>
                <th>Title lesson</th>
                <th>Function</th>
            </tr>
        </thead>
        <tbody>
            <% for (LessonDTO lesson : (List<LessonDTO>) request.getAttribute("lessons")) { %>
            <tr>
                <td><%= lesson.getTitle() %></td>
                <td>
                    <a href="CreateVideoController?lessionId=<%= lesson.getLessonID() %>" class="btn btn-primary">Edit</a>
                </td>
            </tr>
            <% } %>
            <tr>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-create">
                        + Create lesson
                    </button>
                    
                </td>
            </tr>
        </tbody>
    </table>
</div>

    </main>
    <div class="modal fade" id="modal-create" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form class="modal-content" action="CreateLessonController" method="POST">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create lesson</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <input type="hidden" name="moduleId" value="${requestScope.moduleId}" />
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" class="form-control" required></td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td><input type="text" name="description" class="form-control" required></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <script>
        document.getElementById("todayDate").valueAsDate = new Date();
    </script>
</body>

</html>
</html>

