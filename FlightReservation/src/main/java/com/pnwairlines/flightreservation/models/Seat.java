package com.pnwairlines.flightreservation.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "seats")
public class Seat {
	// MEMBER VARIABLES
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty
    private char aisle;
    
    @Min(0)
    private int row;
    
    @Min(0)
    private Double price;
    
    
//    RELATIONSHIP
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="flight_id")
    private Flight flight;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
    
	
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	// CONSTRUCTORS
    public Seat() {}
    
   
   // GETTERS / SETTERS / OTHER METHODS
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
	
	@PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}