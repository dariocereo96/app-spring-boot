package com.example.cinetrailer.service;

import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.persistence.Tuple;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.example.cinetrailer.dto.AlquilerDTO;
import com.example.cinetrailer.model.Pelicula;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfCell;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

@Service
public class GeneratePDFService {

	public void peliculasPDF(HttpServletResponse response, List<Pelicula> peliculas)
			throws DocumentException, IOException {

		// Creacion del pdf
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());

		document.open();

		// Agregar Titulo estilos
		Font fontTitle = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		fontTitle.setSize(18);
		fontTitle.setColor(Color.BLUE);

		// Titulo del pdf
		Paragraph paragraph = new Paragraph("Listado de peliculas", fontTitle);
		paragraph.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(paragraph);

		// Agregar Espacio
		document.add(new Phrase(""));

		// Creacion de la tabla
		PdfPTable tablaPeliculas = new PdfPTable(4);

		// Agregar Encabezados de tabla
		String header[] = { "Codigo", "Titulo", "Fecha estreno", "Precio alquiler" };

		for (String head : header) {
			Font estilo = (FontFactory.getFont(FontFactory.HELVETICA_BOLD));
			estilo.setSize(12);
			PdfPCell celda = new PdfPCell(new Phrase(head, estilo));
			celda.setHorizontalAlignment(Element.ALIGN_CENTER);
			celda.setPadding(8);
			celda.setBackgroundColor(Color.LIGHT_GRAY);

			tablaPeliculas.addCell(celda);
		}

		// Contenido de la tabla
		for (Pelicula pelicula : peliculas) {
			PdfPCell celda;

			Font estilo = (FontFactory.getFont(FontFactory.HELVETICA));
			estilo.setSize(12);

			celda = new PdfPCell(new Phrase(pelicula.getId().toString(), estilo));
			celda.setPadding(6);
			tablaPeliculas.addCell(celda);

			celda = new PdfPCell(new Phrase(pelicula.getTitulo(), estilo));
			celda.setPadding(6);
			tablaPeliculas.addCell(celda);

			celda = new PdfPCell(new Phrase(pelicula.getFechaEstreno().toString(), estilo));
			celda.setPadding(6);
			tablaPeliculas.addCell(celda);

			celda = new PdfPCell(new Phrase(String.valueOf(pelicula.getPelCosto()), estilo));
			celda.setPadding(6);
			tablaPeliculas.addCell(celda);

		}

		// Agregamos la tabla
		document.add(tablaPeliculas);

		document.close();

	}

	public void alquilerPDF(HttpServletResponse response, List<Tuple> peliculas) throws DocumentException, IOException {

		// Creacion del pdf
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());

		document.open();

		// Agregar Titulo estilos
		Font fontTitle = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		fontTitle.setSize(18);
		fontTitle.setColor(Color.BLUE);

		// Titulo del pdf
		Paragraph paragraph = new Paragraph("Reporte de peliculas alquiladas", fontTitle);
		paragraph.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(paragraph);

		// Agregar Espacio
		document.add(new Phrase(""));

		// Creacion de la tabla
		PdfPTable tablaPeliculas = new PdfPTable(4);

		// Agregar Encabezados de tabla
		String header[] = { "Codigo", "Titulo", "Total alquileres", "Monto" };

		for (String head : header) {
			Font estilo = (FontFactory.getFont(FontFactory.HELVETICA_BOLD));
			estilo.setSize(12);
			PdfPCell celda = new PdfPCell(new Phrase(head, estilo));
			celda.setHorizontalAlignment(Element.ALIGN_CENTER);
			celda.setPadding(8);
			celda.setBackgroundColor(Color.LIGHT_GRAY);

			tablaPeliculas.addCell(celda);
		}

		// Contenido de la tabla
		for (Tuple pelicula : peliculas) {
			PdfPCell celda;

			Font estilo = (FontFactory.getFont(FontFactory.HELVETICA));
			estilo.setSize(12);

			celda = new PdfPCell(new Phrase(pelicula.get("codigo").toString(), estilo));
			celda.setPadding(6);
			tablaPeliculas.addCell(celda);

			celda = new PdfPCell(new Phrase(pelicula.get("titulo").toString(), estilo));
			celda.setPadding(6);
			tablaPeliculas.addCell(celda);

			celda = new PdfPCell(new Phrase(pelicula.get("total_alquileres").toString(), estilo));
			celda.setPadding(6);
			tablaPeliculas.addCell(celda);

			celda = new PdfPCell(new Phrase(pelicula.get("monto").toString(), estilo));
			celda.setPadding(6);
			tablaPeliculas.addCell(celda);

		}

		// Agregamos la tabla
		document.add(tablaPeliculas);

		document.close();

	}

}
