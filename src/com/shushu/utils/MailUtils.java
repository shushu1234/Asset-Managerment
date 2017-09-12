package com.shushu.utils;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtils {
	public static void sendMail(String ueremail, String emailtitle,
			String emailcontent) {

		// 1.创建一个程序与邮件服务器对象session
		Properties properties = new Properties();

		properties.setProperty("mail.transport.protocol", "SMTP");
		properties.setProperty("mail.host", "smtp.qq.com");
		properties.setProperty("mail.smtp.auth", "true");// 指定验证为true

		MailSSLSocketFactory sf;
		try {
			sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);
		} catch (GeneralSecurityException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// 创建验证器
		Authenticator authenticator = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("fileware@qq.com",
						"uymjehzrqkaidcbb");
			}
		};

		Session session = Session.getInstance(properties, authenticator);

		// 创建message，邮件内容
		Message message = new MimeMessage(session);

		try {
			message.setFrom(new InternetAddress("fileware@qq.com"));

			message.setRecipient(RecipientType.TO,
					new InternetAddress(ueremail));

			message.setSubject(emailtitle);

			message.setContent(emailcontent, "text/html;charset=utf-8");

			Transport.send(message);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
