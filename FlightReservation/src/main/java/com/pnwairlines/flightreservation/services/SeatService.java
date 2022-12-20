package com.pnwairlines.flightreservation.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pnwairlines.flightreservation.models.Seat;
import com.pnwairlines.flightreservation.repositories.SeatRepository;

@Service
public class SeatService {
	@Autowired
	SeatRepository seatRepo;
	
	// CREATE & UPDATE
	public Seat create(Seat newSeat) {
		return seatRepo.save(newSeat);
	}
	public Seat Seat(Seat newSeat) {
		return seatRepo.save(newSeat);
	}
	
	// READ ONE
	public Seat getOne(Long id) {
		return seatRepo.findById(id).orElse(null);
	}
	
	// READ ALL
	public List<Seat> getAll(){
		return seatRepo.findAll();
	}
	
	// DELETE
	public void deleteOne(Long id) {
		seatRepo.deleteById(id);
	}
	
}

