package com.example.cinetrailer.repo;

import com.example.cinetrailer.model.Pelicula;

import java.util.List;

import javax.persistence.Tuple;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PeliculaRepository extends JpaRepository<Pelicula, Integer> {
	
	@Query(value="select pel.id,pel.titulo,pel.sinopsis,pel.fecha_estreno,pel.youtube_trailer_id,pel.ruta_portada,pel.pel_costo "
			+ "from genero gen join generopelicula gp on gen.id=gp.idgenero "
			+ "join pelicula pel on gp.idpelicula = pel.id "
			+ "where gen.titulo=?1 "
			+ "order by fecha_estreno desc",
			nativeQuery=true)

	List<Tuple> obtenerPeliculasByGenero(String genero);
}
