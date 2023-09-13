package farm.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import farm.models.*;
public interface ActuadorRepository extends CrudRepository<Actuador,Long> {
	List<Actuador> findAll();
}
