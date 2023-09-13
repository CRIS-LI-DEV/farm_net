package farm.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

	

import farm.models.Actuador;
import farm.models.Au;
import farm.models.Granja;
import farm.models.HoraActual;
import farm.models.Lectura;
import farm.models.Programa;
import farm.models.Sector;
import farm.models.Sensor;
import farm.models.Usuario;
import farm.services.ServicioBasico;

@RestController

public class FarmApi {
	public final ServicioBasico sb;

	public FarmApi(ServicioBasico sb) {
		this.sb = sb;
	}

	@RequestMapping(value = "/api/users", method = RequestMethod.POST)
	public Usuario createUser(@RequestParam(value = "nombre") String nombre,
			@RequestParam(value = "email") String email) {

		Usuario usuario	 = new Usuario();
		usuario.setEmail(email);
		usuario.setNombre(nombre);
		return sb.crearUsuario(usuario);
	}

	@RequestMapping(value = "/api/farms", method = RequestMethod.POST)
	public Granja createFarm(@RequestParam(value = "nombre") String nombre,
			@RequestParam(value = "descripcion") String descripcion,
			@RequestParam(value = "ubicacion") String ubicacion, @RequestParam(value = "id_usuario") Long id_usuario) {

		Usuario usuario = sb.buscarUsuario(id_usuario);
		Granja granja = new Granja();
		granja.setUsuario(usuario);
		granja.setNombre(nombre);
		granja.setDescripcion(descripcion);
		granja.setUbicacion(ubicacion);
		return sb.crearGranja(granja);
	}

	@RequestMapping(value = "/api/sectors", method = RequestMethod.POST)
	public Sector createSector(@RequestParam(value = "nombre") String nombre,
			@RequestParam(value = "descripcion") String descripcion,
			@RequestParam(value = "ubicacion") String ubicacion, @RequestParam(value = "id_granja") Long id_granja) {

		Granja granja = sb.buscarGranja(id_granja);

		Sector sector = new Sector();
		sector.setDescripcion(descripcion);
		sector.setGranja(granja);
		sector.setUbicacion(ubicacion);
		sector.setNombre(nombre);
		return sb.crearSector(sector);
	}

	@GetMapping("/api/users")

	public List<Usuario> usuarios() {

		List<Usuario> usuarios = sb.mostrarTodosLosUsuarios();

		return usuarios;
	}
	
	
	
	
	
	
	
	

    @RequestMapping("/api/users/{id}")
    public Usuario showUser(@PathVariable("id") Long id) {
     Usuario usuario = sb.buscarUsuario(id);
  return usuario;
    }

	@RequestMapping(value = "/api/aus", method = RequestMethod.POST)
	public Au createAus(@RequestParam(value = "nombre") String nombre,
			@RequestParam(value = "descripcion") String descripcion, 
			@RequestParam(value = "uso") String uso,
			@RequestParam(value = "id_sector") Long id_sector) {

		Sector sector = sb.buscarSector(id_sector);
		Au au = new Au();
		au.setDescripcion(descripcion);
		au.setDescripcion(descripcion);
		au.setSector(sector);
		au.setUso(uso);
		au.setNombre(nombre);
		return sb.crearAu(au);

	}

	
	
	
	@RequestMapping(value = "/api/sensores", method = RequestMethod.POST)
	public Sensor createSensor(@RequestParam(value = "nombre") String nombre,
			@RequestParam(value = "unidad") String unidad,
			@RequestParam(value = "descripcion") String descripcion, @RequestParam(value = "tipo") String tipo,
			@RequestParam(value = "id_au") Long id_au) {

		Au au = sb.buscarAu(id_au);

		Sensor sensor = new Sensor();
		sensor.setUnidad(unidad);
		sensor.setAu(au);
		sensor.setDescripcion(descripcion);
		sensor.setNombre(nombre);
		sensor.setTipo(tipo);
		return sb.crearSensor(sensor);
	}

	

	@GetMapping(value = "/api/sensores/{id}")
	public Sensor mostrarSensor(@PathVariable("id") Long id) {

	Sensor sensor = sb.buscarSensor(id);
		return sensor;
		}

	
	
	
	@RequestMapping(value = "/api/lectura", method = RequestMethod.GET)
	public Lectura createLectura(@RequestParam(value = "valor") double valor,
			@RequestParam(value = "id_sensor") Long id_sensor) {

		Sensor sensor = sb.buscarSensor(id_sensor);
sensor.setUltimaLecturaAnalogica((double) valor );
		Lectura lectura = new Lectura();
		
		lectura.setSensor(sensor);
		lectura.setValor(valor);
		sb.crearSensor(sensor);
		return sb.crearLectura(lectura);

	}

  
	

	@RequestMapping(value = "/api/lectura2", method = RequestMethod.GET)
	public Lectura createLectura2(
			@RequestParam(value = "valor1") double valor1,
			@RequestParam(value = "id_sensor1") Long id_sensor1,
			@RequestParam(value = "valor2") double valor2,
			@RequestParam(value = "id_sensor2") Long id_sensor2
			) {

		//SENSOR 1
		Sensor sensor1 = sb.buscarSensor(id_sensor1);
        sensor1.setUltimaLecturaAnalogica((double) valor1 );
		Lectura lectura1 = new Lectura();
		
		lectura1.setSensor(sensor1);
		lectura1.setValor(valor1);
		sb.crearSensor(sensor1);
		
		sb.crearLectura(lectura1);
		
		
		
		
		
		
		
		
		
		Sensor sensor2 = sb.buscarSensor(id_sensor2);
        sensor2.setUltimaLecturaAnalogica((double) valor2 );
		Lectura lectura2 = new Lectura();
		
		lectura2.setSensor(sensor2);
		lectura2.setValor(valor2);
		sb.crearSensor(sensor2);
		
		sb.crearLectura(lectura2);
		
		
		return lectura1;

	}

	

	@RequestMapping(value = "/api/actuadorsw", method = RequestMethod.POST)
public void actuadorSwitch(@RequestParam(value = "id_actuador") Long id_actuador, @RequestParam(value = "valor") int valorLogico) {
		System.out.println("LEGO");
		Actuador actuador = sb.buscarActuador(id_actuador);
		actuador.setValorLogico(valorLogico);
		sb.crearActuador(actuador);
		
	}
	
	
	
	
	@RequestMapping(value = "/api/actuador", method = RequestMethod.POST)
	public Actuador createActuador(
			@RequestParam(value = "nombre") String nombre,
			@RequestParam(value = "descripcion") String descripcion,
			@RequestParam(value = "id_au") Long id_au, @RequestParam(value = "tipo") String tipo) {

Au au = sb.buscarAu(id_au);

		Actuador actuador = new Actuador();

		actuador.setAu(au);
		actuador.setTipo(tipo);
		actuador.setDescripcion(descripcion);
		actuador.setNombre(nombre);
		actuador.setValorLogico(0);
		return sb.crearActuador(actuador);

	}
	
	
	


	   @RequestMapping("/api/programas")
	    public String ingresarPrograma(@RequestParam("fecha_inicial" ) String fecha_inicial, @RequestParam("tiempo_inicial" ) String tiempo_inicial,
	    		@RequestParam("fecha_final" ) String fecha_final, @RequestParam("tiempo_final" ) String tiempo_final, @RequestParam("id_actuador" ) Long id_actuador,
	    		@RequestParam("id_sensor" ) String id_sensor, @RequestParam("valor_activador" ) float valor_activador
	    		) throws ParseException
	    		  {
		   System.out.println("--------------------------------------------");
		   System.out.println("--------------------------------------------");
		   System.out.println("fecha inicial : " + fecha_inicial);

		   
		   System.out.println("año : " + fecha_inicial.substring(0,4));
		   System.out.println("mes : " +  fecha_inicial.substring(5,7));
		   System.out.println("dias : " +fecha_inicial.substring(8,10));
		  

		   System.out.println("--------------------------------------------");
		   System.out.println("--------------------------------------------");
		  
		   System.out.println("fecha final : " + fecha_final);
		   System.out.println("año : " + fecha_final.substring(0,4));
		   System.out.println("mes : " +  fecha_final.substring(5,7));
		   System.out.println("dias : " +fecha_final.substring(8,10));
		  

		   System.out.println("--------------------------------------------");
		   System.out.println("--------------------------------------------");
		
	   
	   
	   
	   
	   

		   System.out.println( tiempo_inicial);
		   
	   System.out.println("hora :" + tiempo_inicial.substring(0,2));
	   System.out.println("minuto :" + tiempo_inicial.substring(3,5));
	   

	   System.out.println("--------------------------------------------");
	   System.out.println("--------------------------------------------");
	
	   System.out.println( tiempo_final);
	   
	   System.out.println("hora :" + tiempo_final.substring(0,2));
	   System.out.println("minuto : " + tiempo_final.substring(3,5));
	   
	   
	   
	   int fechaInicialEntero = Integer.parseInt(fecha_inicial.substring(0,4) + fecha_inicial.substring(5,7) + fecha_inicial.substring(8,10) );
	   System.out.println(" F I : "+ fechaInicialEntero);
	   
	   int fechaFinalEntero = Integer.parseInt(fecha_final.substring(0,4) + fecha_final.substring(5,7) + fecha_final.substring(8,10) );
	   System.out.println(" F F : "+fechaFinalEntero);
	   
	   int tiempoInicialEntero = Integer.parseInt(tiempo_inicial.substring(0,2) + tiempo_inicial.substring(3,5)  );
	   System.out.println(" T I : "+tiempoInicialEntero);
	 
	   int tiempoFinalEntero = Integer.parseInt(tiempo_final.substring(0,2) + tiempo_final.substring(3,5)  );
	   System.out.println(" T F : "+tiempoFinalEntero);
	 
	   
	   
	   Programa programa = new Programa();
	   
	  programa.setFechaInicial(fechaInicialEntero);
	   
	   programa.setAnoInicial(Integer.parseInt(fecha_inicial.substring(0,4)));
	   programa.setMesInicial(Integer.parseInt(fecha_inicial.substring(5,7)));
	   programa.setDiaInicial(Integer.parseInt(fecha_inicial.substring(8,10)));
	   
	 
	   programa.setFechaFinal(tiempoFinalEntero);
	   
	   programa.setAnoFinal(Integer.parseInt(fecha_final.substring(0,4)));
	   programa.setMesFinal(Integer.parseInt(fecha_final.substring(5,7)));
	   programa.setDiaFinal(Integer.parseInt(fecha_final.substring(8,10)));
	   
	   
	   programa.setTiempoInicial(tiempoInicialEntero);
	   
	   programa.setHoraInicial(Integer.parseInt(tiempo_inicial.substring(0,2)));
	   programa.setMinutoInicial(Integer.parseInt(tiempo_inicial.substring(3,5)));
	    
	   programa.setTiempoFinal(tiempoFinalEntero);
	   
	   programa.setHoraFinal(Integer.parseInt(tiempo_final.substring(0,2)));
	   programa.setMinutoFinal(Integer.parseInt(tiempo_final.substring(3,5)));
	     
	   Actuador actuador = sb.buscarActuador(id_actuador);
	   programa.setActuador(actuador);

	   String fi = fecha_inicial + "T" + tiempo_inicial+":00.235-0700";
	   String ff = fecha_final + "T" + tiempo_final+":00.235-0700";
	   
	   System.out.println(fi);
	   System.out.println(ff);
	   
	  
	   
	   SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); 
	   Date fInicial = sdf.parse(fi);
	   Date fFinal = sdf.parse(ff);
	   
	   programa.setInicializa(fInicial);
	 programa.setFinaliza(fFinal);
	   sb.crearPrograma(programa);
	   
	   
	   
	   
	   
	   return "actuador";
	   }


	   @RequestMapping("/api/estadoActuador/{id}")
	    public List<Programa> estadoActuador(@PathVariable("id") Long id) {

		   
		   HoraActual h = new HoraActual();
	
	   
		  	Actuador act = sb.buscarActuador(id);
		  	
		  	List <Programa> programas = sb.programasDelDia(h.anoActual(),h.mesActual(), h.diaActual(),act );
		  	
		  	
		  	for(Programa p : programas){
		  	System.out.println("hora inicial : " + p.getTiempoInicial());	
		 	System.out.println("hora final : " + p.getTiempoFinal());	
			System.out.println("*********************************************************************");	
			
			char bandera = 'a';
			if(p.getTiempoInicial()<h.horaActual() && bandera=='a') {
				bandera = 'b';
				System.out.println("syso");

				if(p.getTiempoInicial()<h.horaActual()&&bandera=='b') {
					bandera = 'a';
				
				}
			}
		
		  	}
		  
	
	   return programas;
	   }


}
