package com.pnwairlines.flightreservation.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.pnwairlines.flightreservation.models.LoginAdmin;
import com.pnwairlines.flightreservation.models.Admin;
import com.pnwairlines.flightreservation.services.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminServ;
	
	// ---------------- LOGIN ------------------
	@GetMapping("admins/login")
	public String index(
		@ModelAttribute("newLogin") LoginAdmin emptyLoginAdmin
	) {
		return "admin/login.jsp";
	}
	// ---------------- LOGIN ------------------
	
	//---------------- PROCESS LOGIN --------------
	@PostMapping("admins/login")
	public String login(
			@Valid @ModelAttribute("newLogin") LoginAdmin filledLoginAdmin,
			BindingResult results,
			HttpSession session,
			Model model
			) {
		Admin loggedAdmin = adminServ.login(filledLoginAdmin, results);
		if(results.hasErrors()) {
			model.addAttribute("newAdmin", new Admin());
			return "admin/login.jsp";
		}
		//------------ SAVE USER ID IN SESSION ------------
		session.setAttribute("admin_id", loggedAdmin.getId());
		return "redirect:/admins/dashboard";
	}
	//---------------- PROCESS LOGIN --------------
	
}