<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>结果估价</title>
<link rel="stylesheet" type="text/css" href="/Car/css/evaluate.css">
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
	var car_type = getUrlParam('car_type');
	var url = "http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_type/"+car_type;
	$.getJSON(url,function(data){
		var car_name = data.series_id.brand_id.brand_name+" "+data.series_id.series_name+" "+data.type_name;
		$("#car_name").html(car_name);
		
	});
	$("#dateAndnumber").html(getUrlParam('date')+"上牌，目前行驶"+getUrlParam('number')+"万公里");
	evaluate();
	
});
  //获取url中的参数
function getUrlParam(name) {
  	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
  	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
  	if (r != null) 
  		return unescape(r[2]);
    return null; //返回参数值
}
function evaluate()
{
	/* var date = new Date(getUrlParam("date").replace(/-/g,"/"));  
	var mydate = new Date();
	mydate.getDate();
	alert(mydate.getTime());
	var m = (mydate.getTime()-date.getTime())/(1000*60*60);  
	alert(m); */
	//return str;
}
</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<div class="assess-wrap clearfix">
    <div class="ass-new">
        <img src="/Car/img/car.jpg">
        <div class="txt">
            <h2 id="car_name"></h2>
            <p id="dateAndnumber"></p>
            <ul>
                <li class="br">
                    <span>零售价</span>
                    <b id="price">7.60万</b>
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
