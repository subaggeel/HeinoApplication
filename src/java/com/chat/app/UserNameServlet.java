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
import javax.servlet.http.HttpSession;

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 
        String roomName = request.getParameter("roomSelect");
        if("Private Room".equals(roomName)) roomName=request.getParameter("newRoomName");
        
        if(validateUser(username, password))
        {
            HttpSession session = request.getSession();
            session.setAttribute("user", UserStore.getInstance().getUserByID(username)); //TODO: fix return values, dublicate user call...
            session.setMaxInactiveInterval(30*60);
            //EncodedURL incase cookies are not used (JSESSIONID)
            
            response.setContentType("text/html");
            HttpSession httpSession = request.getSession(true);
            httpSession.setAttribute("username", username);
            request.setAttribute("roomName", roomName);
            request.setAttribute("username", username);
            if (username != null){
                request.getRequestDispatcher("main.jsp").forward(request,response);
            }
        } else{
            response.sendRedirect("loginfail.jsp");
        }
        }

    private boolean validateUser(String username, String password) {
        return UserStore.getInstance().isValidUser(username, password);
    }
    
}