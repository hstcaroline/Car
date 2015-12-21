<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员登录</title>
<link rel="stylesheet" type="text/css" href="/Car/css/login.css" />
<link rel="stylesheet" type="text/css" href="/Car/css/buttons.css" />
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
<script language="javascript">  //登录js
function fsubmit(obj){
	if($('#userName').val()=="")
	{
		alert("用户名不能为空");
		$("#userName").focus();
		return ;
	}
	else if($("#passWord").val()=="")
	{
		alert("密码不能为空");
		$("#passWord").focus();
		return ;
	}
	if($('#userName').val()=="hst"&&$("#passWord").val()=="123")
	{
		location.href = "/Car/manager/uploadCar.jsp";
		return ;
	}
	alert("用户名或密码错误");
	
}
function freset(obj){
	obj.reset();
}
</script>
</head>
<body>
	<div class="w">
	</div>
	<form id="formlogin" name="login" method="post" action="LoginAction_login">
		<div id="entry" class=" w1">
			<div class="extra-en">
				<a>[管理员登录]</a>
			</div>
			<div id="bgDiv" class="mc ">
				<div
					style="width: 407px; background: url(/Car/img/manager.jpg) no-repeat 0px 0px; height: 354px"
					id="entry-bg"></div>
				<div class="form ">
					<div class="item fore1">
						<span>账号</span>
						<div class="item-ifo">
							<input id="userName" class="text" name="userName" value="" />
							<div class="i-name ico"></div>
						</div>
					</div>
					<div class="item fore2">
						<span>密码</span>
						<div class="item-ifo">
							<input id="passWord" class="text" type="password"
								name="passWord" />
						</div>
					</div>

					<div>
					</div>	
					<div class="item login-btn2013">
					<a href="javascript:fsubmit(document.login);" 
					class="button button-block button-rounded button-primary button-primary">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</a>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>
