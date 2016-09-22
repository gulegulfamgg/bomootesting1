package util

import grails.transaction.Transactional

import java.util.Properties
import javax.mail.Message
import javax.mail.MessagingException
import javax.mail.PasswordAuthentication
import javax.mail.Session
import javax.mail.Transport
import javax.mail.internet.InternetAddress
import javax.mail.internet.MimeMessage

import ocp.*
import auth.*

@Transactional
class MailService {

    def sendApprovalMail(int chalanId) {
    	Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("myfakeid.that@gmail.com","fakepass");
                }
            });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("myfakeid.that@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("shanky.guru@gmail.com"));
            
            def chalan = Chalan.get(chalanId)

            if(chalan.status == "ATPApproved") {
                message.setSubject("Chalan Approved");
                message.setContent("Dear Customer, Your chalan has passed the first round of approval by ATP.<br>Please click <a href='http://localhost:8080/chalan/displayChalan'> here </a> for further details.", "text/html");
            }
            else if(chalan.status == "ATPRejected")
            {
                message.setSubject("Chalan Rejected");
                message.setContent("Dear Customer, Your chalan has failed the first round of approval by ATP.<br>Please click <a href='http://localhost:8080/chalan/displayChalan'> here </a> for further details.", "text/html");
            }
            else if(chalan.status == "TPApproved")
            {
                message.setSubject("Chalan Approved");
                message.setContent("Dear Customer, Your chalan has passed the second round of approval by TP.<br>Please click <a href='http://localhost:8080/chalan/makePayment'> here </a> to make the payment.", "text/html");
            }
            else if(chalan.status == "TPRejected")
            {
                message.setSubject("Chalan Rejected");
                message.setContent("Dear Customer, Your chalan has failed the second round of approval by TP.<br>Please click <a href='http://localhost:8080/chalan/displayChalan'> here </a> for further details.", "text/html");
            } 

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
