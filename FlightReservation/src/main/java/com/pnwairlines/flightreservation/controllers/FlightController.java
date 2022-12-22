package com.pnwairlines.flightreservation.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pnwairlines.flightreservation.models.Flight;
import com.pnwairlines.flightreservation.models.Seat;
import com.pnwairlines.flightreservation.repositories.SeatRepository;
import com.pnwairlines.flightreservation.services.FlightService;
import com.pnwairlines.flightreservation.services.SeatService;
import com.pnwairlines.flightreservation.services.UserService;

@Controller
public class FlightController {
	
	@Autowired
	FlightService flightService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	SeatService seatService;
	
// ---------- HOMEPAGE -----------------//
	@GetMapping("/")
	public String home(
		HttpSession session
	) {
		return "/flight/index.jsp";
	}
// ---------- HOMEPAGE -----------------//
	
	
	
// ---------- CREATE -----------------//
	@GetMapping("/flights/create")
	public String newFlight(
		@ModelAttribute("flightObj") Flight emptyFlight,
		HttpSession session
	) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:admins/login";
		}
		return "/flight/create.jsp";
	}
	
	@PostMapping("/flights/create")
	public String processFlight(
		@Valid @ModelAttribute("flightObj") Flight filledFlight,
		BindingResult results
	) {
		// VALIDATIONS FAIL
		System.out.println(results);
		if(results.hasErrors()) {
			return "/flight/create.jsp";
		}
		Flight newFlight = flightService.create(filledFlight);
		int row = 0;
		for(int i = 0; i < newFlight.getNumber_of_seats(); i++) {
			int modulus = i % 6;
			String aisle;
			if(modulus == 0) {
				aisle = "A";
				row++;
			}
			else if(modulus == 1) {
				aisle = "B";
			}
			else if(modulus == 2) {
				aisle = "C";
			}
			else if(modulus == 3) {
				aisle = "D";
			}
			else if(modulus == 4) {
				aisle = "E";
			}
			else {
				aisle = "F";
			}
			Seat seatObj = new Seat(aisle, row, 188.95, newFlight, null);
			seatService.create(seatObj);
		}
		return "redirect:/admins/dashboard";
	}
	
// ---------- CREATE -----------------//
	
//	---------- READ ONE ---------------//
	
	@GetMapping("/flights/{id}")
	public String oneFlight(
			@PathVariable("id") Long id, 
			Model model
			) {
		model.addAttribute("oneFlight", flightService.getOne(id));
		return "/flight/show.jsp";
	}

//	---------- READ ONE ---------------//
	
// ----------- READ ALL ---------------//
	@GetMapping("/admins/dashboard")
	public String allFlights(
			HttpSession session, 
			Model model
			) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:/admins/login";
		}
		model.addAttribute("allFlights", flightService.getAll());
		return "/flight/all.jsp";
	}
// ----------- READ ALL ---------------//
	
// ----------- FLIGHT SEARCH ---------------//
	@PostMapping("/flights")
	public String index(
			@RequestParam("departure") String departure,
			@RequestParam("destination") String destination,
			HttpSession session, 
			Model model
			) {
		model.addAttribute("allFlights", flightService.findArrivalDeparture(departure, destination));
		System.out.println(flightService.findArrivalDeparture(departure, destination));
		return "/flight/search.jsp";
	}
// ----------- FLIGHT SEARCH ---------------//
		
// ---------- UPDATE --------------//
	
	@GetMapping("/flights/{id}/edit")
	public String edit(
		@PathVariable("id") Long id,
		Model model
	) {
		model.addAttribute("flightObj", flightService.getOne(id));
		return "/flight/edit.jsp";
	}
	@PutMapping("/flights/{id}/edit")
	public String update(
		@Valid @ModelAttribute("flightObj") Flight flightObj,
		BindingResult results
	) {
		if(results.hasErrors()) {
			return "/flight/edit.jsp";
		}
		else {
			flightService.create(flightObj);
			return "redirect:/flights";
		}
	}
	
// ---------- UPDATE --------------//
	
// ---------- DELETE --------------//
	
	@GetMapping("/flights/{id}/delete")
	public String delete(
		@PathVariable("id") Long id
	) {
		flightService.deleteOne(id);
		return "redirect:/flights";
	}
	@DeleteMapping("/flights/{id}")
	public String deleteFlight(
		@PathVariable("id") Long id
	) {
		flightService.deleteOne(id);
		return "redirect:/admins/dashboard";
	}
	
// ---------- DELETE --------------//
}
