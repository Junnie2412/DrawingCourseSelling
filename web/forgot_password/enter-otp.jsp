
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enter OTP</title>
    </head>
    <body>
        <form action="MainController" method="post">
        Enter the OTP sent to your email:
        <input type="text" name="otp" required>
        <input type="submit" value="Verify OTP">
    </form>
    </body>
</html>
