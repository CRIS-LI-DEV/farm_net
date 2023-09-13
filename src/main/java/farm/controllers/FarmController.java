package farm.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import farm.models.Actuador;
import farm.models.Au;
import farm.models.Granja;
import farm.models.Lectura;
import farm.models.Sector;
import farm.models.Sensor;
import farm.models.Usuario;
import farm.services.ServicioBasico;

@Controller
public class FarmController {

	public final ServicioBasico sb;

	public FarmController(ServicioBasico sb) {
		this.sb = sb;
	}
//CREAR USUARIO
	
	@PostMapping("/usuario")
	public String crearUsuario(@RequestParam("nombre") String nombre,@RequestParam("email") String email) {
		Usuario usuario = new Usuario();
		usuario.setEmail(email);
		usuario.setNombre(nombre);
		sb.crearUsuario(usuario);
		return "/FarmNet/login.jsp";
	}
//BUSCAR USUARIO	k
	@GetMapping("/login")
	public String login() {
		return "/FarmNet/login.jsp";
	}


	
	
	
	
	
	@GetMapping("/")
	public String in() {
		return "/FarmNet/login.jsp";
	}
	@PostMapping("/login")
	public String loginIngreso(@RequestParam("email") String email, HttpSession session, Model model) {
		Usuario usuario = sb.buscarPorEmail(email);
		model.addAttribute("usuario", usuario);
		session.setAttribute("id_usuario", usuario.getId());
		session.setAttribute("nombre_usuario", usuario.getNombre());
		return "/FarmNet/dashboard.jsp";

	}

//GRANJAS

//MOSTRAR GRANJAS
	@GetMapping("/granjas/{id}")
	public String mostrarGranja(@PathVariable("id") Long id, HttpSession session, Model model) {
		Usuario usuario = sb.buscarUsuario((long) session.getAttribute("id_usuario"));
		model.addAttribute("usuario", usuario);

		Granja granja = sb.buscarGranja(id);
		model.addAttribute("granja", granja);
		return "/FarmNet/mostraGranja.jsp";
	}

//BORRAR GRANJAS
	@GetMapping("/granjas/{id}/borrar")
	public String borrarGranja(@PathVariable("id") Long id, HttpSession session, Model model) {
		System.out.println("ID DE GRANJA A BORRAR :  " + id);
		System.out.println("ID DE USUAIO : " + session.getAttribute("id_usuario"));

		Granja granja = sb.buscarGranja(id);
		Usuario usuario = sb.buscarUsuario((long) session.getAttribute("id_usuario"));
		model.addAttribute("usuario", usuario);
		sb.borrarGranja(granja);
		session.setAttribute("id_usuario", usuario.getId());

		return "/FarmNet/dashboard.jsp";
	}

//CREAR GRANJA
	@PostMapping("/granjas")
	public String crearGranja(@RequestParam("id_usuario") Long id_usuario,
			@RequestParam("descripcion") String descripcion,
			@RequestParam("nombreGranja") String nombre_granja,
			@RequestParam("ubicacion") String ubicacion
			
			, Model model, HttpSession session) {
		Usuario usuario = sb.buscarUsuario(id_usuario);
		Granja granja = new Granja();
		granja.setUsuario(usuario);
		granja.setDescripcion(descripcion);
		granja.setUbicacion(ubicacion);
		granja.setNombre(nombre_granja);
		sb.crearGranja(granja);
		model.addAttribute("usuario", usuario);
		return "/FarmNet/dashboard.jsp";
	}

	// Sector
	@PostMapping("/sector")
	public String creaSector(@RequestParam("sectorNombre") String nombreSector,
			@RequestParam("id_granja") Long id_granja) {
		Sector sector = new Sector();
		sector.setNombre(nombreSector);
		Granja granja = sb.buscarGranja(id_granja);
		sector.setGranja(granja);
		sb.crearSector(sector);
		return "redirect:/granjas/" + id_granja;

	}

	@GetMapping("/sectores/{id}/borrar")
	public String borrarSector(@PathVariable("id") Long id) {
		Sector sector = sb.buscarSector(id);
		sb.borrarSector(sector);
		return "redirect:/granjas/" + sector.getGranja().getId();

	}

	@GetMapping("/sectores/{id}")
	public String mostrarSector(@PathVariable("id") Long id, Model model,HttpSession session) {
		
		Usuario usuario = sb.buscarUsuario((long) session.getAttribute("id_usuario"));
		model.addAttribute("usuario", usuario);
		Sector sector = sb.buscarSector(id);
		model.addAttribute("sector", sector);
		
		return "/FarmNet/mostrarSector.jsp";
	}

//Aus

	@PostMapping("/aus")
	public String creaAus(@RequestParam(value = "nombre") String nombre,
			@RequestParam(value = "descripcion") String descripcion, @RequestParam(value = "uso") String uso,
			@RequestParam(value = "id_sector") Long id_sector) {
		Sector sector = sb.buscarSector(id_sector);
		Au au = new Au();
		au.setDescripcion(descripcion);
		au.setDescripcion(descripcion);
		au.setSector(sector);
		au.setUso(uso);
		au.setNombre(nombre);
		sb.crearAu(au);
		return "redirect:/sectores/" + id_sector;

	}

	@PostMapping("aus/borrar")
	public String borrarAu(@RequestParam(value = "id_sector") Long id_sector,
			@RequestParam(value = "id_au") Long id_au) {
		Au au = sb.buscarAu(id_au);
		sb.borrarAu(au);
		return "redirect:/sectores/" + id_sector;

	}

	@PostMapping("sensor/borrar")
	public String borrarSensor(@RequestParam(value = "id_au") Long id_au,
			@RequestParam(value = "id_sensor") Long id_sensor) {
		Sensor sensor = sb.buscarSensor(id_sensor);
		sb.borrarSensor(sensor);
		return "redirect:/au/" + id_au;

	}

	@PostMapping("actuador/borrar")
	public String borrarActuadores(@RequestParam(value = "id_au") Long id_au,
			@RequestParam(value = "id_actuador") Long id_actuador) {
		Actuador actuador = sb.buscarActuador(id_actuador);
		sb.borrarActuador(actuador);
		return "redirect:/au/" + id_au;

	}

	@GetMapping("/au/{id}")
	public String mostrarAu(@PathVariable("id") Long id, Model model, HttpSession session) {

		Au au = sb.buscarAu(id);
		Long idUsuarioLong = (Long) session.getAttribute("id");
		Usuario usuario = sb.buscarUsuario((long) session.getAttribute("id_usuario"));
		model.addAttribute("nombre_usuario", usuario.getNombre());
		model.addAttribute("au", au);
		return "/FarmNet/mostrarAu.jsp";
	}

	@PostMapping("/actuadores")
	public String crearActuador(@RequestParam("descripcion") String descripcion, @RequestParam("id_au") Long id_au,
			@RequestParam("nombre") String nombre, @RequestParam("tipo_de_actuador") String tipo_de_actuador,
			@RequestParam("tipo_de_control") String tipo_de_control, HttpSession session, Model model) {

		System.out.println(descripcion);
		System.out.println(id_au);
		System.out.println(nombre);
		System.out.println(tipo_de_actuador);
		System.out.println(tipo_de_control);
		Au au = sb.buscarAu(id_au);
		model.addAttribute("au", au);
		System.out.println("NOMBRE :  " + au.getNombre());
		Actuador actuador = new Actuador();
		actuador.setAu(au);
		actuador.setDescripcion(descripcion);
		actuador.setTipoAutomatico(tipo_de_control);
		actuador.setTipo(tipo_de_actuador);
		actuador.setNombre(nombre);
		sb.crearActuador(actuador);

		return "/FarmNet/mostrarAu.jsp";
	}

	@PostMapping("/sensores")
	public String crearSensor(@RequestParam("unidad") String unidad, @RequestParam("descripcion") String descripcion,
			@RequestParam("id_au") Long id_au, @RequestParam("nombre") String nombre,
			@RequestParam("tipo_de_sensor") String tipo_de_actuador, HttpSession session, Model model) {
		Au au = sb.buscarAu(id_au);
		Sensor sensor = new Sensor();
		sensor.setAu(au);
		sensor.setNombre(nombre);
		sensor.setUltimaLecturaAnalogica(0);
		sensor.setDescripcion(descripcion);
		sensor.setUnidad(unidad);
		sb.crearSensor(sensor);
		model.addAttribute("au", au);
		return "/FarmNet/mostrarAu.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/log")
	public String log() {

		return "/FarmNet/entrada.jsp";
	}
	
	
	@PostMapping("/log")
	public String logIngreso(@RequestParam("email") String email, HttpSession session, Model model) {
		Usuario usuario = sb.buscarPorEmail(email);
		model.addAttribute("usuario", usuario);
	String sumSen = sb.sumaSensores();
	model.addAttribute("sumaSensores",sumSen );
		session.setAttribute("id_usuario", usuario.getId());
		session.setAttribute("nombre_usuario", usuario.getNombre());
		
		
	 
		
		
		
		
		
		return "/FarmNet/dash.jsp";

		
		
		
		
		
		
	}

	
	
	@PostMapping("/sectores")
	public String mosSr(@RequestParam("id_sector") Long id_sector, Model model,HttpSession session) {
		Long idUsuario = (Long) session.getAttribute("id_usuario");
		Usuario usuario = sb.buscarUsuario(idUsuario);
		model.addAttribute("usuario", usuario);
	System.out.println(id_sector);
		Sector sector = sb.buscarSector(id_sector);
	model.addAttribute("sector", sector);
		return "/FarmNet/moS.jsp";
	}
	
	
	@PostMapping("/detalles")
	public String mostrarDetalles(@RequestParam("id_sensor") Long id_sensor, Model model,HttpSession session) {
		Long idUsuario = (Long) session.getAttribute("id_usuario");
		Usuario usuario = sb.buscarUsuario(idUsuario);
		model.addAttribute("usuario", usuario);	
		System.out.println("DETALLES");
		Sensor sensor = sb.buscarSensor(id_sensor);
		List<Lectura> lecturas = sb.lecturas(sensor);
		System.out.println(lecturas);
		
		
		model.addAttribute("lecturas", lecturas);
		model.addAttribute("sensor", sensor);
		
		return "/FarmNet/mSe.jsp";	
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
/*
 * @GetMapping("/prueba_1") public String prueba_01() { return
 * "/FarmNet/WebApi.jsp"; }
 * 
 * @GetMapping("/prueba_2") public String prueba_02() { return
 * "/FarmNet/pruebaJqueryAjax.jsp"; }
 * 
 * @GetMapping("/prueba_3") public String prueba_03() { return
 * "/FarmNet/archivo.json"; }
 * 
 * 
 */