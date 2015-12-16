<%@page import="com.lzmy.mail.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<link rel="stylesheet" href="css/clndr.css">
<style type="text/css">
	body{color: #000;font-size: 12px;font-family: "Microsoft YaHei"! important;}
	.mailHead{width:100%;height: 52px;background: #393c4c;position: absolute;top: 0;left: 0;}
	
	.mailName{width:18%;position: absolute;left:3%;}
	.mailName h1{color: #fff;line-height: 0.8;}
	.mailSearch{width:64%;position: absolute;left: 35%;line-height:4;}
	.mailSearch #searchIpt{width: 35%;height:20px;background-color:#393c4c;border: 1px solid #62687a;color: #fff;border-radius: 2px;font-family: "Microsoft YaHei",serif; }
	.mailSearch #searchBtn{margin-left: 2%;border: 0;background-color: #529ad6;color: #fff;height:24px;width: 10%;font-family: "Microsoft YaHei",serif;cursor: pointer;}
	.mailUser{width: 18%;position: absolute;left: 92%;top: 5px;}
	.mailUser .help,.line,.quit{color:#aaa;}
	.mailUser .help,.quit{cursor: pointer;margin:0 1%;font-family: "Microsoft YaHei",serif;}
	.mailMain{width: 100%;position: absolute;top: 52px;left: 0;}
	.mailMain .mailLeft{width: 20%;height:570px;background-color: #494e60;}
	.mailLeft .wrMail{position:relative;left: 8%;top: 3%;}
	.mailLeft .wrMail #wMail{height: 30px;width: 36%;background-color: #f05555;border: 0;color: #fff;font-size: 14px;font-weight: bold;font-family: "Microsoft YaHei"! important;cursor: pointer;}
	.mailLeft .wrMail #rMail{height: 30px;width: 36%;margin-left: 10%;height: 30px;width: 36%;background-color: #f05555;border: 0;color: #fff;font-size: 14px;font-weight: bold;font-family: "Microsoft YaHei"! important;cursor: pointer;}
	.mailLeft .mailList{position: relative;left: 24%;top: 6%;}
	.mailLeft .mailList .mailUl{width: 70%;list-style-type: none;}
	.mailLeft .mailList .mailUl li{height: 36px;padding: 5px auto;cursor: pointer;}
	.mailLeft .mailList .mailUl li a{color: #aaa;font-size: 18px;}
	.mailLeft .mailList .mailUl li a:hover{color: #f05555;}
	.mailLeft .mailList .mailUl li a:visited{color:#f05555; }
	.mailLeft .mailList .mailUl li a:active{color:#f05555; }
	.mailLeft .addressbook{position: relative;left: 20%;top: 6%;width:60%;border-top: 1px solid #529ad6; }
	.mailLeft .addressbook .addrUl{width: 70%;list-style-type: none;position:relative;left: 6%;}
	.mailLeft .addressbook .addrUl li{height: 36px;padding: 5px auto;cursor: pointer;}
	.mailLeft .addressbook .addrUl li a{color: #aaa;font-size: 18px;}
	.mailLeft .addressbook .addrUl li a:hover{color: #f05555;}
	.mailLeft .addressbook .addrUl li a:visited{color:#f05555; }
	.mailLeft .addressbook .addrUl li a:active{color:#f05555; }
	.mailMain .mailRight{width: 80%;height:570px;background-color: #e5e9f3;position: absolute;top:0;left: 20%; }
	.mailMain .mailRight .rightHead{position: relative;top: 3%;left: 3%;padding-bottom: 1%;border-bottom: 1px solid #7d818d;}
	.mailMain .mailRight .rightHead .welcome{color: #7d818d;font-size: 20px;font-weight: 700;}
	.mailMain .mailRight .rightHead .welcome .usName{color:#f05555; }
</style>
<script type="text/javascript">
	function wmail () {
		window.location.href="/WebMail/JSP/sendMail.jsp";
	}
	function rmail (){
		window.location.href="/WebMail/JSP/storeMail.jsp";
	}
</script>
</head>
<body>
<div class="mailHead">
	<div class="mailName">
		<h1>一个邮箱</h1>
	</div>
	<div class="mailSearch">
		<form action="" method="get" id="searchForm">
			<input type="text" name="searchmail" placeholder="按照邮件名称关键字或时间搜索邮件" id="searchIpt">
			
			<button type="submit" id="searchBtn">搜索</button>
		</form>
	</div>
	<div class="mailUser">
		<a class="help">帮助</a>
		<span class="line">|</span>
		<a class="quit">退出</a>
	</div>
</div>
<div class="mailMain">
	<div class="mailLeft">
		<div class="wrMail">
			<button id="wMail" onclick="wmail()">写信</button>
			<button id="rMail" onclick="rmail()">收信</button>
		</div>
		<div class="mailList">
			<ul class="mailUl">
				<li id="receiveM"><a>收件箱</a></li>
				<li id="draftBox"><a>草稿箱</a></li>
				<li id="sendM"><a>已发送</a></li>
				<li id="delM"><a>已删除</a></li>
				<li id="wasteBox"><a>垃圾箱</a></li>
			</ul>
		</div>
		<div class="addressbook">
			<ul class="addrUl">
				<li id="tong"><a>通讯录</a></li>
				<li id="userms"><a>个人信息</a></li>
			</ul>
		</div>
		
	</div>
	<div class="mailRight">
		<div class="rightHead">
		<%
			User user = User.getInstance();
		%>
			<a class="welcome">欢迎&nbsp;&nbsp;<span class="usName"><%=user.getEmail()%></span>！</a>
		</div>
		<div class="container">
        	<div class="cal1"></div>
        </div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="js/clndr.js"></script>
<script src="demo.js"></script>
</body>
</html>