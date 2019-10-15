package com.best.innerjoin.member.model.vo;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messagehelper;
	
	public MailHandler(JavaMailSender mailSender) throws MessagingException{
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messagehelper = new MimeMessageHelper(message, true, "UTF-8");
	}

	public void setSubject(String subject) throws MessagingException{
		messagehelper.setSubject(subject);
	}

	public void setText(String htmlContent) throws MessagingException{
		messagehelper.setText(htmlContent, true);
	}
	
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException{
		messagehelper.setFrom(email, name);
	}

	public void setTo(String email) throws MessagingException{
		messagehelper.setTo(email);
	}
	
	public void addInling(String contentId, DataSource dataSource) throws MessagingException{
		messagehelper.addInline(contentId, dataSource);
	}
	
	public void send() {
		try {
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
