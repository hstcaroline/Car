<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Car/css/home.css">
<link rel="stylesheet" type="text/css" href="/Car/css/detail.css">
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
<title>二手车</title>
</head>
<body>
	<script>
		$(document)
				.ready(
						function() {
							//	获得url中的参数即id的值
							var num = location.href.indexOf("=");
							var id = location.href.substr(num + 1);
							htmlobj = $
									.ajax({
										url : "http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_info/"
												+ id,
										type : "GET",
										async : false,
										dataType : "json",
									});
							var datas = htmlobj.responseText;
							var car = eval("(" + datas + ")");
							$("#leftImg")
									.html(
											"<img src='/Car/img/"+car.id+"/1.jpg'"+" alt='"+car.car_type_id.type_name+"'>")
							$("#car_title").html(car.car_type_id.type_name);
							$("#oldPrice").html(car.car_price);
							$("#newCarPrice").html(
									car.car_type_id.new_car_price);
							$("#price_subtract")
									.html(
											formatCurrencyNum(car.car_type_id.new_car_price
													- car.car_price));
							$("#service_price").html(
									car.car_price * 10000 * 0.01
											+ "（车价x1%），送1年2万公里质保");
							$("#license_date").html(car.car_license_date);
							$("#car_metre").html(car.car_metre / 10000 + "万公里");
							$("#car_license_adr").html(car.car_license_adr);
							var txt = "";
							for ( var i = 1; i <= 20; i++) {
								txt += "<img width='580' height='400' class='js-lazy-load'"
			+" src='/Car/img/"+id+"/"+i+".jpg'"
			+" style='visibility: visible; display: inline;'> ";
							}
							$("#imgs").html(txt);
							$("#car_company").html(
									car.car_type_id.car_part_id.car_part_name);
							$("#engine_name")
									.html(
											car.car_type_id.car_part_id.engine_id.engine_name);
							$("#gearbox_id")
									.html(
											car.car_type_id.car_part_id.gearbox_id.gearbox_name);
							$("#output_volume")
									.html(
											car.car_type_id.car_part_id.engine_id.output_volume);
							$("#max_horsepower")
									.html(
											car.car_type_id.car_part_id.engine_id.max_horsepower);
							$("#max_torque")
									.html(
											car.car_type_id.car_part_id.engine_id.max_torque);
							$("#fuel_type")
									.html(
											car.car_type_id.car_part_id.engine_id.fuel_type);
							$("#fuel_tage")
									.html(
											car.car_type_id.car_part_id.engine_id.fuel_tage);
							$("#output_type")
									.html(
											car.car_type_id.car_part_id.engine_id.output_type);
							$("#driving_type")
									.html(
											car.car_type_id.car_part_id.chassis_id.driving_type);
							$("#motion_type")
									.html(
											car.car_type_id.car_part_id.chassis_id.motion_type);
							$("#order_button").click(function() {
								$("#freeTel").css('display', 'block');//隐藏，等同于show()方法
								$("#indem-box").css('display', 'none');
							});
							$("#telephone_button").click(function() {
								//alert($("#telephone").val());
								if($("#telephone").val()==""||$("#telephone").val()=="请输入手机号")
								{
									alert("请输入您的手机号码"); 
								}
								else if (!$("#telephone").val().match(/^(((13[0-9]{1})|159|153|(18[0-9]{1}))+\d{8})$/))
								{ 
									alert("手机号码格式不正确！"); 
									$("#telephone").focus(); 
									return;
								}
								//post
								 alert("alidate Success");
							});
						});
		$(document).bind('click', function(e) {
			var e = e || window.event; //浏览器兼容性 
			var elem = e.target || e.srcElement;
			while (elem) { //循环判断至跟节点，防止点击的是div子元素 
				if (elem.id && elem.id == "freeTel"||elem.id == "order_button") {
				//alert("in");
					return;
				}
				elem = elem.parentNode;
			}
			//alert("in");
			$("#freeTel").css('display', 'none'); //点击的不是div或其子元素 
			$("#indem-box").css('display', 'block');
		});
		//将数值四舍五入(保留1位小数)后格式化成金额形式  
		function formatCurrencyNum(num) {
			num = num.toString().replace(/\$|\,/g, '');
			if (isNaN(num))
				num = "0";
			sign = (num == (num = Math.abs(num)));
			num = Math.floor(num * 10 + 0.50000000001);
			cents = num % 10;
			num = Math.floor(num / 10).toString();
			for ( var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
				num = num.substring(0, num.length - (4 * i + 3)) + ','
						+ num.substring(num.length - (4 * i + 3));
			return (((sign) ? '' : '-') + num + '.' + cents);
		}
		function openLogin() {
			document.getElementById("win").style.display = "";
		}
		function mOver(obj) {
			obj.style.backgroundColor = "#07903e";
		}
		function mOut(obj) {
			obj.style.backgroundColor = "#22ac38";
		}
		function txtFocus(el) {
			if (el.defaultValue == el.value) {
				el.value = '';
				el.style.color = '#000';
			}
		}
		function txtBlur(el) {
			if (el.value == '') {
				el.value = el.defaultValue;
				el.style.color = 'rgb(191, 191, 191)';
			}
		}
	</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<div class="w">
		<div class="detailbox">
			<!-- 基本信息 -->
			<div class="laybox clearfix">
				<!-- 左边图片 -->
				<div class="det-sumleft">
					<div class="dt-sumpic">
						<ul class="det-picside">
							<li id="leftImg" style="display: block">
								<!-- 左边的图片显示 --></li>
						</ul>
					</div>
				</div>
				<!-- 左边图片结束 -->
				<div class="det-sumright">
					<div class="dt-titbox">
						<h1 class="dt-titletype" id="car_title">
							<!-- 车类型描述 -->
						</h1>
						<div class="dt-titleinfo clearfix">
							<span style="color:#999">车源号：</span><span style="color:#000">HC-1056118</span>
						</div>
					</div>
					<div class="basic-box">
						<div class="pricebox">
							<i class="ico-txt ico-mt">车主报价</i> <span
								class="fc-org pricestype"><b class="f30 numtype"
								id="oldPrice"></b>万</span> <span class="f14">新车价(含税)<font
								color="#f60" id="newCarPrice"></font>万, 省<font color="#f60"
								id="price_subtract"></font>万 </span>
						</div>
						<!--服务费-->
						<div class="car-fuwu">
							<i class="ico-txt">服 务 费</i> <span id="service_price"></span>
						</div>
					</div>
					<ul class="assort clearfix">
						<li class="one"><b id="license_date"></b>上牌时间</li>
						<li><b id="car_metre"></b>里程</li>
						<li><b id="">自动</b>变速箱</li>
						<li title="各地车管所对排放标准认定有差异，结果仅供参考，外迁请详细咨询迁入地车管所。"><b>国四</b>排放标准</li>
						<li><b id="car_license_adr"></b>上牌地</li>
					</ul>
					<p class="stipul-p">
						<a href="javascript:void(0)" class="stipul-btn" id="order_button">预约看车</a>
						<span class="f18"> <i class="fc-org yahei">看车电话：</i> <b
							class="teltype">400-733-1199</b> </span>
					</p>
					<div class="free_con_div" id="freeTel" style="display:none">
						<b class="d-icon"></b>
						<div class="tcon">
							<p>请输入您的手机号，便可与商家免费通话。您将收到010-10106088的来电，请注意接听。</p>
							<input type="text" class="ipt-box" onfocus="txtFocus(this)"
								onblur="txtBlur(this)" value="请输入手机号" id="telephone"
								style="color: rgb(191, 191, 191);"> <a
								id="telephone_button" href="javascript:void(0)" class="pop-tel">确定</a>
							<em>服务时间：8:00-22:00</em>
						</div>
					</div>
					<div class="combox indem-box" id="indem-box">
						<h3 class="indem-tt f14">TT二手车直卖网已对该车辆进行检测，并将提供售后服务及保障。</h3>
						<ul class="indem-ul">
							<li><span class="indem01"></span>
								<p class="f-type01">100%个人二手车</p>
								<p>没有中间环节，无差价</p></li>
							<li><span class="indem02"></span>
								<p class="f-type01">259项全面检测</p>
								<p>严苛检测标准，无事故</p></li>
							<li><span class="indem03"></span>
								<p class="f-type01">14天可退1年质保</p>
								<p>全程保障，无担忧</p></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="modbox" id="picture">
				<h3 class="yahei publicTit">
					<i class="deck"></i>车辆图片
				</h3>
				<div class="dt-pictype" id="imgs">
					<!-- 显示车的详细图片，一共20张 -->
				</div>
			</div>
			<div class="modbox" id="config">
				<h3 class="yahei publicTit">
					<i class="deck"></i>配置参数
				</h3>
				<div class="con-param">
					<div class="con-param-s clearfix">
						<div class="c-param-in">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="param-table">
								<tbody>
									<tr>
										<th colspan="2">基本参数</th>
									</tr>
									<tr>
										<td width="50%" class="td1">厂商</td>
										<td width="50%" class="td2" id="car_company"></td>
									</tr>
									<tr>
										<td width="50%" class="td1">级别</td>
										<td width="50%" class="td2">中型车</td>
									</tr>
									<tr>
										<td width="50%" class="td1">发动机</td>
										<td width="50%" class="td2" id="engine_name"></td>
									</tr>
									<tr>
										<td width="50%" class="td1">变速箱</td>
										<td width="50%" class="td2" id="gearbox_id"></td>
									</tr>
									<tr>
										<td width="50%" class="td1">车身结构</td>
										<td width="50%" class="td2">四门5座两厢车</td>
									</tr>
									<tr>
										<td width="50%" class="td1">长*宽*高(mm)</td>
										<td width="50%" class="td2">4825/1820/1485</td>
									</tr>
									<tr>
										<td width="50%" class="td1">轴距(mm)</td>
										<td width="50%" class="td2">2775</td>
									</tr>
									<tr>
										<td width="50%" class="td1">行李箱容积(L)</td>
										<td width="50%" class="td2">504</td>
									</tr>
									<tr>
										<td width="50%" class="td1">整备质量(kg)</td>
										<td width="50%" class="td2">1520</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="c-param-in">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="param-table">
								<tbody>
									<tr>
										<th colspan="2">发动机参数</th>
									</tr>
									<tr>
										<td width="50%" class="td1">排量(L)</td>
										<td width="50%" class="td2" id="output_volume">1.5</td>
									</tr>
									<tr>
										<td width="50%" class="td1">进气形式</td>
										<td width="50%" class="td2">自然吸气</td>
									</tr>
									<tr>
										<td width="50%" class="td1">气缸</td>
										<td width="50%" class="td2">L4</td>
									</tr>
									<tr>
										<td width="50%" class="td1">最大马力(Ps)</td>
										<td width="50%" class="td2" id="max_horsepower">184</td>
									</tr>
									<tr>
										<td width="50%" class="td1">最大扭矩(N*m)</td>
										<td width="50%" class="td2" id="max_torque">220</td>
									</tr>
									<tr>
										<td width="50%" class="td1">燃料类型</td>
										<td width="50%" class="td2" id="fuel_type">汽油</td>
									</tr>
									<tr>
										<td width="50%" class="td1">燃油标号</td>
										<td width="50%" class="td2" id="fuel_tage">97#</td>
									</tr>
									<tr>
										<td width="50%" class="td1">供油方式</td>
										<td width="50%" class="td2">多点电喷</td>
									</tr>
									<tr title="各地车管所对排放标准认定有差异，结果仅供参考，外迁请详细咨询迁入地车管所。">
										<td width="50%" class="td1">排放标准</td>
										<td width="50%" class="td2" id="output_type">国四</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="c-param-in">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="param-table">
								<tbody>
									<tr>
										<th colspan="2">底盘及制动</th>
									</tr>
									<tr>
										<td width="50%" class="td1">驱动方式</td>
										<td width="50%" class="td2" id="driving_type">前轮驱动</td>
									</tr>
									<tr>
										<td width="50%" class="td1">助力类型</td>
										<td width="50%" class="td2" id="motion_type">机械液压助力</td>
									</tr>
									<tr>
										<td width="50%" class="td1">前悬挂类型</td>
										<td width="50%" class="td2">麦弗逊式独立悬架</td>
									</tr>
									<tr>
										<td width="50%" class="td1">后悬挂类型</td>
										<td width="50%" class="td2">双连杆独立悬架</td>
									</tr>
									<tr>
										<td width="50%" class="td1">前制动类型</td>
										<td width="50%" class="td2">通风盘式</td>
									</tr>
									<tr>
										<td width="50%" class="td1">后制动类型</td>
										<td width="50%" class="td2">盘式</td>
									</tr>
									<tr>
										<td width="50%" class="td1">驻车制动类型</td>
										<td width="50%" class="td2">-</td>
									</tr>
									<tr>
										<td width="50%" class="td1">前轮胎规格</td>
										<td width="50%" class="td2">215/60 R16</td>
									</tr>
									<tr>
										<td width="50%" class="td1">后轮胎规格</td>
										<td width="50%" class="td2">215/60 R16</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="c-param-in">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="param-table">
								<tbody>
									<tr>
										<th colspan="2">安全配置</th>
									</tr>
									<tr>
										<td width="50%" class="td1">主副驾驶安全气囊</td>
										<td width="50%" class="td2">标配/标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">前后排侧气囊</td>
										<td width="50%" class="td2">无/无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">前后排头部气囊</td>
										<td width="50%" class="td2">无/无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">胎压监测</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">车内中控锁</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">儿童座椅接口</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">无钥匙启动</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">防抱死系统(ABS)</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">车身稳定控制(ESP)</td>
										<td width="50%" class="td2">无</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="c-param-in">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="param-table">
								<tbody>
									<tr>
										<th colspan="2">外部配置</th>
									</tr>
									<tr>
										<td width="50%" class="td1">电动天窗</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">全景天窗</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">氙气大灯</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">LED大灯</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">自动头灯</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">前雾灯</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">前/后电动车窗</td>
										<td width="50%" class="td2">标配/标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">后视镜电动调节</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">后视镜加热</td>
										<td width="50%" class="td2">标配</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="c-param-in">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="param-table">
								<tbody>
									<tr>
										<th colspan="2">内部配置</th>
									</tr>
									<tr>
										<td width="50%" class="td1">真皮座椅</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">座椅加热</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">座椅通风</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">多功能方向盘</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">定速巡航</td>
										<td width="50%" class="td2">标配</td>
									</tr>
									<tr>
										<td width="50%" class="td1">GPS导航</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">倒车雷达</td>
										<td width="50%" class="td2">-</td>
									</tr>
									<tr>
										<td width="50%" class="td1">倒车影像系统</td>
										<td width="50%" class="td2">无</td>
									</tr>
									<tr>
										<td width="50%" class="td1">空调控制方式</td>
										<td width="50%" class="td2">自动</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
