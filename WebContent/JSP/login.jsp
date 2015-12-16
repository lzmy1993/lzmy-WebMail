<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>邮箱登录</title>
<style type="text/css">
	body{color: #000;font-size: 12px;font-family: "Microsoft YaHei"! important;background: url(/WebMail/IMG/bg4.png);}
	.mailTitle{width:100%;}
	.titleH1{margin-top:2%;margin-left:5%;font-size: 150%;color:#fff;font-family: "Microsoft YaHei"! important}
	.mailLogin{border: 1px solid #ebeae6;border-radius: 5px; width:35%;height: auto;position: relative;margin: 8% auto;background-color: #ebeae6;}
	.login{margin-top: 3%;margin-bottom: 5%;}
	.login h1{margin-left: 2%;color:#676d88;font-family: "Microsoft YaHei"! important;font-size:210%;}
	.loginBlock{position:relative;margin:7% auto;margin-left:20%;font-family: "Microsoft YaHei",serif;}
	.loginForm{font-family: "Microsoft YaHei",serif;}
	.loginFormIpt{margin:1% auto 2% auto;font-size: 155%;}
	.loginFormIpt label{margin-right: 3%;}
	.loginFormIpt .formIpt{width:45%;height: 21px;border: 1px solid #676d88;border-radius: 2px;}
	.loginFormIpt span{color: #616161;}
	.loginFormPwd{margin:3% auto 2% auto;font-size: 155%;}
	.loginFormPwd label{margin-right: 3%;}
	.loginFormPwd .formPwd{width:45%;height: 21px;border: 1px solid #676d88;border-radius: 2px;}
	.loginFormPwd .forgetPwd{font-size: 80%;text-decoration: underline;color:#616161; cursor: pointer;}
	.loginFormBtn{margin:4% auto 2% 16%;font-family: "Microsoft YaHei",serif;}
	.loginFormBtn .btn-login{width:25%;background-color: #33689c;border-radius: 2px;border: 0;font-size: 100%;padding-top: 2%;padding-bottom: 2%;color: #fff;cursor: pointer;}
	.loginFormBtn .btn-reg{width:25%;background-color: #585858;border-radius: 2px;border: 0;font-size: 100%;padding-top: 2%;padding-bottom: 2%;color: #fff;margin-left: 3%;cursor: pointer;}
	.footer{position: relative;margin-top:14%;margin-bottom: 0;color: #ababab;}
</style>
<script type="text/javascript">
	function log_in(){
		var mailAds=document.getElementById("loginIpt");
		var logPwd=document.getElementById("loginPwd");
		if(mailAds.value==""){
			alert("请先输入邮箱账号！");
			mailAds.focus();
			return false;
		}
		else if(mailAds.value!=""&&logPwd.value==""){
			alert("请输入密码！");
			logPwd.focus();
			return false;
		}
		else{
			return true;
		}
		
	}
	function zc(){
		window.location.href="/WebMail/JSP/register.jsp";
	}
</script>
</head>
<body>
	<div class="mailTitle">
		<div class="titleH1">
			<h1>一个邮箱</h1>
		</div>
	</div>
	
		<div class="mailLogin">
			<div class="login">
				<h1>登录邮箱</h1>
				
				<div class="loginBlock">
					
					<form class="loginForm" method="post" name="loginForm" action="/WebMail/login">
						
						<div class="loginFormIpt">
							<label>邮箱:</label>
							<input class="formIpt" type="text" value="" maxlength="20" name="username" placeholder="aaa123@cyj2333.cn" id="loginIpt" required>
							<!-- 
							<span class="domain">
								@cyj.com
							</span>
							 -->
						</div>
						
						<div class="loginFormPwd">
							<label>密码:</label>
							<input class="formPwd" type="password" name="password" placeholder="请输入密码" id="loginPwd" required>
							<a class="forgetPwd">
								忘记密码？
							</a>
						</div>

						<div class="loginFormBtn">
							<button id="loginBtn" class="btn-login" onclick="return log_in()">登录</button>
							<input type="button" id="regBtn" class="btn-reg" onclick="zc()" value="注册">
						</div>
					</form>

				</div>
				
			</div>
		</div>
	<div class="footer">
		<center><p>Copyright © 2015 cyj All Rights Reserved. </p></center>
	</div>
</body>
</html>