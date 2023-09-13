package farm.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import farm.models.Actuador;
import farm.models.Programa;

public interface ProgramaRepository  extends CrudRepository<Programa, Long>{
	List<Programa> findAll();

	List<Programa> findByAnoInicialAndMesInicialAndDiaInicialAndActuadorOrderByTiempoInicialAsc(int a, int m , int d,Actuador act );
	}
