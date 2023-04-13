package com.pnwairlines.flightreservation.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.pnwairlines.flightreservation.models.ChargeRequest;
import com.pnwairlines.flightreservation.models.Seat;
import com.pnwairlines.flightreservation.services.SeatService;
import com.pnwairlines.flightreservation.services.StripeService;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;

@Controller
public class ChargeController {

    @Autowired
    private StripeService paymentsService;
    
    @Autowired
    private SeatService seatService;

    @PostMapping("/charge")
    public String charge(ChargeRequest chargeRequest, Model model, HttpSession session)
      throws StripeException {
        chargeRequest.setDescription("Example charge");
        chargeRequest.setCurrency("usd");
        Charge charge = paymentsService.charge(chargeRequest);
        model.addAttribute("id", charge.getId());
        model.addAttribute("status", charge.getStatus());
        model.addAttribute("chargeId", charge.getId());
        model.addAttribute("balance_transaction", charge.getBalanceTransaction());
        Seat thisSeat = (Seat) session.getAttribute("seat");
        Long seat_id = thisSeat.getId();
        Long user_id = (Long)  session.getAttribute("user_id");
        seatService.reserveSeat(user_id, seat_id );
        return "/user/result.jsp";
    }

    @ExceptionHandler(StripeException.class)
    public String handleError(Model model, HttpSession session, StripeException ex) {
    	Object theSeat = session.getAttribute("seat");
		session.setAttribute("seat", theSeat);
		session.setAttribute("error", ex.getMessage());
        System.out.println(ex.getMessage());
        return "redirect:/cart";
    }
    
    @GetMapping("/result")
	public String index( Model model) {
    	System.out.println()
		return "user/result.jsp";
	}
}