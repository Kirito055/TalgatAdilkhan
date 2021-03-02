package model;

import javax.persistence.*;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id", nullable = false, updatable = false)
    private long userId;
    private String username;
    private String password;
    private String firstname;
    private String lastname;
    @Column(name = "email", nullable = false, unique = true)
    private String email;
    private String phone;
    private boolean enabled = true;


}
