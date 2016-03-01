/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chat.APIResources;

import com.chat.app.User;
import com.chat.app.UserStore;
import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author parkkpau1
 */
@Path("/Users")
public class UserResource {

    private final UserStore users;
//    @Context
//    private UriInfo context;

    /**
     * Creates a new instance of UserResource
     */
    public UserResource() {
        this.users = UserStore.getInstance();
    }

    /**
     * Retrieves representation of an instance of com.chat.APIResources.UserResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public List<User> getAll() {
        return users.getAllUsers();
    }

    /**
     * PUT method for updating or creating an instance of UserResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_XML)
    public void putXml(String content) {
    }
}
