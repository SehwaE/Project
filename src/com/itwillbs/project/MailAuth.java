package com.itwillbs.project;
		 
	import javax.mail.Authenticator;
	import javax.mail.PasswordAuthentication;
	 
	public class MailAuth extends Authenticator{
	    
	    PasswordAuthentication pa;
	    
	    public MailAuth() {
	        String mail_id = "maggpies33";
	        String mail_pw = "Dhdktltm1!";
	        
	        pa = new PasswordAuthentication(mail_id, mail_pw);
	    }
	    
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	}

