<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>结果估价</title>
<link rel="stylesheet" type="text/css" href="/Car/css/evaluate.css">
</head>

<body>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<div class="assess-wrap clearfix">
    <div class="ass-new">
        <img src="/Car/img/car.jpg">
        <div class="txt">
            <h2>别克 陆尊 2006款 3.0 自动 CT舒适型7座</h2>
            <p>2007-12-21上牌，目前行驶344公里</p>
            <ul>
                <li class="br">
                    <span>零售价</span>
                    <b>7.60万</b>
                </li>
                <li>
                    <span>收购价</span>
                    <em>6.92万</em>
                </li>
            </ul>
            <h4>*此价格仅供参考</h4>
        </div>
    </div>
    <a href="/Car/index/sell.jsp" class="car-query"onmouseover="mOver(this)" onmouseout="mOut(this)">立即卖车</a>
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
