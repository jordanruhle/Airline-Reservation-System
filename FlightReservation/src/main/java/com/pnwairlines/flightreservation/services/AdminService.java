package com.pnwairlines.flightreservation.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.pnwairlines.flightreservation.models.Admin;
import com.pnwairlines.flightreservation.models.LoginAdmin;
import com.pnwairlines.flightreservation.repositories.AdminRepository;

@Service
public class AdminService {

	@Autowired
	private AdminRepository adminRepo;
	
    // TO-DO: Write register and login methods!
    public Admin register(
    		Admin newAdmin, 
    		BindingResult results
    	) {
        
    	// --------------- CHECK IF EMAIL IS ALREADY IN DBs ---------------------
         if (checkEmail(newAdmin.getEmail())) {
     		results.rejectValue("email", "Email", "Email already exist");
         }
         
         if(results.hasErrors()) {
        	 return null;
         }
         // --------------- CHECK IF EMAIL IS ALREADY IN DBs ---------------------
       
        
        // --------------- HASH PASSWORD ---------------------
        String hashed = BCrypt.hashpw(newAdmin.getPassword(), BCrypt.gensalt());
        newAdmin.setPassword(hashed);
        return adminRepo.save(newAdmin);
        // --------------- HASH PASSWORD ---------------------
    }
    

    public Admin login(LoginAdmin newLoginObject, BindingResult results) {
    	//additional validation
    	
    	//Find the admin in the DB
    	if(!this.checkEmail(newLoginObject.getEmail())) {
    		results.rejectValue("email", "Non-existant", "Invalid Credentials");
    	}
        if(results.hasErrors()) {
        	return null;
        }
    	//Check to see if PWD matches PWD in DBs
        Admin admin = adminRepo.findByEmail(newLoginObject.getEmail()).orElse(null);
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), admin.getPassword())) {
    	    results.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	if(results.hasErrors()) {
    		return null;
    	}
    	
    	return admin;
    }
    
    // Check if email is already in DBs
    public boolean checkEmail(String email) {
    	Optional<Admin> admin = adminRepo.findByEmail(email);
    	
    	if(admin.isPresent()) {

    		return true;
    	}
    	else {
    		return false;
    	}
    }   
    
    public Admin getOneAdmin(Long id) {
    	return adminRepo.findById(id).orElse(null);
    }
    
//    public Admin login(LoginAdmin newLoginObject, BindingResult result) {
//        // TO-DO: Additional validations!
//        return null;
//    }
}
