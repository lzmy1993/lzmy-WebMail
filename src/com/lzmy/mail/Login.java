package com.lzmy.mail;

import java.util.Properties;
import javax.mail.Session;
import javax.mail.Transport;

public class Login {
    private User user;
    
    public Login(User user) {
        this.user = user;
    }
    
    public void loginCheck() {
    	try{
            Properties prop = new Properties();
            prop.setProperty("mail.host", user.getSmtp());
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");
            Session session = Session.getInstance(prop);
            session.setDebug(true);
            Transport ts = session.getTransport();
            ts.connect(user.getSmtp(), user.getEmail(), user.getPassword());
            ts.close();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
