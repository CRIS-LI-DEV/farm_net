package farm.models;

import java.text.SimpleDateFormat;
import java.util.Date;

public class HoraActual {

	
	public HoraActual(){}
	
	
	public int horaActual() {
		  Date objDate = new Date(); 
		   String fecha = objDate.toString();
		   int horaEntero = Integer.parseInt(fecha.substring(11,13) + fecha.substring(14,16));
		   return horaEntero;
	}
	
	public int anoActual() {
		  Date objDate = new Date(); 
		   String fecha = objDate.toString();
		  
		    
	        String strDateFormat = "yyyy-MM-dd HH:mm:ss"; // El formato de fecha está especificado  
	        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
		   
	        String fechaString  = objSDF.format(objDate).toString();
	        int anoEntero = Integer.parseInt(fechaString.substring(0,4));
	        return 1;
	}
	
	
	
	public int mesActual() {
		  Date objDate = new Date(); 
		   String fecha = objDate.toString();

	        String strDateFormat = "yyyy-MM-dd HH:mm:ss"; // El formato de fecha está especificado  
	        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
		   
	        String fechaString  = objSDF.format(objDate).toString();
	       
	        int mesEntero = Integer.parseInt(fechaString.substring(5,7));
	        return mesEntero;
	}
	
	
	
	public int diaActual() {
		  Date objDate = new Date(); 
		   String fecha = objDate.toString();
		  
		    
	        String strDateFormat = "yyyy-MM-dd HH:mm:ss"; // El formato de fecha está especificado  
	        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
		   
	        String fechaString  = objSDF.format(objDate).toString();
	       
	        int dia = Integer.parseInt(fechaString.substring(8,10));
	        return dia;
	}
}
