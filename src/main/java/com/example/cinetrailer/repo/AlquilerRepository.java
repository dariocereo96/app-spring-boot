package com.example.cinetrailer.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import javax.persistence.Tuple;

import com.example.cinetrailer.model.Alquiler;

public interface AlquilerRepository extends JpaRepository<Alquiler, Integer> {
	
	@Query(value="select peli.id as codigo, peli.titulo as titulo, peli.ruta_portada as rutaPortada, count(*) as total_alquileres,sum(alq.alq_valor) as monto "
			+ "from pelicula peli join alquiler alq on peli.id = alq.pelicula_id "
			+ "group by peli.titulo "
			+ "order by total_alquileres desc",
			nativeQuery=true)
	
	List<Tuple> obtenerPeliculasAlquilas();
}
