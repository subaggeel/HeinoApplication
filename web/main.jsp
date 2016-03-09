<%-- 
    Document   : main
    Created on : Feb 15, 2016, 1:06:03 PM
    Author     : parkkpau1
--%>
<%@page import="javax.jms.Session"%>

<%@page import="com.chat.app.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="" />
        <meta name="Mohamed Abdi" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>ChatApp</title>
        <!-- BOOTSTRAP CORE STYLE CSS -->
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.theme.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.theme.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.structure.css" type="text/css">

        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- FONT AWESOME  CSS -->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- CUSTOM STYLE CSS -->
        <link href="css/style1.css" rel="stylesheet" />

       
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.ui.accordion.js"></script>


        <script type="text/javascript">
            var websocket = new WebSocket("ws://localhost:8080/ChatApplication/chatroomServerEndpoint/${roomName}");
            websocket.onmessage = function processMessage(message) {
                var jsonData = JSON.parse(message.data);
                if (jsonData.message != null) {
                    messagesTextArea.value += jsonData.message + "\n";
                }
                if (jsonData.users != null) {
                    usersTextArea.value = "";
                    var i = 0;
                    while (i < jsonData.users.length) {
                        usersTextArea.value += jsonData.users[i++] + "\n";
                    }
                }
            }

            function sendMessage() {
                if (messageText.value != "") {
                    websocket.send(messageText.value);
                    messageText.value = "";
                }
            }

            window.onbeforeunload = function () {
                websocket.onclose = function () {};
                websocket.close()
            };




        </script>

    </head>
    <body onload="add();">
        <%
            //Check that session exists for user!
            String userName = null;
            if (session.getAttribute("user") == null) {
                response.sendRedirect("index.html");
            } else {
                User usr;
                usr = (User) session.getAttribute("user");
                userName = usr.getFullName();
            }
        %>





        <nav class="navbar navbar-default" id="nav">
            <div class="container-fluid">   
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Chat Application</a>
                </div>
                <ul class="nav navbar-nav pull-right">

                    <li>
                        <h3 style="color:whitesmoke">Welcome <%=userName%> !</h3>
                        <h3 style="color:whitesmoke">Welcome to ${roomName} !</h3>

                    </li>
                    <li id="myacount"><a href="#"><i class="fa fa-cog" style="color:white">My Account</i></a></li>
                    <li>
                        

                            <li ><a href="#" onclick="document.getElementById('myform').submit()"><i class="fa fa-sign-out" style="color:white">Log out</i></a></li>

                        
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid">
            <form id="myform" action="<%=response.encodeURL("LogoutServlet")%>" method="post"></form>
            <div class="row pad-top pad-bottom"  >



                <div class= "col-xs-12 col-sm-6 col-md-4" id="infolist">
                    <div class="chat-box-online-div">
                        <div class="chat-box-online-head">

                            <div class="input-group">
                                <input type="text" id="usersearch" class="form-control" placeholder="Search for users...">
                                <span class="input-group-btn">
                                    <button class="btn btn-secondary" type="button" id="searchbutton"><span class="glyphicon glyphicon-search"></span></button>
                                </span>
                            </div> 

                        </div>
                        <div class="panel-body chat-box-online" id="users">

                            <div class="chat-box-online-head">
                                ONLINE USERS IN THIS CHAT ROOM
                            </div>
                            <hr class="hr-clas-low">


                            <textarea class="chat-box-online-left" readonly="readonly" style="width:100%"id="usersTextArea">

                            </textarea>
                            <hr class="hr-clas-low" />
                            <div class="chat-box-online-head">
                                Other Users
                            </div>
                            <div class="list-group" id="user-list">
                                <!-- List of users here !! -->
                            </div>

                        </div>

                    </div>

                </div>


                <div class=" col-xs-12 col-sm-6 col-md-4" id="demo">
                    <div class="chat-box-div">
                        <div class="chat-box-head">
                            GROUP CHAT HISTORY

                        </div><!-- Tänne tulee viestit-->
                        <!--                        <div class="panel-body chat-box-main" id="messageTextArea" ></div>-->

                        <textArea id="messagesTextArea" readonly="readonly" style="width:100%"> </textArea>
                        </div><!-- Tänne tulee viestit-->
                        <div class="chat-box-footer">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Enter Text Here..." id="messageText" required autofocus onkeypress="if (event.keyCode == 13) {
                                            sendMessage();
                                        }">
                                <span class="input-group-btn">
                                    <button class="btn btn-info" type="button" onclick="sendMessage();">SEND</button>
                                </span>
                            </div>
                            
                        </div>

                    </div>
                
                      
                
                <div class="col-xs-12 col-sm-6 col-md-4" id="demo1">
                     
                    <div class="chat-box-new-div">
                        <div class="chat-box-new-head">
                            DETAILS
                        </div>
                        <div class="panel-body chat-box-new" id="chat" >

                            
                            
                        </div>
                        <div>
                         

                    </div>
                
            </div>

                </div>
                
        </div>
        </div>
        
        <input type="hidden" id="current-user" type="text" visibility="hidden" value="<%= session.getAttribute("username")%>"/>
        
        <!-- USING SCRIPTS BELOW TO REDUCE THE LOAD TIME -->
        <!-- CORE JQUERY SCRIPTS FILE -->
       <script src="js/jquery-1.11.1.js"></script>
    <!-- CORE BOOTSTRAP SCRIPTS  FILE -->
    <script src="js/bootstrap.js"></script>
    <script src="js/userlist.js" type="text/javascript"></script>
    <script type="text/javascript">$('messagesTextArea').emojiarea();</script>

    </body>

</html>