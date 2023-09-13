package farm.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "sensores")
public class Sensor {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String nombre;
	private String tipo;
	private String descripcion;
	private double ultimaLecturaAnalogica;
	private String unidad;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn(name = "au_id")
	private Au au;

	@OneToMany(mappedBy = "sensor", fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<Lectura> lecturas;
	
	@OneToMany(mappedBy = "sensor", fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<Programa> programas;
	
	
	

	public Sensor() {
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}



	public Au getAu() {
		return au;
	}

	public void setAu(Au au) {
		this.au = au;
	}

	public List<Lectura> getLecturas() {
		return lecturas;
	}

	public void setLecturas(List<Lectura> lecturas) {
		this.lecturas = lecturas;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	public double getUltimaLecturaAnalogica() {
		return ultimaLecturaAnalogica;
	}

	public void setUltimaLecturaAnalogica(double ultimaLecturaAnalogica) {
		this.ultimaLecturaAnalogica = ultimaLecturaAnalogica;
	}

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}
	
	

}
