package com.bank;
import java.io.*;
import java.util.*;
import java.util.Calendar;

public aspect Logger {

	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
	
	pointcut successT() : call(void com.bank.Bank.moneyMakeTransaction());
    after() : successT() {
    	String tipoTrans = "Transaccion";
    	try {
            FileWriter escribir = new FileWriter(file, true);
            for (int i = 0; i < 10; i++) {
                escribir.write("\r\n"); 
            }
            escribir.write("Tipo transaccion: Transaccion \n");
            escribir.write(Integer.toString(cal.get(Calendar.HOUR_OF_DAY))+":"+Integer.toString(cal.get(Calendar.MINUTE)));
            escribir.close();
        } 
        catch (Exception e) {
            System.out.println("Error al escribir");
        }
    	
    	System.out.println("Ha realizado una " +tipoTrans.toLowerCase()+"\n");
    	System.out.println(Integer.toString(cal.get(Calendar.HOUR_OF_DAY))+":"+Integer.toString(cal.get(Calendar.MINUTE)));
    	
    	
    }
    
    
    pointcut successR() : call(void com.bank.Bank.moneyWithdrawal());
    after() : successR() {
    	String tipoTrans = "Retiro";
    	try {
            FileWriter escribir = new FileWriter(file, true);
            for (int i = 0; i < 10; i++) {
                escribir.write("\r\n"); 
            }
            escribir.write("Tipo transaccion: Retiro \n");
            escribir.write(Integer.toString(cal.get(Calendar.HOUR_OF_DAY))+":"+Integer.toString(cal.get(Calendar.MINUTE)));
            escribir.close();
        } 
        catch (Exception e) {
            System.out.println("Error al escribir");
        }
    	
    	System.out.println("Ha realizado un " +tipoTrans.toLowerCase()+"\n");
    	System.out.println(Integer.toString(cal.get(Calendar.HOUR_OF_DAY))+":"+Integer.toString(cal.get(Calendar.MINUTE)));
    }
}
