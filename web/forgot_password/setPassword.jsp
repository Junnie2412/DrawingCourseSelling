<%-- 
    Document   : setPassword
    Created on : Oct 30, 2023, 6:51:29 PM
    Author     : Win 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset password</title>
    </head>
    <body>
        <form action="MainController" method="post">
            New Password:
            <input type="password" name="newPassword" required><br>

            Confirm Password:
            <input type="password" name="confirmPassword" required><br>

            <input type="submit" value="Reset Password">
        </form>
    </body>
</html>
