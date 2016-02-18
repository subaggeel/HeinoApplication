package com.chat.websocket;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.StringWriter;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import javax.json.JsonObject;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonWriter;

/**
 *
 * @author apple
 */
@ServerEndpoint(value = "/chatroomServerEndpoint", encoders={ChatMessageEncoder.class}, decoders={ChatMessageDecoder.class})
public class ChatroomServerEndpoint {
    static Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());
    @OnOpen
    public void handleOpen(Session userSession) throws IOException{
        chatroomUsers.add(userSession);
        Iterator<Session> iterator = chatroomUsers.iterator();
        while (iterator.hasNext()) (iterator.next()).getBasicRemote().sendText(buildJsonUserData());
    }
    
    @OnMessage
    public void handleMessage(String message, Session userSession) throws IOException{
        String username = (String) userSession.getUserProperties().get("username");
        Iterator<Session> iterator = chatroomUsers.iterator();        
        if (username == null){
            userSession.getUserProperties().put("username", message);
            userSession.getBasicRemote().sendText(buildJsonMessageData("System"," you are now connected as  " + message));
            while (iterator.hasNext()) (iterator.next()).getBasicRemote().sendText(buildJsonUserData());
        } else {
            while (iterator.hasNext()) iterator.next().getBasicRemote().sendText(buildJsonMessageData(username, message));
        }
    }
    
    @OnClose
    public void handleClose(Session userSession) throws IOException{
        chatroomUsers.remove(userSession);
        Iterator<Session> iterator = chatroomUsers.iterator();
        while (iterator.hasNext()) (iterator.next()).getBasicRemote().sendText(buildJsonUserData());
    }
    
    private String buildJsonUserData(){
        Iterator<String> iterator = getUserNames().iterator();
        JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
        while(iterator.hasNext()) jsonArrayBuilder.add((String) iterator.next());
        return Json.createObjectBuilder().add("users", jsonArrayBuilder).build().toString();
    }
    
    private String buildJsonMessageData(String username, String message){
        JsonObject jsonObject = Json.createObjectBuilder().add("message", username + ": " + message).build();
        StringWriter stringWriter = new StringWriter();
        try(JsonWriter jsonWriter = Json.createWriter(stringWriter)){
            jsonWriter.write(jsonObject);
        }
        return stringWriter.toString();
    }
    
    private Set<String> getUserNames(){
        HashSet<String> returnSet = new HashSet<>();
        Iterator<Session> iterator = chatroomUsers.iterator();
        while(iterator.hasNext()){
            returnSet.add(iterator.next().getUserProperties().get("username").toString());
        }
        return returnSet;
    }
    
}
