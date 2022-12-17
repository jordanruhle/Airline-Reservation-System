package com.pnwairlines.flightreservation.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
public class User {
	// MEMBER VARIABLES
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty
    private String first_name;
    @NotEmpty
    private String last_name;
    
    @Past(message="Date of birth must be before today")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date dob;
    
    @NotEmpty
    @Email
	private String email;

    @NotEmpty
    private String address;
    
    @NotEmpty
    private String city;
    
    @NotEmpty
    private String State;
    
    @NotEmpty
	private String password;
    
    
    // RELATIONSHIP
    @OneToMany(mappedBy="seat", fetch = FetchType.LAZY)
    private List<Seat> seat;
    
    
	
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	// CONSTRUCTORS
    public User() {}
    
   
   // GETTERS / SETTERS / OTHER METHODS
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
	
	@PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
