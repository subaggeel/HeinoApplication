/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chat.websocket;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.*;

/**
 *
 * @author apple
 */
public class ChatroomServerConfigurator extends ServerEndpointConfig.Configurator{
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response){
        sec.getUserProperties().put("username", (String)((HttpSession) request.getHttpSession()).getAttribute("username"));
    }
}
