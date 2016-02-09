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
        USERS.put("minhhoang308", new User("minhhoang308", "123", "Vo Minh Hoang"));
        USERS.put("minhhoang308", new User("minhhoang", "123", "Vo Minh Hoang Test 2"));
    }
    
    
    public static User getUser(String username){
        return USERS.get(username);
    }
}

