package farm.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "programas")
public class Programa {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private Date inicializa;
	//Hora en enteros
	
	private int tiempoInicial;
	private int horaInicial;
	private int minutoInicial;
	private int segundoInicial;
	
	private int fechaInicial;
	private int anoInicial;
	private int mesInicial;
	private int diaInicial;
	
	
	
	private Date finaliza;

	private int tiempoFinal;
	private int horaFinal;
	private int minutoFinal;
	private int segundoFinal;
	
	private int fechaFinal;
	private int anoFinal;
	private int mesFinal;
	private int diaFinal;
	private char estado;	
	private int valor_activador;
	
	
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn(name = "sensor_id")
	private Sensor sensor;
	
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn(name = "actuador_id")
	private Actuador actuador;
	
	public Programa() {}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getInicializa() {
		return inicializa;
	}

	public void setInicializa(Date inicializa) {
		this.inicializa = inicializa;
	}

	public Date getFinaliza() {
		return finaliza;
	}

	public void setFinaliza(Date finaliza) {
		this.finaliza = finaliza;
	}

	public Actuador getActuador() {
		return actuador;
	}

	public void setActuador(Actuador actuador) {
		this.actuador = actuador;
	}

	public int getTiempoInicial() {
		return tiempoInicial;
	}

	public void setTiempoInicial(int tiempoInicial) {
		this.tiempoInicial = tiempoInicial;
	}

	public int getHoraInicial() {
		return horaInicial;
	}

	public void setHoraInicial(int horaInicial) {
		this.horaInicial = horaInicial;
	}

	public int getMinutoInicial() {
		return minutoInicial;
	}

	public void setMinutoInicial(int minutoInicial) {
		this.minutoInicial = minutoInicial;
	}

	public int getSegundoInicial() {
		return segundoInicial;
	}

	public void setSegundoInicial(int segundoInicial) {
		this.segundoInicial = segundoInicial;
	}

	public int getFechaInicial() {
		return fechaInicial;
	}

	public void setFechaInicial(int fechaInicial) {
		this.fechaInicial = fechaInicial;
	}

	public int getAnoInicial() {
		return anoInicial;
	}

	public void setAnoInicial(int anoInicial) {
		this.anoInicial = anoInicial;
	}

	public int getMesInicial() {
		return mesInicial;
	}

	public void setMesInicial(int mesInicial) {
		this.mesInicial = mesInicial;
	}

	public int getDiaInicial() {
		return diaInicial;
	}

	public void setDiaInicial(int diaInicial) {
		this.diaInicial = diaInicial;
	}

	public int getTiempoFinal() {
		return tiempoFinal;
	}

	public void setTiempoFinal(int tiempoFinal) {
		this.tiempoFinal = tiempoFinal;
	}

	public int getHoraFinal() {
		return horaFinal;
	}

	public void setHoraFinal(int horaFinal) {
		this.horaFinal = horaFinal;
	}

	public int getMinutoFinal() {
		return minutoFinal;
	}

	public void setMinutoFinal(int minutoFinal) {
		this.minutoFinal = minutoFinal;
	}

	public int getSegundoFinal() {
		return segundoFinal;
	}

	public void setSegundoFinal(int segundoFinal) {
		this.segundoFinal = segundoFinal;
	}

	public int getFechaFinal() {
		return fechaFinal;
	}

	public void setFechaFinal(int fechaFinal) {
		this.fechaFinal = fechaFinal;
	}

	public int getAnoFinal() {
		return anoFinal;
	}

	public void setAnoFinal(int anoFinal) {
		this.anoFinal = anoFinal;
	}

	public int getMesFinal() {
		return mesFinal;
	}

	public void setMesFinal(int mesFinal) {
		this.mesFinal = mesFinal;
	}

	public int getDiaFinal() {
		return diaFinal;
	}

	public void setDiaFinal(int diaFinal) {
		this.diaFinal = diaFinal;
	} 


}
