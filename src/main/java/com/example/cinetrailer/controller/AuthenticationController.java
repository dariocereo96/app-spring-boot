package com.example.cinetrailer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.cinetrailer.dto.UserDTO;
import com.example.cinetrailer.model.Genero;
import com.example.cinetrailer.model.Pelicula;
import com.example.cinetrailer.model.User;
import com.example.cinetrailer.repo.UserRepository;

@Controller
@RequestMapping("/auth")
public class AuthenticationController {

	@Autowired
	private UserRepository userRepository;

	public

	@GetMapping("/login") ModelAndView login() {
		return new ModelAndView("admin/login").addObject("user", new User());
	}

	@PostMapping("/login")
	ModelAndView login(@Validated User user, BindingResult bindingResult, RedirectAttributes ra, HttpSession session) {

		if (bindingResult.hasErrors()) {
			return new ModelAndView("admin/login").addObject("user", user);
		}

		User userSeach = userRepository.findByEmail(user.getEmail());

		if (userSeach != null) {
			if (!userSeach.getPassword().equals(user.getPassword())) {
				ra.addFlashAttribute("msgError", "Error en su contraseña");
				return new ModelAndView("redirect:/auth/login");
			} else {
				session.setAttribute("usuarioLogueado", userSeach);
				System.out.println((User) session.getAttribute("usuarioLogueado"));
				return new ModelAndView("redirect:/");
			}
		}

		ra.addFlashAttribute("msgError", "No existe usuario con el correo ingresado");
		return new ModelAndView("redirect:/auth/login");

	}

	@GetMapping("/register")
	ModelAndView registerUserSocio() {
		return new ModelAndView("admin/register").addObject("formUser", new UserDTO());
	}

	@PostMapping("/register")
	ModelAndView registerUserSocio(UserDTO userDTO, Model model, HttpSession session) {

		if (userDTO.getName().isEmpty()) {
			model.addAttribute("errorName", "Ingrese un nombre de usuario");
			return new ModelAndView("admin/register").addObject("formUser", userDTO);
		}

		if (userDTO.getEmail().isEmpty()) {
			model.addAttribute("errorEmail", "Ingrese un email");
			return new ModelAndView("admin/register").addObject("formUser", userDTO);
		}

		if (userDTO.getPassword().isEmpty()) {
			model.addAttribute("errorPassword", "Ingrese una contraseña");
			return new ModelAndView("admin/register").addObject("formUser", userDTO);
		}

		User user = new User();
		user.setName(userDTO.getName());
		user.setEmail(userDTO.getEmail());
		user.setPassword(userDTO.getPassword());
		user.setTipo("socio");

		User userNew = userRepository.save(user);

		session.setAttribute("usuarioLogueado", userNew);

		return new ModelAndView("redirect:/");

	}

	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.removeAttribute("usuarioLogueado");
		return "redirect:/auth/login";
	}

}
