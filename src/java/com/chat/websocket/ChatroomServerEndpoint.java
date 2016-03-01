package com.chat.websocket;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.chat.app.User;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import static java.util.Spliterators.iterator;
import static java.util.Spliterators.iterator;
import static java.util.Spliterators.iterator;
import static java.util.Spliterators.iterator;
import javax.json.JsonObject;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonWriter;
import javax.websocket.EndpointConfig;
import javax.websocket.server.PathParam;

/**
 *
 * @author apple
 */
@ServerEndpoint(value = "/chatroomServerEndpoint/{chatroom}", encoders={ChatMessageEncoder.class}, decoders={ChatMessageDecoder.class}, configurator=ChatroomServerConfigurator.class)
public class ChatroomServerEndpoint {
    static Map<String,Set<Session>> chatrooms = (Map<String,Set<Session>>)Collections.synchronizedMap(new HashMap<String,Set<Session>>());
    
    public Set<Session> getChatroom(String chatroomName){
        Set<Session> chatroom = chatrooms.get(chatroomName);
        if(chatroom==null){
            chatroom = Collections.synchronizedSet(new HashSet<Session>());
            chatrooms.put(chatroomName, chatroom);
        }
        return chatroom;
    }
    
    @OnOpen
    public void handleOpen(EndpointConfig endpointConfig, Session userSession, @PathParam("chatroom") String chatroom) throws IOException{
        userSession.getUserProperties().put("username", endpointConfig.getUserProperties().get("username"));
        userSession.getUserProperties().put("chatroom",chatroom);
        Set<Session> chatroomUsers = getChatroom(chatroom);
        chatroomUsers.add(userSession);
        Iterator<Session> iterator = chatroomUsers.iterator();
        while (iterator.hasNext()) (iterator.next()).getBasicRemote().sendText(buildJsonUserData(chatroomUsers));
    }
    
    @OnMessage
    public void handleMessage(String message, Session userSession) throws IOException{        
        String username = (String) userSession.getUserProperties().get("username");
        String chatroom = (String)userSession.getUserProperties().get("chatroom");
        Set<Session> chatroomUsers = getChatroom(chatroom);
        if(username!=null){            
            chatroomUsers.stream().forEach(x -> {
                try {x.getBasicRemote().sendText(buildJsonData(username, message));}
                catch (Exception e){e.printStackTrace();}
            });
        }
    }
    
    @OnClose
    public void handleClose(Session userSession) throws IOException{
        String chatroom = (String)userSession.getUserProperties().get("chatroom");
        Set<Session> chatroomUsers = getChatroom(chatroom);
        chatroomUsers.remove(userSession);
        //Iterator<Session> iterator = chatroomUsers.iterator();
        //while (iterator.hasNext()) (iterator.next()).getBasicRemote().sendText(buildJsonUserData());
    }
    
    private String buildJsonUserData(Set<Session> chatroomUsers){
        Iterator<String> iterator = getUserNames(chatroomUsers).iterator();
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
    
    private Set<String> getUserNames(Set<Session> chatroomUsers){
        HashSet<String> returnSet = new HashSet<>();
        Iterator<Session> iterator = chatroomUsers.iterator();
        while(iterator.hasNext()){
            returnSet.add(iterator.next().getUserProperties().get("username").toString());
        }
        return returnSet;
    }
    
    private String buildJsonData(String username, String message){
        JsonObject jsonObject = Json.createObjectBuilder().add("message", username + ": " + message).build();
        StringWriter stringWriter = new StringWriter();
        try(JsonWriter jsonWriter = Json.createWriter(stringWriter)){
            jsonWriter.write(jsonObject);
        }
        return stringWriter.toString();
    }
    
}
