package farm.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import farm.models.Usuario;


public interface UsuarioRepository extends CrudRepository<Usuario,Long> {
List<Usuario> findAll();

Usuario findByEmail(String email);
}
