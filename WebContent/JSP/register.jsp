<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>
    <form action="/JavaMail/register" method="post">
        用户名：
        <input type="text" name="username"><br/>
        密码：
        <input type="password" name="password"><br/>
        邮箱：
        <input type="text" name="email"><br/>
        <input type="submit" value="注册">
    </form>
</body>
</html> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>邮箱登陆</title>
<style type="text/css">
	body{color: #000;font-size: 12px;font-family: "Microsoft YaHei"! important;background: url(/JavaMail/IMG/bg4.png);}
	.mailTitle{width:100%;}
	.titleH1{margin-top:2%;margin-left:5%;font-size: 150%;color:#fff;font-family: "Microsoft YaHei"! important;}
	.mailRegister{border: 1px solid #ebeae6;border-radius: 5px; width:40%;height: auto;position: relative;margin: 5% auto;background-color: #ebeae6;}
	.register{margin-top: 3%;margin-bottom: 5%;}
	.register h1{margin-left: 2%;color:#676d88;font-family: "Microsoft YaHei"! important;font-size:210%;}
	.registerBlock{position:relative;margin:7% auto;margin-left:20%;font-family: "Microsoft YaHei",serif;margin-right: 2%;}
	.registerForm{font-family: "Microsoft YaHei",serif;}
	.registerFormIpt{margin:1% auto 1% auto;font-size: 155%;}
	.registerFormIpt label{margin-right: 3%;}
	.registerFormIpt label font{color: red;}
	.registerFormIpt .formIpt{width:45%;height: 21px;border: 1px solid #676d88;border-radius: 2px;}
	.registerFormIpt span{color: #616161;}
	.registerFormPwd{margin:3% auto 1% auto;font-size: 155%;}
	.registerFormPwd label{margin-right: 3%;}
	.registerFormPwd label font{color: red;}
	.registerFormPwd .formPwd{width:45%;height: 21px;border: 1px solid #676d88;border-radius: 2px;}
	.verifyPwd{margin:3% auto 1% auto;font-size: 155%;}
	.verifyPwd label{margin-right: 3%;}
	.verifyPwd label font{color: red;}
	.verifyPwd .formPwdVf{width:45%;height: 21px;border: 1px solid #676d88;border-radius: 2px;}
	.beiyong{margin:3% auto 1% auto;font-size: 155%;}
	.beiyong label{margin-right: 2%;}
	.beiyong .formMail{width:45%;height: 21px;border: 1px solid #676d88;border-radius: 2px;}
	.testcode{margin:3% auto 1% auto;font-size: 120%;}
	.testcode label font{color: red;}
	.testcode .formCode{border: 1px solid #676d88;border-radius: 2px;margin-right: 1%;}
	/*
	.registerPwd .forgetPwd{font-size: 80%;text-decoration: underline;color:#616161; }
	*/
	.reminder1,.reminder2,.reminder3,.reminder4{color: #999;margin-left: 26%;}
	.registerFormBtn{margin:4%;font-family: "Microsoft YaHei",serif;}
	/*
	.FormBtn .btn-login{width:25%;background-color: #33689c;border-radius: 2px;border: 0;font-size: 100%;padding-top: 2%;padding-bottom: 2%;color: #fff;}
	*/
	.registerFormBtn .btn-reg{width:25%;background-color: #ae4141;border-radius: 2px;border: 0;font-size: 100%;padding-top: 2%;padding-bottom: 2%;color: #fff;margin-left: 24%;cursor: pointer;}
	.loginM{margin-left: 64%;margin-top: 7%;margin-right:2%;color: #766C6C;}
	.lgMail{color: #2627ff;cursor: pointer;text-decoration: underline;}
	.footer{position: relative;margin-top:8%;margin-bottom: 0;color: #ababab;}
</style>
<script type="text/javascript">
function createCode()
{ //创建验证码函数
	 code = "";
	 var codeLength =4;//验证码的长度
	 var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的
			
	 for(var i=0;i<codeLength;i++)
	 {     
	  var charIndex =Math.floor(Math.random()*36);
	  code +=selectChar[charIndex];     
	 }// 设置验证码的显示样式，并显示
	 
	 document.getElementById("discode").style.fontFamily="Microsoft YaHei";  //设置字体
	 document.getElementById("discode").style.letterSpacing="3px";  //字体间距
	 document.getElementById("discode").style.color="#ff0000";   //字体颜色
	 document.getElementById("discode").style.background="#00CED1";//背景颜色
	 document.getElementById("discode").style.border="solid 1px #2F4F4F";//边框
	 document.getElementById("discode").style.fontSize="12px"; //字体大小
	 document.getElementById("discode").style.padding="1px 5px 1px 5px";//元素填充
	
	 document.getElementById("discode").innerHTML=code;      // 显示	 
		
}

function zhuce(){
	var regName = document.getElementById("regIpt");
	var regPwd = document.getElementById("regPwd");
	var vfPwd = document.getElementById("vfPwd");
	var inputCode = document.getElementById("code").value.toUpperCase();
	var email=regName.value.replace(/^\+|\s+$/g,"").toLowerCase();
	var pwd = regPwd.value.replace(/^\+|\s+$/g,"");
	var vf = vfPwd.value.replace(/^\+|\s+$/g,"");
	var reg = /^[a-z0-9](\w|\.|-)*@([a-z0-9]+-?[a-z0-9]+\.){1,3}[a-z]{2,4}$/i;
	var codePwd = /^(?!\D+$)(?![^a-zA-Z]+$)\S{6,20}$/;
	if (email.match(reg)==null) {
		alert("请输入有效的邮箱地址！");
		regName.focus();  
		return;
	}
	else if (pwd.match(codePwd)==null) {
		alert("请输入有效的密码！");
		regPwd.focus();
		return;
	}
	else if(vf.match(pwd)==null){
		alert("请正确重复输入以上密码！");
		vrPwd.focus();
		return;
	}
	
	else if(inputCode!=code){
		alert("验证码输入错误！");
		createCode();
		return;
	}
	
	else{
		window.location.href="tiaozhuan.jsp";
	}
	return true;
}

function reg_to_log(){
	window.location.href="login.jsp";
}

</script>
</head>
<body  onload="createCode()">
<div class="mailTitle">
		<div class="titleH1">
			<h1>一个邮箱</h1>
		</div>
	</div>
	
		<div class="mailRegister">
			<div class="register">
				<h1>欢迎免费注册某某邮箱</h1>
				
				<div class="registerBlock">
					
					<form class="registerForm" method="post" name="registerForm" action="tiaozhuan.jsp">
						
						<div class="registerFormIpt">
							<label><font>*</font>邮箱名称:</label>
							<input class="formIpt" type="text" value="" maxlength="20" name="username" placeholder="abc123@cyj233.cn" id="regIpt" required>
							<!--  
							<span class="domain">
								@cyj.com
							</span>
							-->
						</div>
						<div class="reminder1">
							<a>3-20位之间：请用字母、数字、下划线、中划线或点号</a>
						</div>
						<div class="registerFormPwd">
							<label><font>*</font>登录密码:</label>
							<input class="formPwd" type="password" name="password" placeholder="请输入密码" id="regPwd" required>
						</div>
						<div class="reminder2">
							<a>6-20位字符：字母、数字、符号（区分大小写）</a>
						</div>
						<div class="verifyPwd">
							<label><font>*</font>确认密码:</label>
							<input class="formPwdVf" type="password" name="password" placeholder="请重复输入密码" id="vfPwd" required>
						</div>
						<div class="reminder3">
							<a>请再次输入登录密码</a>
						</div>
						<div class="beiyong">
							<label>备用邮箱：</label>
							<input class="formMail" type="text" name="beiMail" placeholder="请输入一个备用邮箱"
							id="secMail">
						</div>
						<div class="reminder4">
							<a>该邮箱用于找回密码</a>
						</div>
						<div class="testcode">
							<label><font>*</font>验证码：</label>
							<input class="formCode" type="text" name="formcode" placeholder="" id="code" required>
							<span id="discode"></span>
							<!--<a>看不清？</a>-->
						</div>
						<div class="registerFormBtn">
							<button id="BtnReg" class="btn-reg" onclick="zhuce()">注册</button>
						</div>
					</form>
					<p class="loginM">已有邮箱账号，请<a class="lgMail" onclick="reg_to_log()">登录</a></p>
				</div>
				
			</div>
		</div>
	<div class="footer">
		<center><p>Copyright © 2015 cyj All Rights Reserved. </p></center>
	</div>
</body>
</html>