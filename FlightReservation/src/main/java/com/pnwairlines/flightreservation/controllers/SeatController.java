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
	
	// ----------- READ ALL ---------------//
			@GetMapping("/seats")
			public String index(
				HttpSession session, Model model
			) {
				if(session.getAttribute("user_id") == null) {
					return "redirect:/";
				}
				Long user_Id = (Long) session.getAttribute("user_id");
				User user = userServ.getOneUser(user_Id);
				model.addAttribute("user", user);
				
				model.addAttribute("allBabys", seatServ.getAll());
				return "/babys/dashboard.jsp";
			}
			//-----------READ ALL ----------------//
	

}
