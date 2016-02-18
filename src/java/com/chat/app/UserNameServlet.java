/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chat.app;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author apple
 */
@WebServlet("/UserNameServlet")
public class UserNameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 
        
        if(validateUser(username, password))
        {
            HttpSession session = request.getSession();
            session.setAttribute("user", UserDAO.getUser(username)); //TODO: fix return values, dublicate user call...
            session.setMaxInactiveInterval(30*60);
            //EncodedURL incase cookies are not used (JSESSIONID)
            String encodedURL = response.encodeRedirectURL("main.jsp");
            
            response.setContentType("text/html");
            PrintWriter printWriter = response.getWriter();
            HttpSession httpSession = request.getSession(true);
            httpSession.setAttribute("username", username);
            if (username != null){
                response.sendRedirect(encodedURL);
            }
        }
        }

    private boolean validateUser(String username, String password) {
        User usr = UserDAO.getUser(username);
        return usr != null && usr.getPassword().equals(password);
    }
    
}
