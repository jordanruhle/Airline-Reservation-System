package com.pnwairlines.flightreservation.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pnwairlines.flightreservation.models.Seat;

@Repository
public interface SeatRepository extends CrudRepository<Seat, Long> {
	List<Seat> findAll();
}
