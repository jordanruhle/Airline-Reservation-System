package com.pnwairlines.flightreservation.services;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pnwairlines.flightreservation.models.Flight;
import com.pnwairlines.flightreservation.models.FlightSortingOption;
import com.pnwairlines.flightreservation.repositories.FlightRepository;

@Service
public class FlightService {

	@Autowired
	FlightRepository flightRepo;
	
	// ----CREATE & UPDATE----
	public Flight create(Flight newFlight) {
		return flightRepo.save(newFlight);
	}
	// ----CREATE & UPDATE----
	
	// ----READ ONE----
	public Flight getOne(Long id) {
		return flightRepo.findById(id).orElse(null);
	}
	// ----READ ONE----
	
	// ----READ ALL----
	public List<Flight> getAll(){
		return flightRepo.findAll();
	}
	// ----READ ALL----

	// ----DELETE----
	public void deleteOne(Long id) {
		flightRepo.deleteById(id);
	}
	// ----DELETE----
	
	// ----FIND ALL BY ARRIVAL AND DEPARTURE-----
	public List<Flight> findArrivalDeparture(String departure, String arrival) {
		return flightRepo.test(departure, arrival);
	}
	// ----FIND ALL BY ARRIVAL AND DEPARTURE-----
	
	// ----SORTED FIND ALL BY ARRIVAL AND DEPARTURE-----
	public List<Flight> findArrivalDepartureSorted(String departure, String destination, FlightSortingOption sortingOption) {
	    // Fetch flights based on departure and destination
	    List<Flight> flights = findArrivalDeparture(departure, destination);

	    // Sort the flights based on the provided sorting option
	    switch (sortingOption) {
        	case CHEAPEST: 
	            Collections.sort(flights, Comparator.comparingInt(Flight::getPrice));
	            break;
	        case QUICKEST:
	        	Collections.sort(flights, Comparator.comparing(Flight::getDurationInSeconds));; 
	            break;
	        case EARLIEST:
	            Collections.sort(flights, Comparator.comparing(Flight::getDeparture_time));
	            break;
	        case LATEST:
	            Collections.sort(flights, Comparator.comparing(Flight::getDeparture_time).reversed());
	            break;
	    }

	    return flights;
	}
	// ----SORTED FIND ALL BY ARRIVAL AND DEPARTURE-----

}
