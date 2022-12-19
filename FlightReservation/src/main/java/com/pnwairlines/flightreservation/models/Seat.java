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
	
// ------------ MEMBER VARIABLES -----------------
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty
    private char aisle;
    
    @Min(0)
    private int row;
    
    @Min(0)
    private Double price;
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
// ------------ MEMBER VARIABLES -----------------
    
//-------------- RELATIONSHIP --------------------
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="flight_id")
    private Flight flight;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
//-------------- RELATIONSHIP --------------------
	
//-------------- CONSTRUCTORS --------------------
    public Seat() {}
    
    public Seat(Long id, @NotEmpty char aisle, @Min(0) int row, @Min(0) Double price, Flight flight, User user,
		Date createdAt, Date updatedAt) {
		super();
		this.id = id;
		this.aisle = aisle;
		this.row = row;
		this.price = price;
		this.flight = flight;
		this.user = user;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		}	
//-------------- CONSTRUCTORS --------------------
   
//----------- GETTERS / SETTERS / OTHER METHODS --------
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
	@PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public char getAisle() {
		return aisle;
	}
	public void setAisle(char aisle) {
		this.aisle = aisle;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Flight getFlight() {
		return flight;
	}
	public void setFlight(Flight flight) {
		this.flight = flight;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
//----------- GETTERS / SETTERS / OTHER METHODS --------
	
}

