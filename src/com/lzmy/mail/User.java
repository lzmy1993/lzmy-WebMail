package com.lzmy.mail;
/**
 * 饿汉式单例类
 * @author apple
 *
 */
public class User {
	private User() {}
	private static final User user = new User();
	
    private String username;
    private String password;
    private String email;
    private String smtp = "smtp.qq.com"; 
    private String pop = "pop.qq.com";
    private String imap = "imap.qq.com";
    
    public static User getInstance() {
    	return user;
    }
    
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
	public String getSmtp() {
		return smtp;
	}
	
	public void setSmtp(String smtp) {
		this.smtp = smtp;
	}
	
	public String getPop() {
		return pop;
	}
	
	public void setPop(String pop) {
		this.pop = pop;
	}

	public String getImap() {
		return imap;
	}

	public void setImap(String imap) {
		this.imap = imap;
	}
}