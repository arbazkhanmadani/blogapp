package com.tech.blog.helper;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class EmailHelper {

	/*
		USER_EMAIL = guyvagabond758@gmail.com
		USER_PASS = ktmwbrbkbbbtfokc
	*/
	final static String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	
	public static void sendMail(String mailTo) {
		
		 String from = "guyvagabond758@gmail.com"; 
	     String host = "127.0.0.1";//or IP address  
	  
	      //Get the session object  
	      Properties properties = System.getProperties();  
	      properties.setProperty("mail.smtp.host", host);
	      properties.setProperty("mail.smtp.port", "465");
	      properties.setProperty("mail.smtp.auth", "true");
	      properties.setProperty("mail.debug", "true");
	      
	      // properties.setProperty("mail.smtp.auth.pass","true");
	     // properties.setProperty("mail.smtp.port", "465");
	     // properties.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
	      //properties.put("mail.smtp.auth", "true");
	      //properties.put("mail.debug", "true");
	      //properties.put("mail.store.protocol", "pop3");
	     // properties.put("mail.transport.protocol", "smtp");
	      Session session = Session.getDefaultInstance(properties,new Authenticator(){
              protected PasswordAuthentication getPasswordAuthentication() {
                  return new PasswordAuthentication(from, "ktmwbrbkbbbtfokc");
               }});  
	  
	     //compose the message  
	      try{  
	         MimeMessage message = new MimeMessage(session);  
	         message.setFrom(new InternetAddress(from));  
	         message.addRecipient(Message.RecipientType.TO,new InternetAddress(mailTo));  
	         message.setSubject("Ping");  
	         message.setText("Hello, this is example of sending email  ");  
	  
	         // Send message  
	         Transport.send(message);  
	         System.out.println("message sent successfully....");  
	  
	      }catch (MessagingException mex) {mex.printStackTrace();}  
	  
	}  
		
}

