package com.pnwairlines.flightreservation.models;


public class ChargeRequest {
	
	public enum Currency {
        eur, usd;
    }
    private String description;
    private int amount;
    private String currency;
    private String stripeEmail;
    private String stripeToken;
    
    public ChargeRequest() {}
    
    
	public ChargeRequest(String description, int amount, String currency, String stripeEmail, String stripeToken) {
		super();
		this.description = description;
		this.amount = amount;
		this.currency = currency;
		this.stripeEmail = stripeEmail;
		this.stripeToken = stripeToken;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String string) {
		this.currency = string;
	}
	public String getStripeEmail() {
		return stripeEmail;
	}
	public void setStripeEmail(String stripeEmail) {
		this.stripeEmail = stripeEmail;
	}
	public String getStripeToken() {
		return stripeToken;
	}
	public void setStripeToken(String stripeToken) {
		this.stripeToken = stripeToken;
	}
    
    
    
}
