package com.lzmy.mail;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
* @ClassName: Sendmail
* @Description: Sendmail类继承Thread，因此Sendmail就是一个线程类，这个线程类用于给指定的用户发送Email
* @author: 孤傲苍狼
* @date: 2015-1-12 下午10:43:48
*
*/ 
public class Sendmail extends Thread {
	//发送者
	private User user = User.getInstance();
	//接收者
    private EmailModel email;
    public Sendmail(EmailModel email) {
        this.email = email;
    }
    
    /* 重写run方法的实现，在run方法中发送邮件给指定的用户
     * @see java.lang.Thread#run()
     */
    @Override
    public void run() {
        try{
            Properties prop = new Properties();
            prop.setProperty("mail.host", user.getSmtp());
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");
            Session session = Session.getInstance(prop);
            session.setDebug(true);
          
            Transport ts = session.getTransport();
            ts.connect(user.getSmtp(), user.getEmail(), user.getPassword());
            MimeMessage message = createEmail(session,email);
            ts.sendMessage(message, message.getAllRecipients());
            ts.close();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
     * 根据传入的文件路径，创建附件
     * @param fileName
     * @return	MimeBodyPart
     * @throws Exception
     */
    public MimeBodyPart createAttachment(String fileName) throws Exception {
		MimeBodyPart attachmentPart = new MimeBodyPart();
		FileDataSource fds = new FileDataSource(fileName);
		attachmentPart.setDataHandler(new DataHandler(fds));
		attachmentPart.setFileName(fds.getName());
		return attachmentPart;
	}
    
    /**
     * 正文部分
     * @param body
     * @param fileName
     * @return
     * @throws Exception
     */
    public MimeBodyPart createContent(String body) throws Exception{
    	MimeBodyPart contentBody = new MimeBodyPart();
    	MimeMultipart contentMulti = new MimeMultipart("related");
    	//文本
    	MimeBodyPart textBody = new MimeBodyPart();
    	textBody.setContent(body, "text/html;charset=utf-8");
    	contentMulti.addBodyPart(textBody);
    	//图片
//    	MimeBodyPart jpgBody = new MimeBodyPart();
//    	FileDataSource fds = new FileDataSource(fileName);
//    	jpgBody.setDataHandler(new DataHandler(fds));
//    	jpgBody.setContentID("logo_jpg");
//    	contentMulti.addBodyPart(jpgBody);
    	
    	contentBody.setContent(contentMulti);
    	return contentBody;
    }
    
    /**
    * @Method: createEmail
    * @Description: 创建要发送的邮件
    * @Anthor:apple
    *
    * @param session
    * @param user
    * @return
    * @throws Exception
    */ 
    public MimeMessage createEmail(Session session,EmailModel email) throws Exception{
        
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user.getEmail()));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email.getEmailTo()));
        message.setSubject(email.getSubject());
        
        MimeMultipart allPart = new MimeMultipart("mixed");
        //正文
        MimeBodyPart content = createContent(email.getContent());
        allPart.addBodyPart(content);
        //附件
//        if (email.getAttachments().length > 0) {
//			for (String filePath : email.getAttachments()) {
//				MimeBodyPart attachment = createAttachment(filePath);
//				allPart.addBodyPart(attachment);
//			}
//		}
		MimeBodyPart attachment = createAttachment("/Users/apple/Desktop/img.png");
		allPart.addBodyPart(attachment);
        
        message.setContent(allPart);
        message.saveChanges();
        return message;
    }
}
