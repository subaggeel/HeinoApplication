package com.chat.app;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement 
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    private String username;
    private String password;  
    private String firstname;
    private String lastname;
    private String title;
    private String department;

    public User() {
        
    }
    
    
    public User(String username, String password, String firstname, String lastname){
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
    }
    
    public User(String username, String password, String firstname, String lastname,
                String title, String department){
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.title = title;
        this.department = department;
    }
        
    /**
     * @return the username
     */
    @XmlElement 
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
        //testing Git
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the fullName
     */
    @XmlElement 
    public String getFullName() {
        return firstname +" " +lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
}
