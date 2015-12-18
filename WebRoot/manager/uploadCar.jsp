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
	url:"http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_info/",
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
				+"<a title="+cars[i].car_type_id.type_name+" target='_blank' class='imgtype' href='/Car/index/detail.jsp?id="+cars[i].id+"'>" 
				+"<span class='hover-bg'></span> <img width='290' height='192'"
				+"src='/Car/img/"+cars[0].id+"/1.jpg'"+" alt="+cars[i].car_type_id.type_name+"> </a>"
				+"<p class='infoBox'>"
				+"<a title="+cars[i].car_type_id.type_name+" href='/Car/index/detail.jsp?id="+cars[i].id+"' target='_blank' class='info-title'>"+cars[i].car_type_id.type_name+"</a></p>"
				+"<p class='fc-gray'><span>"+cars[i].car_license_date+"上牌</span> <em class='shuxian'>|</em>行驶"+cars[i].car_metre/10000+"万公里</p>"
				+"<p class='priType-s'><span><i class='fc-org priType'>"+cars[i].car_price+"</i>万</span></p>"
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
					<div class="search">
								<form id="searchForm" name="searchForm" action="ShowPersonalInfo_searchByName" method="post">
									<input
										onblur="if (this.value=='') this.value=this.defaultValue"
										onkeydown="javascript:if(event.keyCode==13) OrderSearch('ip_keyword');"
										onfocus="if (this.value==this.defaultValue)this.value=''"
										id="ip_keyword" type="text" class="itxt" value="车主姓名"
										name="searchName" style="color: rgb(204, 204, 204);">
									<a href="javascript:fsubmit(document.searchForm);"
										class="button button-tiny" onclick="check1();"><s></s>查询</a>
								</form>
							</div>
					</span> <span class="ti-left"> <strong>所有新注册的车辆：</strong>
					<!-- <a href="/sh/buy" class="" data-role="tabSelect" data-cate="0">猜您喜欢</a>
					<span class="ddd">|</span> <a href="/sh/buy/" data-role="tabSelect"
					data-cate="1" class="">最新上架</a> <span class="ddd">|</span> <a
					href="/sh/buy/r_3/" data-role="tabSelect" data-cate="2" class="">降价急售</a>
					<span class="ddd">|</span> <a href="/sh/buy/l1g1r_4/"
					data-role="tabSelect" data-cate="3" class="">准新车</a> <span
					class="ddd">|</span> <a href="/sh/buy/p3/" data-role="tabSelect"
					class="on">练手车</a> <span class="ddd">|</span> <a href="/sh/buy/h2/"
					data-role="tabSelect" data-cate="5" class="">SUV</a> <span
					class="ddd">|</span> <a href="/sh/buy/r_2/" data-role="tabSelect"
					data-cate="6" class="">女车主</a> </span> -->
					
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
