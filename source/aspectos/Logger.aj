package aspectos;

public aspect Logger {
	pointcut logge():
		call(* uniandes.cupi2.impuestosCarro.mundo.*.*(..));
	
	before(): logge(){
		System.out.println("Metodo: " + thisJoinPointStaticPart.getSignature()
							+" parámetros: " + thisJoinPoint.getArgs()
							+ " objeto que invoca: " + thisJoinPoint.getTarget());
	}
	after() returning(Object r): logge(){
		System.out.println("El resultado del metodo " + thisJoinPointStaticPart.getSignature()
							+ " es " + r);
	}
	after() throwing(Throwable e): logge(){
		System.out.println("La excepcion del metodo " + thisJoinPointStaticPart.getSignature()
				+ " es " + e);	
	}
}
