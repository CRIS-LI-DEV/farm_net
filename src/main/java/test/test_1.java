package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.chrono.ChronoLocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class test_1 {

	public static void main(String[] args) throws ParseException {
        Date fecha1, fecha2;

        fecha1 = new Date(82,4,1,10,30,15);

        fecha2 = new Date(112,7,7,18,25,12);

        System.out.println("Fecha 1 Local: "+fecha1.toLocaleString());

        System.out.println("Fecha 2 Local: "+fecha2.toLocaleString());

        System.out.println("Fecha 1 en GMT: "+fecha1.toGMTString());

        System.out.println("Fecha 2 en GMT: "+fecha2.toGMTString());

        System.out.println("Fecha 1: "+fecha1.toString());

        System.out.println("Fecha 2: "+fecha2.toString());

        System.out.println("¿Es la fecha 1 posterior a la fecha 2?: "+fecha1.after(fecha2));
		
		
		
	}
}
