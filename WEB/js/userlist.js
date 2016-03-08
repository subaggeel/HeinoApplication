
var rootURL = "http://localhost:8080/ChatApplication/webresources/Users";

$(document).ready(function () {

    var currentUser = document.getElementById("current-user").value;

    $(window).load(function () {
        // full load
        findAll();
    });

    

    function findAll() {
        var data;
        console.log('getAll');
        $.ajax({
            type: 'GET',
            url: rootURL,
            data: data,
            dataType: "xml", // data type of response
            success: function (data) {
                parseUsers(data);
            }
        });
    }



    function renderList(username, name) {
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
    }

    function parseUsers(responseXML) {
        $(responseXML).find("user").each(function () {
            var username = $(this).children("username").text();
            var name = $(this).children("fullname").text();
            renderList(username, name);

        });
    }
    
$('#searchbutton').click(function () {
   // $('#usersearch').keyup(function() {
        
        //var searchField = document.getElementById("usersearch");
        var searchField =   $('#usersearch').val();
        $('#searchres').append("start searching for " +searchField.toString());
        //doCompletion(searchField);
        // function doCompletion(searchField) {
       
        var lenght = searchField.length;
        if (lenght >= 2) {
            var data;
            console.log('doCompletion');
            $.ajax({
                type: 'GET',
                url: "http://localhost:8080/ChatApplication/webresources/Users"+"/"+searchField +"?",
                data: searchField,
                dataType: "xml", // data type of response
                success: function (data) {
                    parseSearchResults(data);
                }
            });

        } else if (lenght == 0) {
            clearResults();
        }
   // }
    
       });
    
        function parseSearchResults(responseXML) {
            
            clearResults();
            
            $('#searchres').append("parse");
            $(responseXML).find("user").each(function () {
                $('#searchres').append("in loop");
                
            var username = $(this).children("username").text();
            var name = $(this).children("fullname").text();
            renderSearchMenu(username, name);
        });
    }
    
        function clearResults() {
            $('#searchres').empty();
        }
    
        function renderSearchMenu(username, name) {
        if (username != currentUser) {
//            var button;
//            var text;
//            button = document.createElement("BUTTON");
//            button.className = "list-group-item";
//            button.id = username;
//            button.value = username;
//            button.type = "button";
//            text = document.createTextNode(name);
//            button.appendChild(text);
//            $('#searchres').append(button);
              $('#searchres').append(name);
               $('#searchres').append("DONE!");
        }
    }
    
    });
    