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
	// ------------- MEMBER VARIABLES -----------------
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
    private String state;
    
    @NotEmpty
	private String password;
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    // ------------ MEMBER VARIABLES -----------------
    
    
    //-------------- RELATIONSHIP --------------------
    @OneToMany(mappedBy="seat", fetch = FetchType.LAZY)
    private List<Seat> seat;
    //-------------- RELATIONSHIP --------------------
    
    
	//-------------- CONSTRUCTORS --------------------
    public User() {}
   
   public User(@NotEmpty String first_name, @NotEmpty String last_name,
			@Past(message = "Date of birth must be before today") Date dob, @NotEmpty @Email String email,
			@NotEmpty String address, @NotEmpty String city, @NotEmpty String state, @NotEmpty String password,
			List<Seat> seat) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.dob = dob;
		this.email = email;
		this.address = address;
		this.city = city;
		this.state = state;
		this.password = password;
		this.seat = seat;
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

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
	
	//----------- GETTERS / SETTERS / OTHER METHODS --------
	
	
}