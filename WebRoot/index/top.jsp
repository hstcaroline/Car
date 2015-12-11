<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/Car/css/head.css">
<title>二手车</title>
</head>
<body>
	<!-- 顶栏 -->
	<div class="top">
		<div class="w">
			<div class="logo">
				<span class="totel"><span>买车卖车电话：</span><em>400-733-1199</em>
				</span> <a href="#" class="toindex" title="TT二手车直卖网"></a>
				<div class="around-city">
					<span>周边城市：</span> <a href='/hz/'>杭州</a><a href='/su/'>苏州</a><a
						href='/wx/'>无锡</a>
				</div>
			</div>
		</div>
		<div class="nav">
			<div class="w">
				<a href="/Car/index/home.jsp" onmouseover="mOver(this)" onmouseout="mOut(this)" class="active">首页</a> 
				<a href="/Car/index/showAllCar.jsp" onmouseover="mOver(this)" onmouseout="mOut(this)">我要买车</a>
				<a href="/Car/index/sell.jsp" onmouseover="mOver(this)" onmouseout="mOut(this)">我要卖车</a>
				<a href="/Car/index/evaluate.jsp" onmouseover="mOver(this)" onmouseout="mOut(this)">汽车估价</a>
			</div>
		</div>
	</div>
	<script>
		function mOver(obj) {
			obj.style.backgroundColor = "#07903e";
		}
		function mOut(obj) {
			obj.style.backgroundColor = "#22ac38";
		}
	</script>
</body>
</html>
</html>
