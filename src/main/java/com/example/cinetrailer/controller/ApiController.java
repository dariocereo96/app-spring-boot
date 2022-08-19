package com.example.cinetrailer.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Tuple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.cinetrailer.dto.AlquilerDTO;
import com.example.cinetrailer.dto.PeliculaDTO;
import com.example.cinetrailer.model.Pelicula;
import com.example.cinetrailer.repo.AlquilerRepository;
import com.example.cinetrailer.repo.PeliculaRepository;

@RestController
@RequestMapping("/api")
public class ApiController {

	@Autowired
	AlquilerRepository alquilerRepository;
	@Autowired
	PeliculaRepository peliculaRepository;

	@GetMapping("/peliculas/alquiladas")
	List<AlquilerDTO> peliculasAlquiladas() {
		List<Tuple> data = alquilerRepository.obtenerPeliculasAlquilas();
		List<AlquilerDTO> alquilerPeliculas = new ArrayList<AlquilerDTO>();

		for (Tuple tuple : data) {
			AlquilerDTO alquiler = new AlquilerDTO();
			alquiler.setCodigo(Integer.parseInt(tuple.get("codigo").toString()));
			alquiler.setTitulo(tuple.get("titulo").toString());
			alquiler.setRutaPortada(tuple.get("rutaPortada").toString());
			alquiler.setTotalAlquileres(Integer.parseInt(tuple.get("total_alquileres").toString()));
			alquiler.setMonto(Double.parseDouble(tuple.get("monto").toString()));

			alquilerPeliculas.add(alquiler);
		}

		return alquilerPeliculas;
	}

	@GetMapping("/peliculas")
	List<PeliculaDTO> peliculasRecientes() {

		List<Pelicula> pelis = peliculaRepository.findAll();
		List<PeliculaDTO> peliculasDTO = new ArrayList<>();

		for (Pelicula p : pelis) {
			PeliculaDTO peliDTO = new PeliculaDTO();

			peliDTO.setId(p.getId());
			peliDTO.setTitulo(p.getTitulo());
			peliDTO.setSinopsis(p.getSinopsis());
			peliDTO.setFechaEstreno(p.getFechaEstreno());
			peliDTO.setYoutubeTrailerId(p.getYoutubeTrailerId());
			peliDTO.setRutaPortada(p.getRutaPortada());
			peliDTO.setPelCosto(p.getPelCosto());

			peliculasDTO.add(peliDTO);
		}

		return peliculasDTO;
	}

	@GetMapping("/peliculas/{id}")
	PeliculaDTO peliculaDetalle(@PathVariable Integer id) {

		Pelicula p = peliculaRepository.findById(id).get();
		PeliculaDTO peliDTO = new PeliculaDTO();

		peliDTO.setId(p.getId());
		peliDTO.setTitulo(p.getTitulo());
		peliDTO.setSinopsis(p.getSinopsis());
		peliDTO.setFechaEstreno(p.getFechaEstreno());
		peliDTO.setYoutubeTrailerId(p.getYoutubeTrailerId());
		peliDTO.setRutaPortada(p.getRutaPortada());
		peliDTO.setPelCosto(p.getPelCosto());

		return peliDTO;
	}

	@GetMapping(value = "/peliculas", params = "genero")
	List<PeliculaDTO> peliculasPorGenero(@RequestParam String genero) {

		List<Tuple> pelis = peliculaRepository.obtenerPeliculasByGenero(genero);

		List<PeliculaDTO> peliculasDTO = new ArrayList<>();

		for (Tuple p : pelis) {
			PeliculaDTO peliDTO = new PeliculaDTO();

			peliDTO.setId(Integer.parseInt(p.get("id").toString()));
			peliDTO.setTitulo(p.get("titulo").toString());
			peliDTO.setSinopsis(p.get("sinopsis").toString());
			peliDTO.setFechaEstreno(LocalDate.parse(p.get("fecha_estreno").toString()));
			peliDTO.setYoutubeTrailerId(p.get("youtube_trailer_id").toString());
			peliDTO.setRutaPortada(p.get("ruta_portada").toString());
			peliDTO.setPelCosto(Double.parseDouble(p.get("pel_costo").toString()));
			
			peliculasDTO.add(peliDTO);

		}

		return peliculasDTO;
	}

}
