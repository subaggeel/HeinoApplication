package com.chat.app;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

/**
 *
 * @author parkkpau1
 */
public class UserStore {

    public static final UserStore INSTANCE = new UserStore();
    static TreeMap users;

    public UserStore() {
        //users = new ArrayList<>();
        users = new TreeMap<>();
        this.init();
    }

    public static UserStore getInstance() {
        //UserStoreHolder.INSTANCE.init();
        return INSTANCE;
    }

    private void init() {
//        users.add(new User("matti1", "123", "Matti Virtanen"));
//        users.add(new User("maija1", "123", "Maija Mehiläinen"));
        users.put("matti1", new User("matti1", "123", "Matti", "Virtanen"));
        users.put("maija1", new User("maija1", "123", "Maija", "Mehiläinen"));
        users.put("pauliina", new User("pauliina", "123", "Pauliina", "Parkkinen"));
        users.put("abdi", new User("abdi", "123", "Mohammed", "Cabdi"));
        users.put("minhvo", new User("minhvo", "123", "Minh Hoang", "VO"));
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

    public List<User> getComplete(String name) {
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

    /**
     *
     * @param username
     * @param password
     * @return
     */
    public boolean isValidUser(String username, String password) {
        User usr = (User) users.get(username); //username as key
        if (usr != null) {
            //check the password
            return usr.getPassword().equals(password);
        } else {
            return false;
        }
    }

    public User getUserByID(String username) {
        User usr = (User) users.get(username); //username as key
        return usr;
    }

    public void createUser(User user) {
        users.put(user.getUsername(), user);
    }
    
    public boolean isAvailable(String username) {
        User usr = (User) users.get(username); //username as key
        return usr == null;
    }

}
