package farm.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import farm.models.Sector;

public interface SectorRepository extends CrudRepository<Sector,Long> {
	List<Sector> findAll();
}
