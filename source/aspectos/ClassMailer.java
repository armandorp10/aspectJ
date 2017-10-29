package aspectos;

import uniandes.cupi2.impuestosCarro.mundo.CalculadorImpuestos;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class ClassMailer {
	public static void main(String[] args) throws Exception {
		//System.out.println("Hola mundo");
		CalculadorImpuestos imp = new CalculadorImpuestos();
		imp.calcularPago(true,  false, false);
		//System.out.println("Hola mundo fuera");
	}
	
	public static void sendEmail(){
		final String username = "armandorp10@gmail.com";
		final String password = "Armandoramos";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("armandorp10@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("armandor-10@hotmail.com"));
			message.setSubject("Testing Subject");
			message.setText("El impuesto es mayor de $2’000 000.,"
				+ "\n\n No spam to my email, please!");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}	
	}
}
