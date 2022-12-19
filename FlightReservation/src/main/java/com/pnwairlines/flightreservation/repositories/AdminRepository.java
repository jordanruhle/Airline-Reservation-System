package com.pnwairlines.flightreservation.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pnwairlines.flightreservation.models.Admin;

@Repository
public interface AdminRepository extends CrudRepository<Admin, Long> {
	List<Admin> findAll();
	
	Optional<Admin> findByEmail(String email);
}
