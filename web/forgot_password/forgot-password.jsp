

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Recovery</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            
            Enter your AccountID:
            <input type="text" name="accountID" required>
            <input type="submit" value="Reset Password">
        </form>
    </body>
</html>
