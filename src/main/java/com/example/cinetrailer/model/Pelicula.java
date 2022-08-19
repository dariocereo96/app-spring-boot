package com.example.cinetrailer.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.List;

@Data
@Entity
@Table(name = "pelicula")
public class Pelicula {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank
    private String titulo;

    @NotBlank
    private String sinopsis;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate fechaEstreno;

    private String youtubeTrailerId;

    private String rutaPortada;
    
    private double pelCosto;

    @NotEmpty
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "generopelicula",
    joinColumns = @JoinColumn(name = "idpelicula"),
    inverseJoinColumns = @JoinColumn(name = "idgenero"))
    private List<Genero> generos;

    @Transient
    private MultipartFile portada;
    
    @OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name="pelicula_id")
	private List<Alquiler> alquileres;

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

	public List<Genero> getGeneros() {
		return generos;
	}

	public void setGeneros(List<Genero> generos) {
		this.generos = generos;
	}

	public MultipartFile getPortada() {
		return portada;
	}

	public void setPortada(MultipartFile portada) {
		this.portada = portada;
	}

	public double getPelCosto() {
		return pelCosto;
	}

	public void setPelCosto(double pelCosto) {
		this.pelCosto = pelCosto;
	}

	public List<Alquiler> getAlquileres() {
		return alquileres;
	}

	public void setAlquileres(List<Alquiler> alquileres) {
		this.alquileres = alquileres;
	}

	@Override
	public String toString() {
		return "Pelicula [id=" + id + ", titulo=" + titulo + ", sinopsis=" + sinopsis + ", fechaEstreno=" + fechaEstreno
				+ ", youtubeTrailerId=" + youtubeTrailerId + ", rutaPortada=" + rutaPortada + ", generos=" + generos
				+ ", portada=" + portada + "]";
	}
    
	
    
    
}
