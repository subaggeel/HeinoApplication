<%-- 
    Document   : login
    Created on : Feb 3, 2016, 12:45:22 PM
    Author     : apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action = "LoginServlet.java" method="post">
            <input type="text" name="username" placeholder="Username..."> <br>
            <input type="text" name="password" placeholder="password"> <br>
            <input type="submit" name="submit" value="Log In">
        </form>
    </body>
</html>