<%-- 
    Document   : createCourse
    Created on : Oct 7, 2023, 1:51:19 PM
    Author     : HOANG DUNG
--%>

<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

            form {
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
        <h1>CREATE COURSE</h1>
    </container>
            
        <form action="MainController" class="createTable">
            <div class="table1">
                <table>
                <tbody>
                    <tr>
                        <td style="font-weight: bold;  color:black">Course ID</td>
                        <td><input type="text" name="courseID"></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="coursePrice"></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="courseName"></td>
                    </tr>
                    <tr>
                        <td>Duration</td>
                        <td><input type="text" name="courseDuration"></td>
                    </tr>
                    <tr>
                        <td>Date Public</td>
                        <td><input type="date" id="todayDate" name="courseDatePublic"></td>
                    </tr>
                    <tr>
                        <td><br></td>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;  color:black">Description</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td><input type="text" name="descriptionContent"></td>
                    </tr>
                    <tr>
                        <td>Target</td>
                        <td><input type="text" name="descriptionTarget"></td>
                    </tr>
                    <tr>
                        <td>Image</td>
                        <td><input type="text" name="descriptionImage"></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><input type="text" name="descriptionType"></td>
                    </tr>
                    <tr>
                        <td>Level</td>
                        <td>
                            <select name="descriptionLevel">
                                <option value="Basic">Basic</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Advanced">Advanced</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><br></td>
                        <td><br></td>
                    </tr>
                </tbody>
            </table>
            </div>
            
            <div class="table2">
                <table>
                <tbody>
                    <tr>
                        <td style="font-weight: bold; color:black">Module</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td><input type="text" name="moduleTitle"></td>
                    </tr>
                    <tr>
                        <td><br></td>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; color:black">Lesson</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td><input type="text" name="lessonTitle"></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><input type="text" name="lessonDescription"></td>
                    </tr>
                    <tr>
                        <td><br></td>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;  color:black">Video</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td><input type="text" name="videoContent"></td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td><input type="text" name="videoTime"></td>
                    </tr>
                    <tr>
                        <%
                            String message = (String) request.getAttribute("MESSAGE");
                            if (message == null) {
                                message = "";
                            }
                        %>
                        <td></td>
                        <td><%=message%></td>
                    </tr>
                    <tr>
                        <td><button type="submit" name="action" value="TurnBackToCourses">Turn Back To Courses</button></td>
                        <td><button type="submit" name="action" value="CreateCourse">Create Course</button></td>

                    </tr>
                </tbody>
            </table>
            </div>
        </form>
        <script>
            document.getElementById("todayDate").valueAsDate = new Date();
        </script>
    </body>
</html>