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

import com.pnwairlines.flightreservation.models.LoginUser;
import com.pnwairlines.flightreservation.models.User;
import com.pnwairlines.flightreservation.services.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userServ;
	
	// ---------------- LOGIN ------------------
	@GetMapping("/login")
	public String index(
		@ModelAttribute("newLogin") LoginUser emptyLoginUser
	) {
		return "user/login.jsp";
	}
	// ---------------- LOGIN ------------------
	
	// ------------- REGISTRATION ---------------
	@GetMapping("/register")
	public String index(
		@ModelAttribute("newUser") User emptyUser
	) {
		return "user/register.jsp";
	}
	// ------------- REGISTRATION ---------------
	
	
	// ----------- PROCESS REGISTRATION ---------
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User filledUser,
			BindingResult results,
			HttpSession session,
			Model model
			) {
		User createdUser = userServ.register(filledUser, results);
		if(results.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "user/register.jsp";
		}
	//------------ SAVE USER ID IN SESSION --------
		session.setAttribute("user_id", createdUser.getId());
		return "redirect:/checkout";
	}
	// ----------- PROCESS REGISTRATION -----------

	// ----------- CHECKOUT -----------
	@GetMapping("/checkout")
	public String checkout(
		HttpSession session,
		@ModelAttribute("newPaymentInfo") LoginUser emptyPaymentInfo
	) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/login";
		}
		return "user/checkout.jsp";
	}
	// ----------- CHECKOUT -----------
	
	//---------------- PROCESS LOGIN --------------
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin") LoginUser filledLoginUser,
			BindingResult results,
			HttpSession session,
			Model model
			) {
		User loggedUser = userServ.login(filledLoginUser, results);
		if(results.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "user/index.jsp";
		}
		//------------ SAVE USER ID IN SESSION ------------
		session.setAttribute("user_id", loggedUser.getId());
		return "redirect:/home";
	}
	//---------------- PROCESS LOGIN --------------

	//------------------ LOGOUT ------------------
	@GetMapping("/logout")
	public String logout(
		HttpSession session
	) {
		session.setAttribute("user_id", null); 
			return "redirect:/";
		
	}
	//------------------ LOGOUT ------------------
	
}
