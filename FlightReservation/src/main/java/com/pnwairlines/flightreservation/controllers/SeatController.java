package com.pnwairlines.flightreservation.controllers;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pnwairlines.flightreservation.models.User;
import com.pnwairlines.flightreservation.services.SeatService;
import com.pnwairlines.flightreservation.services.UserService;

@Controller
public class SeatController {
	
	@Autowired
	SeatService seatServ;
	
	@Autowired
	UserService userServ;
	
	// ----------- VIEW ALL SEATS BY FLIGHT ---------------//
			@GetMapping("/seats/{id}/picker")
			public String index(
				HttpSession session, Model model
			) {
				
				model.addAttribute("allSeats", seatServ.getAll());
				return "/seat/seatpicker.jsp";
			}
	// ----------- VIEW ALL SEATS BY FLIGHT ---------------//
	
	// ------------------- CART --------------------//
			
			@GetMapping("/seats/{id}")
			public String cart(
				HttpSession session, 
				Model model
			) {
				return "seat/cart.jsp";
			}
	// ------------------- CART --------------------//
	

}
