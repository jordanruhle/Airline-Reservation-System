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
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "flights")
public class Flight {
	// MEMBER VARIABLES
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty
    private String depature;
    
    @NotEmpty
    private String destination;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date departure_time;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date arrival_time;
    
    @NotEmpty
    private String status;
    
    @NotEmpty
    private String plane;
    
    @NotEmpty
    private int number_of_seats;
    
    // RELATIONSHIP
    @OneToMany(mappedBy="seat", fetch = FetchType.LAZY)
    private List<Seat> seat;
    
    
	
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	// CONSTRUCTORS
    public Flight() {}
    
    
    
   
   // GETTERS / SETTERS / OTHER METHODS
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
	
	@PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
