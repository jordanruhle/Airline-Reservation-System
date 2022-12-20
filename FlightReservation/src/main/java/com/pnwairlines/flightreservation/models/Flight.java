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
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "flights")
public class Flight {
// 	-------------------- MEMBER VARIABLES ------------------------
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty
    private String departure;
    
    @NotEmpty
    private String destination;
    
    @NotNull
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date departure_time;
    
    @NotNull
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date arrival_time;
    
    @NotEmpty
    private String status;
    
    @NotEmpty
    private String plane;
    
    @NotNull
    private int number_of_seats;
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

// 	-------------------- MEMBER VARIABLES ------------------------
    
    
// 	-------------------- RELATIONSHIP ------------------------

    @OneToMany(mappedBy="flight", fetch = FetchType.LAZY)
    private List<Seat> seat;
    
// 	-------------------- RELATIONSHIP ------------------------    
    
    
// 	-------------------- CONSTRUCTORS ------------------------
    
    public Flight() {}
    


    public Flight(@NotEmpty String departure, @NotEmpty String destination, @NotNull Date departure_time,
		@NotNull Date arrival_time, @NotEmpty String status, @NotEmpty String plane, @NotNull int number_of_seats,
		List<Seat> seat) {
	super();
	this.departure = departure;
	this.destination = destination;
	this.departure_time = departure_time;
	this.arrival_time = arrival_time;
	this.status = status;
	this.plane = plane;
	this.number_of_seats = number_of_seats;
	this.seat = seat;
}



// 	-------------------- CONSTRUCTORS ------------------------    
    
   
// ---------------GETTERS / SETTERS / OTHER METHODS ---------------------
	

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

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getDeparture_time() {
		return departure_time;
	}

	public void setDeparture_time(Date departure_time) {
		this.departure_time = departure_time;
	}

	public Date getArrival_time() {
		return arrival_time;
	}

	public void setArrival_time(Date arrival_time) {
		this.arrival_time = arrival_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPlane() {
		return plane;
	}

	public void setPlane(String plane) {
		this.plane = plane;
	}

	public int getNumber_of_seats() {
		return number_of_seats;
	}

	public void setNumber_of_seats(int number_of_seats) {
		this.number_of_seats = number_of_seats;
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

	public List<Seat> getSeat() {
		return seat;
	}

	public void setSeat(List<Seat> seat) {
		this.seat = seat;
	}
	
	
	
	
// ---------------GETTERS / SETTERS / OTHER METHODS ---------------------
}