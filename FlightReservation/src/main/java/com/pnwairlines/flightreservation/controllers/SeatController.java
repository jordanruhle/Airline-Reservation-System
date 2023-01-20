package com.pnwairlines.flightreservation.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
	
    @Value("${STRIPE_PUBLIC_KEY}")
    private String stripePublicKey;
	
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
	
	// ------------------- RESERVE SEAT (CART OR LOGIN) --------------------//
			
			@GetMapping("/seats/{id}")
			public String cart(
				@PathVariable("id") Long id,
				HttpSession session, 
				Model model
			) {	
				Seat thisSeat = seatServ.getOne(id);
				session.setAttribute("seat", thisSeat);
				
				System.out.println(thisSeat);
				if(session.getAttribute("user_id") != null) {
					Seat oneSeat = (Seat) session.getAttribute("seat");
					System.out.println(oneSeat);
					return "redirect:/cart";	
				}
				return "redirect:/login";
			}

	// ------------------- RESERVE SEAT (CART OR LOGIN) --------------------//
			
			
	// ---------------------- CART ----------------------
			
			@GetMapping("/cart")
			public String cart(
					HttpSession session,
					Model model
					) {
				Object theSeat = session.getAttribute("seat");
				session.setAttribute("seat", theSeat);
				if(session.getAttribute("user_id") == null) {
					return "redirect:/login";
				}
				Seat thisSeat = (Seat) session.getAttribute("seat");
		    	int total = (int) (thisSeat.getPrice() * 1.10);
		        model.addAttribute("amount", total ); // in cents
		        model.addAttribute("stripePublicKey", stripePublicKey);
		        model.addAttribute("currency", "usd");
				return "seat/cart.jsp";
			}
			
	// ---------------------- CART ----------------------

	
			@GetMapping("/seats/{id}/remove")
			public String remove(
					@PathVariable("id") Long id,
					HttpSession session, 
					Model model
					) {	
				session.setAttribute("seat", null);
				return "redirect:/seats/" + id + "/picker";
			}

}
