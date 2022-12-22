package com.pnwairlines.flightreservation.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pnwairlines.flightreservation.models.ChargeRequest;



@Controller
public class StripeController {

    @Value("${STRIPE_PUBLIC_KEY}")
    private String stripePublicKey;
    
    @RequestMapping("/checkout")
    public String checkout(Model model) {
        model.addAttribute("amount", 50 * 100); // in cents
        model.addAttribute("stripePublicKey", stripePublicKey);
        model.addAttribute("currency", "usd");
        return "/user/checkout.jsp";
    }
}
