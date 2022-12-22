package com.pnwairlines.flightreservation.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class StripeController {

    @Value("${STRIPE_PUBLIC_KEY}")
    private String stripePublicKey;
    
    @RequestMapping("/checkout")
    public String checkout(Model model, HttpSession session) {
        model.addAttribute("amount", 207 * 100 ); // in cents
        model.addAttribute("stripePublicKey", stripePublicKey);
        model.addAttribute("currency", "usd");
        return "/user/checkout.jsp";
    }
}
