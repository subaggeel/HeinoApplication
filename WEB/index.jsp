<%-- 
    Document   : index
    Created on : 17.2.2016, 12:44:48
    Author     : nadiira
--%>

<%@page import="com.chat.app.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>ChatApp</title>
        <!-- BOOTSTRAP CORE STYLE CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME  CSS -->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- CUSTOM STYLE CSS -->
        <link href="css/style1.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css"/>


        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
         <script type="text/javascript"> 
            var websocket = new WebSocket("ws://localhost:8080/webprojectEnhance/chatroomServerEndpoint");
            websocket.onmessage = function processMessage(message){
                var jsonData = JSON.parse(message.data);
                if(jsonData.message !== null){
                	messagesTextArea.value += jsonData.message + " \n";                	
                }
                if(jsonData.users !==null){
                    usersTextArea.value="";
                    var i = 0;
                    while (i<jsonData.users.length){
                        usersTextArea.value += jsonData.users[i++] + " \n";
                    }
                }   
            };
                        
            function sendMessage(){
                websocket.send(messageText.value);
                messageText.value = "";
            }
            
            window.onbeforeunload = function(){
                websocket.onclose = function(){};
                websocket.close();
            };
            
        </script>
    </head>
    <body onload="displayDate()">
        <%
//Check that session exists for user!
String userName = null;
if(session.getAttribute("user") == null){
    response.sendRedirect("index.html");
}else {
    User usr;    
    usr = (User) session.getAttribute("user");
    userName = usr.getFullName();
}
%>
 
       

        <div class="container-fluid">
            
           <nav class="navbar navbar-inverse" role="navigation" id="nav" >
        <div class="container" id="nav" >
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle-pull-right" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" id="logo">
                    <img src="images/hospital-logo-hi.png" alt="" height="50" width="50">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#"><i class="fa fa-cog" style="color:black"><%=userName %></i></a>
                    </li>
                    <li>
                        <form action="<%=response.encodeURL("LogoutServlet") %>" method="post">
                       <button class="btn btn-info btn-logout" type="submit" value="Logout" id="logoutbut" ><i class="fa fa-log-ou" style="color:black" >LogOut</i></button> 
                        </form>
                    </li>
                    <li>
                        <h6 style="color:whitesmoke">Welcome !</h6>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
   </nav>
           
  
            <div class="row pad-top pad-bottom">



                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="chat-box-online-div">
                        <div class="chat-box-online-head">

                
                           <div class="input-group">
      <input type="text" class="form-control" placeholder="Search for users...">
      <span class="input-group-btn">
          <button class="btn btn-secondary" type="button"><span class="glyphicon glyphicon-search"></span></button>
      </span>
    </div>
                            
                        </div>
                        

                            
                            <hr class="hr-clas-low">
                            <div class="chat-box-online-head">
                                Recent Chats
                            </div>
                            <div class="chat-box-online-right" >
                                <textarea class="chat-box-online-left" id="usersTextArea" readonly="readonly" rows="5"cols="20"> </textarea>

                            </div>

                
                            <hr class="hr-clas-low" />
                            <div class="chat-box-online-head">
                                Other Users
                            </div>

                            <div class="chat-box-online-right">
                                <img src="images/user.gif" alt="bootstrap Chat box user image" class="img-circle" />
                                  <textarea class="chat-box-online-left" id="usersTextArea" readonly="readonly" rows="5"cols="20"> </textarea>

                                <br />
                                ( <small>Active from 10 hours</small> )
                            </div>
                            <hr class="hr-clas-low" />
                            <div class="chat-box-online-left">
                                <img src="images/user.png" alt="bootstrap Chat box user image" class="img-circle" />
                                -  Jukka Jalonen
                                <br />
                                ( <small>Active from 3 hours</small> )
                            </div>
                            <hr class="hr-clas-low" />

                            <div class="chat-box-online-right">
                                <img src="images/user.gif" alt="bootstrap Chat box user image" class="img-circle" />
                                - Nelson Mandela
                                <br />
                                ( <small>Active from 10 hours</small> )
                            </div>
                            <hr class="hr-clas-low" />
                            <div class="chat-box-online-left">
                                <img src="images/user.png" alt="bootstrap Chat box user image" class="img-circle" />
                                -  Jukka Jalonen
                                <br />
                                ( <small>Active from 3 hours</small> )
                            </div>
                            <hr class="hr-clas-low" />

                            <div class="chat-box-online-right">
                                <img src="images/user.gif" alt="bootstrap Chat box user image" class="img-circle" />
                                -  Ronaldo
                                <br />
                                ( <small>Active from 4 hours</small> )
                            </div>
                            <hr class="hr-clas-low" />
                        </div>

                    </div>

                

                <div class=" col-lg-4 col-md-4 col-sm-4" id="demo">
                    <div class="chat-box-div">
                        <div class="chat-box-head">
                            GROUP CHAT HISTORY
                            
                        
                            
                        </div><!-- Tänne tulee viestit-->
                        
                        <textarea id="messagesTextArea" readonly="readonly" rows="10" cols="45" class="panel-body chat-box-main"> </textarea>
                        <textarea id="usersTextArea" readonly="readonly" rows="10" cols="3"> </textarea><br/>

                        </div><!-- Tänne tulee viestit-->
                        <div class="chat-box-footer">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Enter Text Here..." id="messageText">
                                <span class="input-group-btn">
                                    <button class="btn btn-info" type="button" onclick="sendMessage();">SEND</button>
                                </span>
                            </div>
                            <div class="btn-group">
                                     <a class="btn btn-default" href="#"><i class="fa fa-camera"></i></a>
                                     <a class="btn btn-default" href="#"><i class="fa fa-smile-o"></i></a>
                                     <a class="btn btn-default" href="#"><i class="fa fa-thumbs-o-up"></i></a>
                                     <a class="btn btn-default" href="#"><i class="fa fa-align-justify"></i></a>
                                   </div>
                        </div>

                    </div>

                
                <div class="col-lg-4 col-md-4 col-sm-4" >
                    <div class="chat-box-new-div">
                        <div class="chat-box-new-head">
                            Details
                        </div>
                        <div class="panel-body chat-box-new" id="chat" >

                            
                            
                        </div>
                        <div>
                          <hr class="hr-class-low" />

                            <button class="btn btn-info pull-right" type="button" ><span class="glyphicon glyphicon-phone">Call</span></button>  
                            </div>

                    </div>

                </div>
            </div>
        </div>
    

        <!-- USING SCRIPTS BELOW TO REDUCE THE LOAD TIME -->
        <!-- CORE JQUERY SCRIPTS FILE -->
       <script src="js/jquery-1.11.1.js"></script>
    <!-- CORE BOOTSTRAP SCRIPTS  FILE -->
    <script src="js/bootstrap.js"></script>
        <script>
                                        function pres() {

                                            var a = document.getElementById("in").innerHTML;
                                            var b = document.getElementById("chat");
                                            var c = a.value;

                                            b.innerHTML = a;


                                        }
                                        
                                        function pres1() {

                                            var a = document.getElementById("user1").innerHTML;
                                            var b = document.getElementById("chat");
                                            var c = a.value;

                                            b.innerHTML = a;


                                        }
                                        
                                        function pres3() {

                                            var a = document.getElementById("us").innerHTML;
                                            var b = document.getElementById("chat");
                                            var c = a.value;

                                            b.innerHTML = a;


                                        }
                                        
                                        
                                      
                                 
                                 

        </script>
    </body>
</html>
