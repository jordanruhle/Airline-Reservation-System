package com.pnwairlines.flightreservation.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pnwairlines.flightreservation.models.Flight;



@Repository
public interface FlightRepository extends CrudRepository<Flight, Long> {
	List<Flight> findAll();
}
