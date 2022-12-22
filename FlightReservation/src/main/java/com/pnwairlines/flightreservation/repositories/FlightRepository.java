package com.pnwairlines.flightreservation.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pnwairlines.flightreservation.models.Flight;



@Repository
public interface FlightRepository extends CrudRepository<Flight, Long> {
	List<Flight> findAll();
	@Query(value="SELECT * FROM flight_reservation_schema.flights WHERE  departure = ?1 and destination = ?2", nativeQuery=true)
	List<Flight> test(String departure, String arrival);
}
