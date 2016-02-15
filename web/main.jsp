<%-- 
    Document   : main
    Created on : Feb 15, 2016, 1:06:03 PM
    Author     : parkkpau1
--%>

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
        <link href="css/mainstyle.css" rel="stylesheet" />
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script type="text/javascript"> 
            var websocket = new WebSocket("ws://localhost:8080/ChatApplication/chatroomServerEndpoint");
            websocket.onmessage = function processMessage(message){
                var jsonData = JSON.parse(message.data);
                if(jsonData.message !== null) messagesTextArea.value += jsonData.message + "\n";
            };
            
            function sendMessage(){
                websocket.send(messageText.value);
                messageText.value = "";
            }
            
        </script>
    </head>
    <body onload="displayDate()">


        <div class="container-fluid">
            <div>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist" id="tab">
                    <li class="active"><a href="#users" aria-controls="users"  data-toggle="collapse" >Home</a></li>
                    <li ><a href="#profile" aria-controls="profile" role="tab"  ><span class="glyphicon glyphicon-user" style="color:black">Profile</span></a></li>
                    <li ><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-users" style="color:black">Groups</span></a></li>
                    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-log-out-sign-out" style="color:black">Logout</span></a></li>
                    <li role="presentation">
                    </li>

                </ul>
                



            </div>

            <div class="row pad-top pad-bottom">



                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="chat-box-online-div">
                        <div class="chat-box-online-head">

                            USERS

                        </div>
                        <div class="panel-body chat-box-online" id="users">

                            <div class="form-group">
                                <label for="query"></label>
                                <input type="text" class="form-control" name="search" id="search" placeholder="Search users">              
                            </div>
                            <hr class="hr-clas-low">

                            <div class="chat-box-online-left" id="us" onclick="pres3()" >
                              Hanna Salminen
                                <br />
                                ( <small>Active from 3 hours</small> )
                            </div>
                            <hr class="hr-clas-low" />

                        </div>

                    </div>

                </div>

                <div class=" col-lg-4 col-md-4 col-sm-4" id="demo">
                    <div class="chat-box-div">
                        <div class="chat-box-head">
                            GROUP CHAT HISTORY
                        </div><!-- Tänne tulee viestit-->
                        <div class="panel-body chat-box-main" id="messageTextArea" ></div>

                        </div><!-- Tänne tulee viestit-->
                        <div class="chat-box-footer">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Enter Text Here..." id="messageText">
                                <span class="input-group-btn">
                                    <button class="btn btn-info" type="button" onclick="sendMessage();">SEND</button>
                                </span>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-lg-4 col-md-4 col-sm-4" id="demo1">

                
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

