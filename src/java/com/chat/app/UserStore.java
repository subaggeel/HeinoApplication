package com.chat.app;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;


public class UserStore {

    private static final UserStore INSTANCE = new UserStore();
    private final TreeMap users;

    private UserStore() {
        //users = new ArrayList<>();
        users = new TreeMap<>();
        this.init();
    }

    public static UserStore getInstance() {
        //UserStoreHolder.INSTANCE.init();
        return INSTANCE;
    }

    private void init() {
        //Users for testing
        users.put("matti1", new User("matti1", "123", "Matti", "Virtanen"));
        users.put("maija1", new User("maija1", "123", "Maija", "Mehiläinen"));

//		try {
//			FileOutputStream out = new FileOutputStream("users.ser");
//			ObjectOutputStream obout = new ObjectOutputStream(out);
//			obout.writeObject(users);
//			obout.close();
//		} catch (FileNotFoundException e) {
//			System.out.println("Could not open dogsmain.ser");
//			e.printStackTrace();
//		} catch (IOException e) {
//			System.out.println("Error writing into file");
//			e.printStackTrace();
//		}
    }

    public List<String> findAll() {
        List<String> names = new ArrayList<>();
        Iterator it = users.keySet().iterator();
        while (it.hasNext()) {
            
            String id = (String) it.next();
            User usr = (User) users.get(id);
            names.add(usr.getFullName());
        }
        return names;
    }
    
        public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>(users.values());
        return userList;
    }

    public Iterable<User> getUsers() {
        return users.keySet();
    }

    public String getUserSuggestive(String name) {
        String res = "";
        Iterator it = users.keySet().iterator();
        while (it.hasNext()) {
            String id = (String) it.next();
            User usr = (User) users.get(id);
            if (usr.getFullName().toLowerCase().startsWith(name)
                    || usr.getUsername().toLowerCase().startsWith(name)) {
                res = usr.getFullName();
            }
        }
        return res;
    }

    public List getUserListSuggestive(String name) {
        List<User> uList = new ArrayList<>();
        Iterator it = users.keySet().iterator();
        while (it.hasNext()) {
            String id = (String) it.next();
            User usr = (User) users.get(id);
            if (usr.getFullName().toLowerCase().startsWith(name)
                    || usr.getUsername().toLowerCase().startsWith(name)) {
                uList.add(usr); 
            }
        }
        return uList;
    }

    public List getNameSuggestive(String name) {
        List<String> uList = new ArrayList<>();
        Iterator it = users.keySet().iterator();
        while (it.hasNext()) {
            String id = (String) it.next();
            User usr = (User) users.get(id);
            if (usr.getFullName().toLowerCase().startsWith(name)
                    || usr.getUsername().toLowerCase().startsWith(name)) {
                uList.add(usr.getFullName()); 
            }
        }
        return uList;
    }

    public User getCompleteXML(String name) {
        Iterator it = users.keySet().iterator();
        User theUser = null;
        while (it.hasNext()) {
            String id = (String) it.next();
            User usr = (User) users.get(id);
            if (usr.getFullName().toLowerCase().startsWith(name)
                    || usr.getUsername().toLowerCase().startsWith(name)) {
                theUser = usr;
            }

        }
        return theUser;
    }

}
