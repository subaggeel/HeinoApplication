                $(document).ready(function () {
                   
                   $(window).load(function(){
                    // full load
                    findAll();
                    });

                    var rootURL = "http://localhost:8080/ChatTEST2/webresources/Users";

                    function findAll() {
                        var data;
                        console.log('getAll');
                        $.ajax({
                            type: 'GET',
                            url: rootURL,
                            data: data,
                            dataType: "xml", // data type of response
                            success: function (data) {
                                parseMessages(data);
                            }
                        });
                    }


                    function renderList(username, name) {
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

                    function parseMessages(responseXML) {
                        $(responseXML).find("user").each(function () {
                            var username = $(this).children("username").text();
                            var name = $(this).children("fullname").text();
                            renderList(username, name);

                        });
                    }

                });