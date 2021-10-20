package com.bank;
import java.io.File;
import java.util.Calendar;

public aspect Logger {

	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
	
	pointcut successT() : call(void com.bank.Bank.moneyMakeTransaction());
    after() : successT() {
    	String tipoTrans = "Transaccion";
    	System.out.println("Ha realizado una" +tipoTrans.toLowerCase());
    }
    
    pointcut successR() : call(void com.bank.Bank.moneyWithdrawal());
    after() : successR() {
    	String tipoTrans = "Retiro";
    	System.out.println("Ha realizado un" +tipoTrans.toLowerCase());
    }
}
