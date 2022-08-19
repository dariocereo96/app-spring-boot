package com.example.cinetrailer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.cinetrailer.model.Alquiler;
import com.example.cinetrailer.model.User;

@Controller
@RequestMapping("/estadisticas")
public class EstadisticaController {
	
	@GetMapping("")
	ModelAndView index() {
		return new ModelAndView("admin/estadisticas");
	}
}
