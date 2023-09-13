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
@Table(name = "actuadores")
public class Actuador {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String nombre;
	private String descripcion;
	private String tipoAutomatico;
	public String getTipoAutomatico() {
		return tipoAutomatico;
	}

	public void setTipoAutomatico(String tipoAutomatico) {
		this.tipoAutomatico = tipoAutomatico;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	private String tipo;
	private int valorLogico;
	private double valorAnalogico;

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn(name = "au_id")
	private Au au;

	// RELACION CON Au
	@OneToMany(mappedBy = "actuador", fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<Programa> programas;

	


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Au getAu() {
		return au;
	}

	public void setAu(Au au) {
		this.au = au;
	}

	public List<Programa> getProgramas() {
		return programas;
	}

	public void setProgramas(List<Programa> programas) {
		this.programas = programas;
	}


	public Actuador() {
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

	public int getValorLogico() {
		return valorLogico;
	}

	public void setValorLogico(int valorLogico) {
		this.valorLogico = valorLogico;
	}

	public double getValorAnalogico() {
		return valorAnalogico;
	}

	public void setValorAnalogico(double valorAnalogico) {
		this.valorAnalogico = valorAnalogico;
	}

}
