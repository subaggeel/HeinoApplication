<%-- 
    Document   : index
    Created on : Mar 1, 2016, 9:02:32 PM
    Author     : apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>Register Page</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/register.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!--    <script src="/js/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
      
    <div class="container" id="cont">

        <form id="register-form" class="register-form" action="http://localhost:8080/ChatApplication/RegisterSerlvet" method="POST">
            <h2 class="form-signin-heading" style="color:whitesmoke">Please fill in your Personal Details</h2>

            <label for="username" class="sr-only" >Username</label>
            <input type="username" name="username" id="username" class="form-control" placeholder="Username" required autofocus>

            <label for="password" class="sr-only">Password</label>
            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>

            <label for="firstname" class="sr-only">First Name</label>
            <input type="username" name="firstname" id="firstname" class="form-control" placeholder="First Name" required autofocus>

            <label for="lastname" class="sr-only">Last Name</label>
            <input type="lastname" name="lastname" id="lastname" class="form-control" placeholder="Last Name" required autofocus>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
        
        </form>
        <a href="index.jsp" id="signinlink"><h3 style="color:whitesmoke">If you have already Created an account, please Sign In! </h3></a>

    </div> <!-- /container -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  </body>
</html>


