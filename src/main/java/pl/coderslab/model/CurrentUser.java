package pl.coderslab.model;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class CurrentUser extends org.springframework.security.core.userdetails.User {

    private final User user;

    public CurrentUser(String email, String password, Collection<? extends GrantedAuthority> authorities, User user){
        super(email,password,authorities);
        this.user =user;
    }

    public User getUser(){return user;}
}
