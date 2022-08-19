package com.example.cinetrailer.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.cinetrailer.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	User findByEmail(String email);
}
