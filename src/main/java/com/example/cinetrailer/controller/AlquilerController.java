package com.example.cinetrailer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.cinetrailer.dto.AlquilerDTO;
import com.example.cinetrailer.model.Alquiler;
import com.example.cinetrailer.model.Pelicula;
import com.example.cinetrailer.model.User;
import com.example.cinetrailer.repo.AlquilerRepository;
import com.example.cinetrailer.repo.PeliculaRepository;
import com.example.cinetrailer.repo.UserRepository;
import com.example.cinetrailer.service.GeneratePDFService;
import com.lowagie.text.DocumentException;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Tuple;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/alquiler")
public class AlquilerController {

	@Autowired
	PeliculaRepository peliculaRepository;
	@Autowired
	AlquilerRepository alquilerRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	private GeneratePDFService generatePDFService;

	//Ver las peliculas alquiladas del usuario registrado
	@GetMapping("")
	ModelAndView index(HttpSession session) {
		if(session.getAttribute("usuarioLogueado")!=null){
			int userID = ((User) session.getAttribute("usuarioLogueado")).getId();
			List<Alquiler> alquilerPeliculas = userRepository.getOne(userID).getAlquileres();
			System.out.println("Numero de listado" + alquilerPeliculas.size());
			return new ModelAndView("admin/alquiladas-peliculas").addObject("alquilerPeliculas", alquilerPeliculas);
		}
		
		return new ModelAndView("redirect:/auth/login");
	
	}

	@GetMapping("/{id}")
	ModelAndView alquilarPelicula(@PathVariable Integer id,HttpSession session) {
		if(session.getAttribute("usuarioLogueado")!=null){
			Pelicula pelicula = peliculaRepository.getOne(id);
			Alquiler alquiler = new Alquiler();
			alquiler.setAlqFechaDesde(LocalDate.now());
			return new ModelAndView("admin/alquilar-pelicula").addObject("pelicula", pelicula).addObject("alquiler",
					alquiler);
		}
		
		return new ModelAndView("redirect:/auth/login");
		

	}

	@PostMapping("/{id}")
	ModelAndView alquilarPelicula(@PathVariable Integer id, Alquiler alquiler, RedirectAttributes ra,
			HttpSession session) {
		Pelicula pelicula = peliculaRepository.getOne(id);
		alquiler.setAlqValor(pelicula.getPelCosto());
		alquiler.setPelicula(pelicula);
		alquiler.setUser((User) session.getAttribute("usuarioLogueado"));
		alquilerRepository.save(alquiler);

		ra.addFlashAttribute("msgInfo", "Se registro el alquiler corectamente");

		return new ModelAndView("redirect:/alquiler");

	}

	@GetMapping("/listado")
	ModelAndView alquilerAdmin(HttpSession session) {

		if(session.getAttribute("usuarioLogueado")!=null){
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

			return new ModelAndView("admin/alquiladas-reporte").addObject("alquilerPeliculas", alquilerPeliculas);
		}
		
		return new ModelAndView("redirect:/auth/login");
		
	}
	
	@PostMapping("/{id}/eliminar")
	String eliminarAlquiler(@PathVariable Integer id,RedirectAttributes ra){
		alquilerRepository.deleteById(id);
		ra.addFlashAttribute("msgInfo", "Se quito la pelicula de su alquiler");
		return "redirect:/alquiler";
	}
	
	@GetMapping("/pdf")
	public void generatePDF(HttpServletResponse response) {
		response.setContentType("application/pdf");
		String headerKey = "Content-Disposition";
		String headerValue = "inline;filename=pd_alquiler_"+LocalDate.now().toString()+".pdf";
		
		response.setHeader(headerKey, headerValue);

		try {
			generatePDFService.alquilerPDF(response,alquilerRepository.obtenerPeliculasAlquilas());
		} catch (DocumentException | IOException e) {
			System.out.println(e.getMessage());
		}

	}

}
