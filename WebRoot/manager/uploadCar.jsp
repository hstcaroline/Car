<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Car/css/buttons.css">
<link rel="stylesheet" type="text/css" href="/Car/css/home.css">
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
<title>二手车上架</title>
</head>
<body>
<script>
$(document).ready(function(){
	htmlobj=$.ajax({
	url:"http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_info/?Car_info.isonline=0",
	type:"GET",
	async : false,
	dataType : "json",
	});
	var datas = htmlobj.responseText;
	var jsonObject=eval("("+datas+")");
	var cars = jsonObject.Car_info;
	var txt="";
	var length = cars.length > 12 ? 12:cars.length;
	for(var i=0;i<length;i++)
	{
		txt += "<li onmouseover='mOver(this)' onmouseout='mOut(this)'>"
				+"<div class='list-infoBox'>"
				+"<a title="+cars[i].car_type_id.type_name+"  class='imgtype' href='/Car/manager/upload.jsp?id="+cars[i].id+"'>" 
				+"<span class='hover-bg'></span> <img width='290' height='192'"
				+"src='/Car/img/wait.jpg'"+" alt="+cars[i].car_type_id.type_name+"> </a>"
				+"<p class='infoBox'>"
				+"<a title="+cars[i].car_type_id.series_id.brand_id.brand_name+" "+cars[i].car_type_id.series_id.series_name+" "+cars[i].car_type_id.type_name+" href='/Car/manager/upload.jsp?id="+cars[i].id+"' target='_blank' class='info-title'>"+cars[i].car_type_id.series_id.brand_id.brand_name+" "+cars[i].car_type_id.series_id.series_name+" "+cars[i].car_type_id.type_name+"</a></p>"
				+"<p class='fc-gray'><span>"+"**"+"上牌</span> <em class='shuxian'>|</em>行驶"+"**"+"万公里</p>"
				+"<p class='priType-s'><span><i class='fc-org priType'>"+"**"+"</i>万</span></p>"
				+"</div></li>" ;
	}
	$("#showCars").html(txt);
});
function mOver(obj) {
	obj.style.backgroundColor = 'rgba(255, 255, 255, 0.5)';
			//obj.style.z-index=1;
}
function mOut(obj) {
	obj.style.backgroundColor = 'rgba(255, 255, 255, .1)';
}
</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	
	<div class="listbody">
		<div class="w">
			<div class="title">
				<span class=" f14 fr"> 
				<!-- <a href="/sh/buy/">查看全部</a><em
					class="more">&gt;&gt;</em> --> 
				
					</span> <span class="ti-left"> <strong>所有新注册的车辆：</strong>
			</div>

			<div data-role="showList">
				<div class="list" style="display: block;">
					<ul class="list-bigimg clearfix" id="showCars">
					</ul>
				</div>
			</div>

			<div class="view-more">
			<div class="more" align="center">
				<!-- <a href="/sh/buy/">查看全部车源<span>&gt;&gt;</span> </a> -->
				<a  href="/Car/index/showAllCar.jsp" class="button button-action">查看全部<span>&gt;&gt;</span></a>
			</div>
			</div>
			</div>
			</div>
</body>
</html>
