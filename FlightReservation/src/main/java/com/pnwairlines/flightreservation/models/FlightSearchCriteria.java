package com.pnwairlines.flightreservation.models;

public class FlightSearchCriteria {
    private String departure;
    private String destination;
    private int price; // new field
    private FlightSortingOption sortingOption;

    // getters and setters
    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public int getPrice() { // new getter
        return price;
    }

    public void setPrice(int price) { // new setter
        this.price = price;
    }

    public FlightSortingOption getSortingOption() {
        return sortingOption;
    }

    public void setSortingOption(FlightSortingOption sortingOption) {
        this.sortingOption = sortingOption;
    }
}

