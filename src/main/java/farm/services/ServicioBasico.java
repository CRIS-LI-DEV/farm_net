package farm.services;

import org.springframework.stereotype.Service;



import farm.models.*;
import farm.repositories.ActuadorRepository;
import farm.repositories.AuRepository;
import farm.repositories.GranjaRepository;
import farm.repositories.LecturaRepository;
import farm.repositories.ProgramaRepository;
import farm.repositories.SectorRepository;
import farm.repositories.SensorRepository;
import farm.repositories.UsuarioRepository;

import java.util.*;

@Service
public class ServicioBasico {
	private final UsuarioRepository usuarioRepository;
	private final GranjaRepository granjaRepository;
	private final SectorRepository sectorRepository;
	private final AuRepository aurepository;
	private final SensorRepository sensorRepository;
	private final LecturaRepository lecturaRepository;
	private final ActuadorRepository actuadorRepository;
	private final ProgramaRepository programaRepository;
	public ServicioBasico(ActuadorRepository actuadorRepository,UsuarioRepository usuarioRepository, GranjaRepository granjaRepository,AuRepository aurepository,SensorRepository sensorRepository,
			SectorRepository sectorRepository,LecturaRepository lecturaRepository, ProgramaRepository programaRepository) {
	this.programaRepository = programaRepository;
		this.usuarioRepository = usuarioRepository;//1
		this.granjaRepository = granjaRepository;//2
		this.sectorRepository = sectorRepository;//3
		this.aurepository = aurepository; //4
		this.sensorRepository = sensorRepository;//5
		this.lecturaRepository=lecturaRepository;//6
		this.actuadorRepository = actuadorRepository;//7
	
		
	}

	
	
	
//USUARIO 1

	public List<Usuario> mostrarTodosLosUsuarios() {
		return usuarioRepository.findAll();
	}

	public Usuario crearUsuario(Usuario usuario) {
		return usuarioRepository.save(usuario);
	}

	public Usuario buscarUsuario(Long id) {
		Optional<Usuario> usuarioOptional = usuarioRepository.findById(id);
		Usuario usuario = usuarioOptional.get();
		return usuario;
	}

	public void borrarUsuario(Usuario usuario) {
		usuarioRepository.delete(usuario);

	}

	public Usuario buscarPorEmail(String email) {
		return usuarioRepository.findByEmail(email);
	}

	
	
	//GRANJA 2
	
	
	
	public List<Granja> mostrarTodosLasGranjas() {
		return granjaRepository.findAll();
	}

	public Granja crearGranja(Granja granja) {
		return granjaRepository.save(granja);
	}

	public Granja buscarGranja(Long id) {
		Optional<Granja> granjaOptional = granjaRepository.findById(id);
		Granja granja = granjaOptional.get();
		return granja;
	}

	public void borrarGranja(Granja granja) {
		granjaRepository.delete(granja);

	}

	
	
	
	//SECTOR 3
	


public List<Sector> mostrarTodosLosSectores(){
	return sectorRepository.findAll();
}

public Sector crearSector(Sector sector) {
	return sectorRepository.save(sector);
}


public Sector buscarSector(Long id) {
	Optional<Sector> sectorOptional = sectorRepository.findById(id);
	Sector sector = sectorOptional.get();
	return sector;
}

public void borrarSector(Sector sector) {
	sectorRepository.delete(sector);
	
}




	//AU 4



	
	public List<Au> mostrarTodosLosAu() {
		return aurepository.findAll();
	}

	public Au crearAu(Au au) {
		return aurepository.save(au);
	}

	public Au buscarAu(Long id) {
		Optional<Au> auOptional = aurepository.findById(id);
		Au au = auOptional.get();
		return au;
	}

	public void borrarAu(Au au) {
		aurepository.delete(au);

	}

	
//SENSOR 5
public List<Sensor> mostrarTodosLosSensores(){
	return sensorRepository.findAll();
}

public Sensor crearSensor(Sensor sensor) {
	return sensorRepository.save(sensor);
}


public Sensor buscarSensor(Long id) {
	Optional<Sensor> sensorOptional = sensorRepository.findById(id);
	Sensor sensor = sensorOptional.get();
	return sensor;
}

public void borrarSensor(Sensor sensor) {
	sensorRepository.delete(sensor);
	
}
	

	public String sumaSensores(){
		float sensores = (float)sensorRepository.sumaSensores();
		String sensoresString = String.valueOf(sensores);
		return sensoresString;
	} 





//LECTURA 6

public Lectura crearLectura(Lectura lectura) {
	return lecturaRepository.save(lectura);
}

public List<Lectura> lecturas(Sensor sensor){
	
	return lecturaRepository.findBySensorOrderByCreatedAtDesc(sensor);
}


public List<Object[]> lecturasS(Long  id){
	
	return lecturaRepository.todasLasLEcturas(id);
}

//Actuador 7


public Actuador crearActuador(Actuador actuador) {
	System.out.println(actuador.getNombre());
	return actuadorRepository.save(actuador);
}



public Actuador buscarActuador(Long id) {
	Optional<Actuador> actuadorOptional = actuadorRepository.findById(id);
Actuador actuador = actuadorOptional.get();
	return actuador;
}


public void borrarActuador(Actuador actuador) {
	actuadorRepository.delete(actuador);
	
}
	
//programa 8


public Programa crearPrograma(Programa programa) {
return programaRepository.save(programa);
}

public List<Programa> programasDelDia(int a, int m, int d,Actuador act){
	List <Programa> programas = programaRepository.findByAnoInicialAndMesInicialAndDiaInicialAndActuadorOrderByTiempoInicialAsc(a, m, d, act);
	return programas;
	
}
	
public List<Object[]> pruebaDeServicio(Long id) {
	
	return lecturaRepository.todasLasLEcturas(id);
}

}
