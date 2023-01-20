package com.pnwairlines.flightreservation.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pnwairlines.flightreservation.models.Seat;
import com.pnwairlines.flightreservation.services.SeatService;



@Controller
public class StripeController {
	
	@Autowired
	SeatService seatServ;

    @Value("${STRIPE_PUBLIC_KEY}")
    private String stripePublicKey;
    
    @RequestMapping("/checkout/{id}")
    public String checkout(
    		@PathVariable("id") Long id,
    		Model model, 
    		HttpSession session
    		) {
    	Seat thisSeat = seatServ.getOne(id);
    	int total = (int) (thisSeat.getPrice() * 1.10);
        model.addAttribute("amount", total ); // in cents
        model.addAttribute("stripePublicKey", stripePublicKey);
        model.addAttribute("currency", "usd");
        return "/user/checkout.jsp";
    }
}
