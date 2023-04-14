package com.pnwairlines.flightreservation.models;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
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
import javax.validation.constraints.Min;
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
    
    @Min(0)
    private int price;
    
    @NotEmpty
    private String departure;
    
    @NotEmpty
    private String destination;
    
    @NotEmpty
    private String departure_time;
    
    @NotEmpty
    private String arrival_time;
    
    @Column(name = "duration_in_seconds")
    private Long durationInSeconds = 0L;
    
    @NotEmpty
    private String status;
    
    @NotNull
    private int number_of_seats;
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

// 	-------------------- MEMBER VARIABLES ------------------------
    
    
// 	-------------------- RELATIONSHIP ------------------------

    @OneToMany(mappedBy="flight", cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Seat> seat;
    
// 	-------------------- RELATIONSHIP ------------------------    
    
    
// 	-------------------- CONSTRUCTORS ------------------------
    
    public Flight() {}
    


    public Flight(@NotEmpty String departure, @NotEmpty String destination, @NotNull String departure_time,
            @NotNull String arrival_time, int price, @NotEmpty String status, @NotNull int number_of_seats,
            List<Seat> seat) {
        super();
        this.departure = departure;
        this.destination = destination;
        this.departure_time = departure_time;
        this.arrival_time = arrival_time;
        this.price = price;
        this.status = status;
        this.number_of_seats = number_of_seats;
        this.seat = seat;
    }



// 	-------------------- CONSTRUCTORS ------------------------    
    
   
// ---------------GETTERS / SETTERS / OTHER METHODS ---------------------
	

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
        this.calculateDuration();
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
	
	public int getPrice() {
	    return price;
	}

	public void setPrice(int price) {
	    this.price = price;
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

	public String getDeparture_time() {
		return departure_time;
	}

	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}

	public String getArrival_time() {
		return arrival_time;
	}

	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
	
	 public long getDurationInSeconds() {
	        return durationInSeconds;
	    }

    public void setDurationInSeconds(long durationInSeconds) {
        this.durationInSeconds = durationInSeconds;
    }
    
    public void calculateDuration() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime departureTime = LocalDateTime.parse(this.departure_time, formatter);
        LocalDateTime arrivalTime = LocalDateTime.parse(this.arrival_time, formatter);
        Duration duration = Duration.between(departureTime, arrivalTime);
        this.setDurationInSeconds(duration.getSeconds());
    }
// ---------------GETTERS / SETTERS / OTHER METHODS ---------------------
}