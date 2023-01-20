package com.pnwairlines.flightreservation.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.pnwairlines.flightreservation.models.Seat;
import com.pnwairlines.flightreservation.services.FlightService;
import com.pnwairlines.flightreservation.services.SeatService;
import com.pnwairlines.flightreservation.services.UserService;

@Controller
public class SeatController {
	
	@Autowired
	SeatService seatServ;
	
	@Autowired
	UserService userServ;
	
	@Autowired
	FlightService flightServ;
	
	// ----------- VIEW ALL SEATS BY FLIGHT ---------------//
			@GetMapping("/seats/{id}/picker")
			public String index(
				@PathVariable("id") Long id,
				HttpSession session,
				Model model
			) {
				ArrayList<Integer> cartList = new ArrayList<>();
				session.setAttribute("cartList", cartList);
				model.addAttribute("allSeats", seatServ.getSeatsByFlightId(id));
				return "/seat/seatpicker.jsp";
			}
	// ----------- VIEW ALL SEATS BY FLIGHT ---------------//
	
	// ------------------- CART --------------------//
			
			@GetMapping("/seats/{id}")
			public String cart(
				@PathVariable("id") Long id,
				HttpSession session, 
				Model model
			) {	
				Seat thisSeat = seatServ.getOne(id);

				model.addAttribute("seat", seatServ.getOne(id));
				return "seat/cart.jsp";
			}
	// ------------------- CART --------------------//
	

}
