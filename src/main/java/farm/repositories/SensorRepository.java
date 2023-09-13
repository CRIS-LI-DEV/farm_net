package farm.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import farm.models.*;
public interface SensorRepository extends CrudRepository<Sensor,
Long> {
	List<Sensor> findAll();
	@Query(value = "SELECT sum(ultima_lectura_analogica) FROM SENSORES WHERE TIPO = 'volumen'", nativeQuery = true)
	public float sumaSensores();
}
