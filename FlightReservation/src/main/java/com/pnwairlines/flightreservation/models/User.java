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
import javax.validation.constraints.NotNull;
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
    private String firstName;
    @NotEmpty
    private String lastName;
    
    @NotNull
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

    @NotNull
    private Integer zip;
    

	@NotEmpty
	private String password;
  
    @NotEmpty
    private String confirm;
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    // ------------ MEMBER VARIABLES -----------------
    
    
    //-------------- RELATIONSHIP --------------------
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Seat> seat;
    //-------------- RELATIONSHIP --------------------
    
    
	//-------------- CONSTRUCTORS --------------------
    public User() {}
   

   public User(@NotEmpty String firstName, @NotEmpty String lastName,
			@Past(message = "Date of birth must be before today") Date dob, @NotEmpty @Email String email,
			@NotEmpty String address, @NotEmpty String city, @NotEmpty String state, @NotNull Integer zip, @NotEmpty String password,
			@NotEmpty String confirm, List<Seat> seat) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob = dob;
		this.email = email;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.password = password;
		this.confirm = confirm;
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public void setState(String state) {s
		this.state = state;
	}

	public Integer getZip() {
		return zip;
	}
	
	public void setZip(Integer zip) {
		this.zip = zip;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
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
	
	//---------- GETTERS / SETTERS / OTHER METHODS --------
	
	
}