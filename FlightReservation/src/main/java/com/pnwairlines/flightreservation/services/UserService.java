package com.pnwairlines.flightreservation.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;

import com.pnwairlines.flightreservation.models.User;

public class UserService {

	@Autowired
	private UserRepository userRepo;
	
    // TO-DO: Write register and login methods!
    public User register(
    		User newUser, 
    		BindingResult results
    	) {
        // TO-DO: Additional validations!
    	
    	
       //------------ CHECK TO SEE IF PASSWORD MATCHES CONFIRM PASSWORD -----------
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		results.rejectValue("confirm", "ConfirmPass", "Password and Confirm Password must match");
    	}
    	//------------ CHECK TO SEE IF PASSWORD MATCHES CONFIRM PASSWORD -----------
        
    	// --------------- CHECK IF EMAIL IS ALREADY IN DBs ---------------------
         if (checkEmail(newUser.getEmail())) {
     		results.rejectValue("email", "Email", "Email already exist");
         }
         
         if(results.hasErrors()) {
        	 return null;
         }
         // --------------- CHECK IF EMAIL IS ALREADY IN DBs ---------------------
       
        
        // --------------- HASH PASSWORD ---------------------
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return userRepo.save(newUser);
        // --------------- HASH PASSWORD ---------------------
    }
    

    public User login(LoginUser newLoginObject, BindingResult results) {
    	//additional validation
    	
    	//Find the user in the DB
    	if(!this.checkEmail(newLoginObject.getEmail())) {
    		results.rejectValue("email", "Non-existant", "Invalid Credentials");
    	}
        if(results.hasErrors()) {
        	return null;
        }
    	//Check to see if PWD matches PWD in DBs
        User user = userRepo.findByEmail(newLoginObject.getEmail()).orElse(null);
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    results.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	if(results.hasErrors()) {
    		return null;
    	}
    	
    	return user;
    }
    
    // Check if email is already in DBs
    public boolean checkEmail(String email) {
    	Optional<User> user = userRepo.findByEmail(email);
    	
    	if(user.isPresent()) {

    		return true;
    	}
    	else {
    		return false;
    	}
    }   
    
    public User getOneUser(Long id) {
    	return userRepo.findById(id).orElse(null);
    }
    
    
    
//    public User login(LoginUser newLoginObject, BindingResult result) {
//        // TO-DO: Additional validations!
//        return null;
//    }
}