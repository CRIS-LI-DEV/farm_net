package farm.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "sectores")
public class Sector {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String nombre;
	private String descripcion;
	private String ubicacion;
	private String estado;

	//RELACION CON GRANJA
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn(name = "granja_id")
	private Granja granja;

	
	
	// RELACION CON Au
	@OneToMany(mappedBy = "sector", fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<Au> aus;
	

	


	
	
	public Sector() {
	}
	
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}



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

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getUbicacion() {
		return ubicacion;
	}

	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}

	public Granja getGranja() {
		return granja;
	}

	public void setGranja(Granja granja) {
		this.granja = granja;
	}

	public List<Au> getAus() {
		return aus;
	}

	public void setAus(List<Au> aus) {
		this.aus = aus;
	}



	
	
}
