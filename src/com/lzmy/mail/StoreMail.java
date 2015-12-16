package com.lzmy.mail;
import java.util.Properties;  

import javax.mail.Folder;  
import javax.mail.Message;  
import javax.mail.Session;  
import javax.mail.Store;

public class StoreMail {
	
	private User user = User.getInstance();

    public Message[] storeMessages() {
        try{
            Properties prop = new Properties();
            prop.setProperty("mail.store.protocol", "imap");
            prop.setProperty("mail.imap.host",user.getImap());
            Session session = Session.getInstance(prop);
            session.setDebug(true);

            Store store = session.getStore();
            store.connect(user.getImap(), user.getEmail(), user.getPassword());
            
            Folder folder = store.getFolder("inbox");
            folder.open(Folder.READ_ONLY);
            Integer messageCount = folder.getMessageCount();
            Message[] messages = folder.getMessages(1,10);
            for	(Message message:messages) {
            	System.out.println("aaaaaaa:"+message.getSubject());//必须先调用过，否则后面读不出来
            }
            folder.close(false);  
            store.close();  
            return messages;
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
