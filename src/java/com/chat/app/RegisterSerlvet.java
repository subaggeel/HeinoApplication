/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chat.app;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author apple
 */
@WebServlet("/RegisterSerlvet")
public class RegisterSerlvet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private User newUser = new User();
    private UserStore newUserStore = new UserStore();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");

        
        if(availableUser(username))
        {
            if (username != null){
                response.setContentType("text/html");
                newUser.setUsername(username);
                newUser.setPassword(password);
                newUser.setFirstname(firstname);
                newUser.setLastname(lastname);
                UserStore.users.put(newUser.getUsername(), new User(username, password, firstname, lastname));
                
                response.sendRedirect("index.jsp");
            }
        } else{
            response.sendRedirect("registerfail.jsp");
        }
    }
    
    private boolean availableUser(String username) {
        return UserStore.getInstance().isAvailable(username);


    }
}
