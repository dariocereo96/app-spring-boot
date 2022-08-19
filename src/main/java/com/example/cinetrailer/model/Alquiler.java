package com.example.cinetrailer.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "alquiler")
public class Alquiler {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate alqFechaDesde;

	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate alqFechaEntrega;

	private double alqValor;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	private Pelicula pelicula;
		
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public LocalDate getAlqFechaDesde() {
		return alqFechaDesde;
	}

	public void setAlqFechaDesde(LocalDate alqFechaDesde) {
		this.alqFechaDesde = alqFechaDesde;
	}

	public LocalDate getAlqFechaEntrega() {
		return alqFechaEntrega;
	}

	public void setAlqFechaEntrega(LocalDate alqFechaEntrega) {
		this.alqFechaEntrega = alqFechaEntrega;
	}

	public double getAlqValor() {
		return alqValor;
	}

	public void setAlqValor(double alqValor) {
		this.alqValor = alqValor;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Pelicula getPelicula() {
		return pelicula;
	}

	public void setPelicula(Pelicula pelicula) {
		this.pelicula = pelicula;
	}
	
	
}
