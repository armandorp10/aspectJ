package aspectos;

import uniandes.cupi2.impuestosCarro.mundo.CalculadorImpuestos;

public aspect Mailer {
	
	pointcut maile():
		call(* CalculadorImpuestos.calcularPago(boolean,boolean,boolean));
	
    // Advice
    before() : maile()  {
        System.out.println("Before call " + thisJoinPointStaticPart.getSignature());
    }
	
	after() returning(Object r): maile(){
		//System.out.println("El resultado del metodo " + thisJoinPointStaticPart.getSignature()
		//					+ " es " + r);
		double value = Double.valueOf(r.toString()).doubleValue();
		System.out.println( value);
		if(value > 2000000){
			ClassMailer.sendEmail();
		}
	}
}
