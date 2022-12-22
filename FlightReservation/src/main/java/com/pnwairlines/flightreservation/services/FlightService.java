package com.pnwairlines.flightreservation.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.pnwairlines.flightreservation.models.Flight;
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
}
