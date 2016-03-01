/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chat.app;

/**
 *
 * @author apple
 */
import java.util.HashMap;

/**
 *
 * @author apple
 */
public class UserDAO {
    static HashMap<String, User> USERS = new HashMap<String, User>();
    
    static {
        USERS.put("pauliina", new User("pauliina", "123", "Ms.Ninja Paupi Parkkinen"));
        USERS.put("abdi", new User("abdi", "123", "Mr.Mohammed Cabdi"));
        USERS.put("minhvo", new User("minhvo", "123", "Mr.Minh Hoang VO"));
        USERS.put("peter", new User("peter", "123", "Mr.Peter Hjort"));
    }
    
    
    public static User getUser(String username){
        return USERS.get(username);
    }
    

}

