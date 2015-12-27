<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Car/css/buttons.css">
<link rel="stylesheet" type="text/css" href="/Car/css/home.css">
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
<title>二手车</title>
</head>
<body>
<script>
$(document).ready(function(){
	htmlobj=$.ajax({
	url:"http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_info/?Car_info.isonline=1",
	type:"GET",
	async : false,
	dataType : "json",
	});
	var datas = htmlobj.responseText;
	var jsonObject=eval("("+datas+")");
	var cars = jsonObject.Car_info;
	var txt="";
	//var length = cars.length > 12 ? 12:cars.length;
	var length = cars.length;
	for(var i=0;i<length&&cars[i].isonline!=0;i++)
	{
		txt += "<li onmouseover='mOver(this)' onmouseout='mOut(this)'>"
				+"<div class='list-infoBox'>"
				+"<a title="+cars[i].car_type_id.series_id.brand_id.brand_name+" "+cars[i].car_type_id.series_id.series_name+" "+cars[i].car_type_id.type_name+" target='_blank' class='imgtype' href='/Car/index/detail.jsp?id="+cars[i].id+"'>" 
				+"<span class='hover-bg'></span> <img width='290' height='192'"
				+"src='/Car/img/"+cars[i].id+"/1.jpg'"+" alt="+cars[i].car_type_id.type_name+"> </a>"
				+"<p class='infoBox'>"
				+"<a title="+cars[i].car_type_id.series_id.brand_id.brand_name+" "+cars[i].car_type_id.series_id.series_name+" "+cars[i].car_type_id.type_name+" href='/Car/index/detail.jsp?id="+cars[i].id+"' target='_blank' class='info-title'>"+cars[i].car_type_id.series_id.brand_id.brand_name+" "+cars[i].car_type_id.series_id.series_name+" "+cars[i].car_type_id.type_name+"</a></p>"
				+"<p class='fc-gray'><span>"+cars[i].car_license_date+"上牌</span> <em class='shuxian'>|</em>行驶"+cars[i].car_metre+"万公里</p>"
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
	<!-- header end-->
	<div class="select-area">
		<div class="top-img">
			<!--首页轮播-->
			<div style="height:388px;overflow:hidden;width:100%" class="index-0"
				data-interval="5000">
				<div class="banimgBox1" data-role="item"
					style="display: block; 
					background: url('/Car/img/2.jpg') 100% 0% no-repeat rgb(221, 242, 227);background-size:cover; ">

					<div class="w por">
						<div class="poa top-title">
							<h1>更好的二手车，更好的购车体验</h1>
							<div class="top-info">
								259项严苛检测 , 无重大事故&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;花生陪同看车 ,
								1年放心质保 <a target="_blank" href="javascript:void(0);"
									onmouseover="mOver(this)" onmouseout="mOut(this)">了解详情</a>
							</div>
						</div>
					</div>
				</div>
				<div class="banimgBox2" data-role="item" style="display: none;">

				</div>
				<!-- pagebox-->
				<div class="pageBox-index clearfix">
					<div class="page">
						<div class="pagePosition clearfix">
							<div class="point active" data-role="point" data-slide-to="0"></div>
							<div class="point" data-role="point" data-slide-to="1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="c-info">
		<div class="w">
			<ul>
				<li class="icon01"><span>100%个人二手车</span>
				</li>
				<li class="icon02"><span>259项全面检测</span>
				</li>
				<li class="icon03"><span>评估师陪同看车</span>
				</li>
				<li class="icon04"><span>14天可退1年质保</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="listbody">
		<div class="w">
			<div class="title">
				<span class=" f14 fr"> <a href="/Car/index/showAllCar.jsp">查看全部</a><em
					class="more">&gt;&gt;</em> </span> <span class="ti-left"> <strong>已为您找到全城靠谱好车</strong>
					 </span>
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
				<a  href="/Car/index/showAllCar.jsp" class="button button-action">查看全部车源<span>&gt;&gt;</span></a>
			</div>
			</div>
			</div>
			</div>
</body>
</html>
