package com.lzmy.mail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
            String toEmail = request.getParameter("toEmail");
            String subject = request.getParameter("subject");
            String content = request.getParameter("content");
            String[] attachments = (String[])request.getParameterValues("getFile");
            if (attachments.length > 0){
            	for (String string : attachments) {
            		System.out.printf("--------->%s",string);
            	}
            }else {
				System.out.println("无附件");
			}
            
            EmailModel email = new EmailModel();
            email.setEmailTo(toEmail);
            email.setSubject(subject);
            email.setContent(content);
            if (attachments.length > 0) {
            	email.setAttachments(attachments);
			}
            //发送邮件是一件非常耗时的事情，因此这里开辟了另一个线程来专门发送邮件
            Sendmail send = new Sendmail(email);
            //启动线程，线程启动之后就会执行run方法来发送邮件
            send.start();
            
            //注册用户
            //new UserService().registerUser(user);
            request.setAttribute("message", "发送成功！");
            request.getRequestDispatcher("/JSP/message.jsp").forward(request, response);
        }catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "发送失败！");
            request.getRequestDispatcher("/JSP/message.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
