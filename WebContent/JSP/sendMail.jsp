<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>写信</title>
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
	.mailMain .mailRight .wmailContainer{position: relative;top: 3%;left: 3%;}

	.mailMain .mailRight .wmailContainer .writemailinfo{float: right;position: relative;right: 7%;}
	.mailMain .mailRight .wmailContainer .writemailinfo #rightArea{border:1px solid #aaa;border-radius: 4px;background-color: #efe;}
	.mailMain .mailRight .wmailContainer .writemailinfo #rightArea #AddrTab{margin: 5% 2%;}
	.mailMain .mailRight .wmailContainer .writemailinfo #rightArea #AddrTab #txl{height:22px;background-color: #4c9ed9;width: 100%;margin-bottom: 2%;padding-top: 1%;padding-bottom: 1%;font-size: 14px;color: #fff;}
	.mailMain .mailRight .wmailContainer .writemailinfo #rightArea #AddrTab #txl a{padding-left: 2%;}
	.mailMain .mailRight .wmailContainer .writemailinfo #rightArea #AddrTab .ctIpt{width: 70%;border: 1px solid #62687a;border-radius: 2px;height: 20px;color: #bbb;background-color: #efe;}
	.mailMain .mailRight .wmailContainer .writemailinfo #rightArea #AddrTab #scContact{margin-left: 5%;border: 0;background-color: #e54724;color: #fff;height: 20px;width: 20%;}
	.mailMain .mailRight .wmailContainer .writemailinfo #rightArea #AddrTab .groupsub{margin-top: 6%;background-color: #dfdfdf;border-radius: 4px; color: #62687a;padding-bottom: 8%;font-size: 16px;}
	.mailMain .mailRight .wmailContainer .writemailinfo #rightArea #AddrTab .groupsub .groupclose{padding-left: 5%;padding-top: 5%;}
	.mailMain .mailRight .wmailContainer #rightAreaBtnWarp{float: right;margin: 3% 3% 0 3%;}
	.mailMain .mailRight .wmailContainer #wFrm{}
	.mailMain .mailRight .wmailContainer #wFrm .toolbg{margin-bottom: 2%;border-bottom: 1px solid #aaa;padding:2% 0;width: 70%;}
	.mailMain .mailRight .wmailContainer #wFrm .toolbg button{background-color: #4c9ed9;color: #fff;border: 0;font-size: 14px;font-weight: 900;height: 24px;margin-right: 2%;cursor: pointer;}
	.mailMain .mailRight .wmailContainer #wFrm .toolbg .sendm,.ctsend,.savedraf,.cls{padding-left: 12px;padding-right: 12px;}
	.mailMain .mailRight .wmailContainer #wFrm  #addrDiv{margin-bottom: 1%;}
	.mailMain .mailRight .wmailContainer #wFrm  #addrDiv #tb1 #to_btn{text-decoration: none;color:#666;font-size: 16px; }
	.mailMain .mailRight .wmailContainer #wFrm  #addrDiv #tb1 #to_btn:hover{text-decoration:underline; }
	.mailMain .mailRight .wmailContainer #wFrm  #addrDiv #tb1 #getmaiIpt{margin-left: 5%;width: 450px;border:1px solid #aaa;height: 20px;} 
	.mailMain .mailRight .wmailContainer #wFrm #mainTit{margin-bottom: 1%;}
	.mailMain .mailRight .wmailContainer #wFrm #mainTit #tb2 #mailTit{color:#666;font-size: 16px;}
	.mailMain .mailRight .wmailContainer #wFrm #mainTit #tb2 #titleIpt{margin-left: 5%;width: 450px;border:1px solid #aaa;height: 20px;}
	.mailMain .mailRight .wmailContainer #wFrm .addAcc{margin-bottom: 1%;margin-left: 7%;}
	.mailMain .mailRight .wmailContainer #wFrm .addAcc span{color:#733aaf;font-size: 14px;cursor: pointer; margin-right:3%;}
	.mailMain .mailRight .wmailContainer #wFrm .addAcc span:hover{text-decoration: underline;}
	.mailMain .mailRight .wmailContainer #wFrm .mainBody{margin-bottom: 1%;}
	.mailMain .mailRight .wmailContainer #wFrm .mainBody .zhengtx{color:#666;font-size: 16px;}
	.mailMain .mailRight .wmailContainer #wFrm .mainBody #content{margin-left: 5%;width: 450px;height: 180px;}
	.mailMain .mailRight .wmailContainer #wFrm #compose{margin-bottom: 1%;}
	.mailMain .mailRight .wmailContainer #wFrm #otherCompose .qqshowbd input{height: 14px;width: 14px;border: 1px solid #aaa; }
	.mailMain .mailRight .wmailContainer #wFrm #otherCompose .qqshowbd label{font-size: 12px;}
</style>
<script type="text/javascript">
	function wmail () {
		window.location.href="writemail.html";
	}
	function rmail (){
		window.location.href="receivemail.html";
	}
	function sendm () {
		var toEmail = document.getElementById("getmaiIpt");
		if (toEmail.value=="") {
			alert("请输入收件人邮箱！");
			toEmail.focus();
			return false;
		}
		var files = document.getElementById("getFile");
		if (files.value==""){
			alert("无附件");
		}else {
			alert(files.value);
		}
		return false;
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
		<div class="wmailContainer">
			<form id="wFrm" action="/WebMail/sendMail" name="wFrm" method="post">
				<div class="toolbg">
					<button class="sendm" onclick="return sendm()">发送</button>
					<input type="button" class="ctsend" value="定时发送">
					<input type="button" class="savedraf" value="存草稿">
					<input type="button" class="cls" value="关闭">
				</div>
				<div class="writemailinfo">
					<div id="rightArea">
						<div id="AddrTab">
							<div id="txl"><a>通讯录</a></div>
							<div><input type="text" value="查找联系人..." class="ctIpt"><button id="scContact">搜索</button></div> 
							<div class="groupsub">
								<div class="groupclose" key="0"><a>hr</a></div>
								<div class="groupclose" key="1"><a>老师</a></div>
								<div class="groupclose" key="2"><a>job2015</a></div>
								<div class="groupclose" key="3"><a>zhengqiuhua</a></div>
								<div class="groupclose" key="4"><a>hdu</a></div>
								<div class="groupclose" key="5"><a>六一</a></div>
							</div>
						</div>
					</div>
				</div>
				<div id="rightAreaBtnWarp">
					
				</div>
				<div id="addrDiv">
					<table id="tb1">
						<tr>
							<th><div><a href="" id="to_btn">收件人</a></div></th>
							<td><div><input id="getmaiIpt" type="text" name="toEmail"></div></td>
						</tr>
					</table>
				</div>
				<div id="mainTit">
					<table id="tb2">
						<tr>
							<th><div><a id="mailTit">&nbsp;&nbsp;&nbsp;主题</a></div></th>
							<td><div><input id="titleIpt" type="text" name="subject"></div></td>
						</tr>
					</table>
				</div>
				<div class="addAcc">
					<input type="file" id="getFile" name="getFile"  multiple="true">
					<!--<span class="addFu" onclick="getFilePath()">添加附件</span>-->
					<span class="biaoq">表情</span>
					<span class="txstyle">格式</span>
				</div>
				<div class="mainBody">
					<table>
						<tr>
							<th><div><a class="zhengtx">&nbsp;&nbsp;&nbsp;正文</a></div></th>
							<td><div><textarea id="content" name="content"></textarea></div></td>
						</tr>
					</table>
				</div>
				<div id="compose">
					<div id="senderdiv">
						
						<label id="sendus">发件人：</label>
						<a id="sendiusnm"><b>王小明</b></a>
					</div>
				</div>
				<div id="otherCompose">
					<div class="qqshowbd">
						<span class="nowrap">
							<input id="savesendbox" type="checkbox">
							<label>保存到“已发送”</label>
						</span>
						<span class="nowrap">
							<input id="contenttype" type="checkbox">
							<label>纯文本</label>
						</span>
					</div>
				</div>
				<div class="toolbg">
					<button class="sendm" onclick="return sendm()">发送</button>
					<input type="button" class="ctsend" value="定时发送">
					<input type="button" class="savedraf" value="存草稿">
					<input type="button" class="cls" value="关闭">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>