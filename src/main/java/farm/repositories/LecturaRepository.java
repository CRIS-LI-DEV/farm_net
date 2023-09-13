package farm.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import farm.models.*;
public interface LecturaRepository extends CrudRepository<Lectura,Long> {
	List<Lectura> findAll();
	List<Lectura> findBySensorOrderByCreatedAtDesc(Sensor sensor);


	 
    @Query(value="select * from lecturas where id =:x limit 100", nativeQuery=true)
    List<Object[]> todasLasLEcturas(@Param("x") Long x);
    
	
}
