package farm.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import farm.models.Granja;


public interface GranjaRepository extends CrudRepository<Granja,Long> {
	List<Granja> findAll();

}
