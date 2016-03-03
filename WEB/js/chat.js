
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function doFirst(){
    
   pro =document.getElementById("profile");
   pro.style.visibility= 'hidden';
    var c = document.getElementById("test");
    c.addEventListener("click",myFunction,true);
    c.addEventListener("click",myFunction1,true);
     user = document.getElementById("users");
    user.addEventListener("click",disPlay,false);
    user.addEventListener("click",save,false);

   
    
    
   
}
function myFunction(e){
        d = document.getElementById("demo1");
        d.style.visibility= 'hidden';
        
    }
    
    
    function save(one){
        one = document.getElementById("demo1");
        one.style.visibility = 'visible';
        sessionStorage.setItem(one);
        display(one);
        
        
    }
    
    
     
  
window.addEventListener("load", doFirst, false);




