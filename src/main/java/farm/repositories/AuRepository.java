package farm.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import farm.models.*;
public interface AuRepository extends CrudRepository<Au,Long> {
	List<Au> findAll();
}
