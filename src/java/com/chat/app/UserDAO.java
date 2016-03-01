package com.chat.app;

import java.util.HashMap;

public class UserDAO {
    static HashMap<String, User> USERS = new HashMap<String, User>();
    
    static {
        USERS.put("pauliina", new User("pauliina", "123", "Pauliina", "Parkkinen"));
        USERS.put("abdi", new User("abdi", "123", "Mohammed", "Cabdi"));
        USERS.put("minhvo", new User("minhvo", "123", "Minh Hoang", "VO"));
    }
    
    
    public static User getUser(String username){
        return USERS.get(username);
    }
    

}

