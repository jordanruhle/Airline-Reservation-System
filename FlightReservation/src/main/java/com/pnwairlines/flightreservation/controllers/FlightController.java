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

import com.pnwairlines.flightreservation.models.Flight;
import com.pnwairlines.flightreservation.models.User;
import com.pnwairlines.flightreservation.services.FlightService;
import com.pnwairlines.flightreservation.services.UserService;

@Controller
public class FlightController {
	
	@Autowired
	FlightService flightService;
	
	@Autowired
	UserService userService;
	
// ---------- CREATE -----------------//
	
	@GetMapping("/flights/new")
	public String newFlight(
		@ModelAttribute("flightObj") Flight emptyFlight,
		HttpSession session
	) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		return "/flights/new.jsp";
	}
	
	@PostMapping("/flights/new")
	public String processFlight(
		@Valid @ModelAttribute("flightObj") Flight filledFlight,
		BindingResult results
	) {
		// VALIDATIONS FAIL
		if(results.hasErrors()) {
			return "/flights/new.jsp";
		}
		Flight newFlight = flightService.create(filledFlight);
		return "redirect:/flights";
	}
	
// ---------- CREATE -----------------//
	
//	---------- READ ONE ---------------//
	
	@GetMapping("/flights/{id}")
	public String oneFlight(
			@PathVariable("id") Long id, 
			Model model
			) {
		model.addAttribute("oneFlight", flightService.getOne(id));
		return "/flights/show.jsp";
	}

//	---------- READ ONE ---------------//
	
// ----------- READ ALL ---------------//
	
	@GetMapping("/flights")
	public String index(
			HttpSession session, 
			Model model
			) {
		Long user_id = (Long) session.getAttribute("user_id");
		User user = userService.getOneUser(user_id);
		model.addAttribute("user", user);
		model.addAttribute("allFlights", flightService.getAll());
		return "/flights/search.jsp";
		
	}
	
// ----------- READ ALL ---------------//
		
// ---------- UPDATE --------------//
	
	@GetMapping("/flights/{id}/edit")
	public String edit(
		@PathVariable("id") Long id,
		Model model
	) {
		model.addAttribute("flightObj", flightService.getOne(id));
		return "/flights/edit.jsp";
	}
	@PutMapping("/flights/{id}/edit")
	public String update(
		@Valid @ModelAttribute("flightObj") Flight flightObj,
		BindingResult results
	) {
		if(results.hasErrors()) {
			return "/flights/edit.jsp";
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
		return "redirect:/flights";
	}
	
// ---------- DELETE --------------//
}