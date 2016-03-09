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
    

    <title>Login Page</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!--    <script src="/js/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
        <script>
            function handleNewRoom() {
                var roomSelect = document.getElementById("roomSelect");
                var roomSelectOption = roomSelect.options[roomSelect.selectedIndex].value;
                if (roomSelectOption=="Private Room")
                    document.getElementById("newRoomDivId").style.display="block";
                else document.getElementById("newRoomDivId").style.display="none";
            }       
        </script>
  </head>

  <body>
      
    <div class="container" id="logincont">

      <form class="form-signin" action="http://localhost:8080/ChatApplication/UserNameServlet" onchange="handleNewRoom()" method="POST">
        <h2 class="form-signin-heading">Please sign in</h2>
        
        <label for="username" class="sr-only">Username</label>
        <input type="username" name="username" id="username" class="form-control" placeholder="Username" required autofocus>
        
        <label for="password" class="sr-only">Password</label>
        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
        
        <label for="password" class="sr-only">Room Option</label>
        <mark>Please select a room:</mark>
            <select id="roomSelect" name="roomSelect">
                <option value="Public Room">Public Room</option>
                <option value="Private Room">Private Room</option>
            </select>
            <br>
            <br>
            <div id="newRoomDivId" style="display:none">
                <mark>Please enter a private room name:</mark> <br>
                <input type="text" name="newRoomName" size="20" /> <br> <br>
            </div>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        
      </form><br>
        <a href="register.jsp"><button class="btn btn-lg btn-primary btn-block" id="signupbtn">Sign up here</button></a>
      

    </div> <!-- /container -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/js/ie10-viewport-bug-workaround.js">
        
        if (username != currentUser) {
            var button;
            var text;
            button = document.createElement("BUTTON");
            button.className = "list-group-item";
            button.id = username;
            button.value = username;
            button.type = "button";
            text = document.createTextNode(name);
            button.appendChild(text);
            $('#user-list').append(button);
        }
        
        
    </script>
  </body>
</html>


