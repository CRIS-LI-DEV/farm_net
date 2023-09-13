package farm.models;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name="granjas")
public class Granja {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
private long id;
private String nombre;
private String descripcion;
private String ubicacion;



//RELACION CON EL USUARIO
@ManyToOne(fetch = FetchType.LAZY)
@JsonBackReference
@JoinColumn(name="usuario_id")
private Usuario usuario;





//RELACION CON SECTORES
@OneToMany(mappedBy="granja", fetch = FetchType.LAZY)
@JsonManagedReference
private List<Sector> sectores;





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






public Usuario getUsuario() {
	return usuario;
}






public void setUsuario(Usuario usuario) {
	this.usuario = usuario;
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






public List<Sector> getSectores() {
	return sectores;
}






public void setSectores(List<Sector> sectores) {
	this.sectores = sectores;
}













}
