package farm.models;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;

@Entity
@Table(name = "usuarios")
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String nombre;
	private String email;

	@OneToMany(mappedBy = "usuario", fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<Granja> granjas;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Granja> getGranjas() {
		return granjas;
	}

	public void setGranjas(List<Granja> granjas) {
		this.granjas = granjas;
	}

}
