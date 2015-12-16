<%@page import="javax.mail.Message"%>
<%@page import="com.lzmy.mail.StoreMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收件箱</title>
</head>
<body>
	<%
	StoreMail storeMail = new StoreMail();
	Message[] messages = storeMail.storeMessages();
	%>
	<table border="1">
		<tr>
			<th>发件人</th>
			<th>主题</th>
			<th>收件日期</th>
		</tr>
 		<%for(Message message:messages){%>
			<tr>
				<td><%=message.getFrom()[0].toString() %></td>
				<td><%=message.getSubject() %></td>
				<td><%=message.getSentDate() %></td>
			</tr>
		<%}%> 
	</table>
	<!-- <form action="/WebMail/storeMail" method="post">	
		<input type="submit" value="下载邮件">
	</form>-->
</body>
</html>