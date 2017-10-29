package aspectos;

public aspect Logger {
	pointcut logger():
		call(void uniandes.cupi2.impuestosCarro.mundo.*(..));
	
	before(): logger(){
		System.out.println("Metodo: " + thisJoinPointStaticPart.getSignature()
							+" parámetros: " + thisJoinPoint.getArgs()
							+ " objeto que invoca: " + thisJoinPoint.getTarget());
	}
	after() returning(Object r): logger(){
		System.out.println("El resultado del metodo " + thisJoinPointStaticPart.getSignature()
							+ " es " + r);
	}
	after() throwing(Throwable e): logger(){
		System.out.println("La excepcion del metodo " + thisJoinPointStaticPart.getSignature()
				+ " es " + e);	
	}
}
