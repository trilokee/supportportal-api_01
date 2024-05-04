package com.supportportal.service.impl;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import static com.supportportal.constant.UserImplConstant.FOUND_USER_BY_USERNAME;
import static javax.mail.Message.RecipientType.CC;
import static javax.mail.Message.RecipientType.TO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.sun.mail.smtp.SMTPTransport;
@Service
public class EmailServiceImpl  {
	private Logger LOGGER = LoggerFactory.getLogger(getClass());
    private static final String SIMPLE_MAIL_TRANSFER_PROTOCOL = "smtp";
    private static final String USERNAME = "zeronetest@outlook.com";
    private static final String PASSWORD = "@T33333";
    private static final String FROM_EMAIL = "zeronetest@outlook.com";
    private static final String CC_EMAIL = "pk8477053@gmail.com";
    private static final String EMAIL_SUBJECT = "Trilokee, LLC - New Password";
    private static final String GMAIL_SMTP_SERVER = "smtp-mail.outlook.com";
    private static final String SMTP_HOST = "mail.smtp.host";
    private static final String SMTP_AUTH = "mail.smtp.auth";
    private static final String SMTP_PORT = "mail.smtp.port";
    private static final int DEFAULT_PORT = 587;
    private static final String SMTP_STARTTLS_ENABLE = "mail.smtp.starttls.enable";
    private static final String SMTP_STARTTLS_REQUIRED = "mail.smtp.starttls.required";
    private static final String X_PRIORITY_HEADER = "X-Priority";
    private static final String X_PRIORITY_HEADER_VALUE = "2";

    // I have a service with this method to implement. But feel free to implement your own with your own parameters
    public void sendVerificationEmail(String firstName, String email, String verificationUrl) {
        try{
            Message message = createEmail(firstName, email, verificationUrl);
            SMTPTransport smtpTransport = (SMTPTransport) getEmailSession().getTransport(SIMPLE_MAIL_TRANSFER_PROTOCOL);
            smtpTransport.connect(GMAIL_SMTP_SERVER, USERNAME, PASSWORD);
            smtpTransport.sendMessage(message, message.getAllRecipients());
            smtpTransport.close();
            LOGGER.info("mail has been sent successfully!...");
            // Add a log here that the email was sent successfully
        }catch (Exception exception) {
            // Handle the exception in the best way for your application
        }
    }

    private Message createEmail(String firstName,  String email, String verificationUrl) throws MessagingException {
        Message message = new MimeMessage(getEmailSession());
        message.setFrom(new InternetAddress(FROM_EMAIL));
        message.setRecipients(TO, InternetAddress.parse(email, false));
        message.setRecipients(CC, InternetAddress.parse(CC_EMAIL, false));
        message.setHeader(X_PRIORITY_HEADER, X_PRIORITY_HEADER_VALUE);
        message.setSubject(EMAIL_SUBJECT);
        message.setText("Email message body goes here");
        message.setSentDate(new Date());
        message.saveChanges();
        return message;
    }

    // I did this in a rush, I think some of these properties we might not need
    private Session getEmailSession() {
        Properties properties = System.getProperties();
        properties.put(SMTP_HOST, GMAIL_SMTP_SERVER);
        properties.put(SMTP_AUTH, true);
        properties.put(SMTP_PORT, DEFAULT_PORT);
        properties.put("mail.smtp.ssl.trust", "*");
        properties.put(SMTP_STARTTLS_REQUIRED, true);
        properties.put(SMTP_STARTTLS_ENABLE, true);
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        return Session.getInstance(properties, null);
    }
}