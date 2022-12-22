package com.pnwairlines.flightreservation.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pnwairlines.flightreservation.models.Seat;

@Repository
public interface SeatRepository extends CrudRepository<Seat, Long> {
	List<Seat> findAll();

@Modifying
@Query("update seat d set d.user_id = ?1 WHERE d.id = ?2")
int setUserIdForSeat(Long user_id, Long id);
}
