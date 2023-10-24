<%-- 
    Document   : createCourse
    Created on : Oct 7, 2023, 1:51:19 PM
    Author     : HOANG DUNG
--%>

<%@page import="java.util.List"%>
<%@page import="course.ModuleDTO"%>
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
        <h1>UPDATE COURSE</h1>
    </container>

    <form action="UpdateCourseController" method="POST" class="createTable">
        <div class="table1">
            <table>
                <tbody>
                    <tr>
                        <td style="font-weight: bold;  color:black">Course ID</td>
                        <td><input readonly type="text" name="courseID" value="${requestScope.course.getCourseID()}"></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="coursePrice" value="${requestScope.course.getPrice()}"></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="courseName" value="${requestScope.course.getName()}"></td>
                    </tr>
                    <tr>
                        <td>Duration</td>
                        <td><input type="text" name="courseDuration" value="${requestScope.course.getDuration()}"></td>
                    </tr>
                    <tr>
                        <td>Date Public</td>
                        <td><input type="date" name="courseDatePublic" value="${requestScope.course.getDatePublic()}"></td>
                    </tr>
                    <tr>
                        <td><br></td>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td><button type="submit">Turn Back To Courses</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table2">
            <table>
                <tbody>
                    <tr>
                        <td style="font-weight: bold;  color:black">Description</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Content</td>
                <input type="hidden" name="descriptionId" value="${requestScope.description.getDescriptionID()}"/>
                <td><input type="text" name="descriptionContent" value="${requestScope.description.getContent()}"></td>
                </tr>
                <tr>
                    <td>Target</td>
                    <td><input type="text" name="descriptionTarget" value="${requestScope.description.getTarget()}"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="text" name="descriptionImage" value="${requestScope.description.getImage()}"/></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><input type="text" name="descriptionType" value="${requestScope.description.getType()}"/></td>
                </tr>
                <tr>
                    <td>Level</td>
                    <td>
                        <select name="descriptionLevel">
                            <option value="Basic" ${requestScope.description.getLevel() == "Basic" ? "selected" : ""}>Basic</option>
                            <option value="Intermediate" ${requestScope.description.getLevel() == "Intermediate" ? "selected" : ""}>Intermediate</option>
                            <option value="Advanced" ${requestScope.description.getLevel() == "Advanced" ? "selected" : ""}>Advanced</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
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
                    <td><button type="submit">Update Course</button></td>

                </tr>
                </tbody>
            </table>
        </div>
    </form>

    <container>
        <h1>Update Module</h1>
    </container>
    <div class="createTable">
        <div class="card">
            <table>
                <% for (ModuleDTO module : (List<ModuleDTO>) request.getAttribute("modules")) {%>
                <tr>
                    <td>
                        <%= module.getTitle()%>
                    </td>
                    <td>
                        <a href="CreateLessonController?moduleId=<%= module.getModuleID() %>">Edit</a>
                    </td>
                </tr>
                <% }%>
                <tr>
                <form action="CreateModuleController" method="POST">
                    <td>
                        <input type="hidden" name="courseId" value="${requestScope.course.getCourseID()}" />
                        <input type="text" name="title" placeholder="title"/>
                    </td>
                    <td>
                        <button type="submit">Create Module</button>
                    </td>
                </form>
                </tr>
            </table>
        </div>
    </div>
    <script>
        document.getElementById("todayDate").valueAsDate = new Date();
    </script>
</body>
</html>