<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>汽车估价</title>
<link rel="stylesheet" type="text/css" href="/Car/css/home.css">
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
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
	for(var i=0;i<cars.length;i++)
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
	$("#totalNum").html(cars.length);
});
</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<div class="w">
		<!--排序-->
		<div class="seqBox clearfix">
			<p class="fr seqtype">
				一共<b id="totalNum">5191</b>辆
			</p>
			<h3 class="yahei publicTit">
					<i class="deck"></i>所有车辆
					</h3>
			<!-- <ul class="sequen">
				<li class="first"><a href="/sh/buy/">所有车辆</a></li>
				<li><a href="/sh/buy/i1/" title="">价格<i class="up"></i> </a></li>
				<li><a href="/sh/buy/i3/" title="">车龄<i class="up"></i> </a></li>
				<li><a href="/sh/buy/i5/" title="">里程<i class="up"></i> </a></li>
			</ul> -->
		</div>
		<!--列表-->
		<div class="list">
			<ul class="list-bigimg clearfix" id="showCars">
			</ul>
		</div>

		<!--page-->
		<div class="pageBox"
			data-widget="app/ms_v2/common/list_page.js#pagination">
			<ul class="pageLink clearfix">
				<li><a class="c linkOn"><span>1</span>
				</a>
				</li>
				<li><a href="javascript:void(0);"><span>2</span>
				</a>
				</li>
				<li><a href="javascript:void(0);"><span>3</span>
				</a>
				</li>
				<li><a href="javascript:void(0);"><span>4</span>
				</a>
				</li>
				<li><a href="javascript:void(0);"><span>5</span>
				</a>
				</li>
				<li><a href="javascript:void(0);"><span>6</span>
				</a>
				</li>
				<li><a href="javascript:void(0);"><span>7</span>
				</a>
				</li>
				<li>...</li>
				<li><a href="javascript:void(0);"><span>10</span>
				</a>
				</li>
				<li><a href="javascript:void(0);" class="next"><span>下一页</span>
				</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
