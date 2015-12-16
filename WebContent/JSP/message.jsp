<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>跳转</title>
<style type="text/css">
	body{color: #000;font-size: 12px;font-family: "Microsoft YaHei"! important;background-color:#eee;}
	.jumpBlock{border: 1px solid #272822;;border-radius: 5px; width:50%;height: auto;position: relative;margin: 5% auto;background-color: #272822;}
	.jumpBlock h1{font-size:250%;color:#fff;}
	.jumpBlock .jump{font-size:140%;color:#ebeae6;margin:1% 3% 5%;}
	.jumpBlock #timeCnt{color:#d42f2f;}
	.jumpBlock .strLog{color:#5d5dfa;cursor: pointer;text-decoration: underline;}
</style>

<%
	String message = (String)request.getAttribute("message");
	String href = "";
	if(message.equals("登录成功！")) {
		href = "/WebMail/JSP/index.jsp";
	}else if (message.equals("登录失败！")) {
		href = "/WebMail/JSP/login.jsp";
	}else {
		href = "/WebMail/JSP/index.jsp";
	}
%>

<script language="JavaScript" type="text/javascript">
	var i = 2; 
	var intervalid; 
	intervalid = setInterval("fun()", 1000); 
	function fun() { 
		if (i == 0) { 
			window.location.href = href; 
			clearInterval(intervalid); 
		} 
		document.getElementById("timeCnt").innerHTML = i; 
		i--; 
	} 
</script>
</head>
<body>
<div class="jumpBlock">
	<center><h1><%=message %></h1></center>
	<%if(message.equals("登录成功！")) {%>
		<p class="jump">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		非常感谢你使用某某邮箱，本页将在&nbsp;<span id="timeCnt"></span>&nbsp;秒后跳转到邮箱主界面。
		如果不能自动跳转，请点击<a class="strLog" href=<%=href %>>跳转</a>。</p>
	<%} else if(message.equals("登录失败！")) {%>
		<p class="jump">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		请检查邮箱和密码，本页将在&nbsp;<span id="timeCnt"></span>&nbsp;秒后跳转到邮箱登录界面。
		如果不能自动跳转，请点击<a class="strLog" href=<%=href %>>跳转</a>。</p>
	<%} else if(message.equals("发送成功！") || message.equals("发送失败！")){%>
		<p class="aa">请点击<a href=	<%=href %>>跳转</a>
	<%}%>
		
</div>
</body>
</html>