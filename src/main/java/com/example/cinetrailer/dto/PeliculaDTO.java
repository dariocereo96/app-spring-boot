package com.example.cinetrailer.dto;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import com.example.cinetrailer.model.Alquiler;

public class PeliculaDTO {
	
	    private Integer id;

	    private String titulo;

	    private String sinopsis;

	    private LocalDate fechaEstreno;

	    private String youtubeTrailerId;

	    private String rutaPortada;
	    
	    private double pelCosto;

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getTitulo() {
			return titulo;
		}

		public void setTitulo(String titulo) {
			this.titulo = titulo;
		}

		public String getSinopsis() {
			return sinopsis;
		}

		public void setSinopsis(String sinopsis) {
			this.sinopsis = sinopsis;
		}

		public LocalDate getFechaEstreno() {
			return fechaEstreno;
		}

		public void setFechaEstreno(LocalDate fechaEstreno) {
			this.fechaEstreno = fechaEstreno;
		}

		public String getYoutubeTrailerId() {
			return youtubeTrailerId;
		}

		public void setYoutubeTrailerId(String youtubeTrailerId) {
			this.youtubeTrailerId = youtubeTrailerId;
		}

		public String getRutaPortada() {
			return rutaPortada;
		}

		public void setRutaPortada(String rutaPortada) {
			this.rutaPortada = rutaPortada;
		}

		public double getPelCosto() {
			return pelCosto;
		}

		public void setPelCosto(double pelCosto) {
			this.pelCosto = pelCosto;
		}
	    
	    
	    
}
