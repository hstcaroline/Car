<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>汽车估价</title>
<link rel="stylesheet" type="text/css" href="/Car/css/evaluate.css">
<script type="text/javascript" src="/Car/js/calendar.js"></script>
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
	htmlobj=$.ajax({
	url:"http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_brand/",
	type:"GET",
	async : false,
	dataType : "json",
	});
	var datas = htmlobj.responseText;
	//转换为json格式
	var jsonObject=eval("("+datas+")");
	//获得所有的车型
	var brands = jsonObject.Car_brand;
	var show_brand="<option value='-1'>车牌</option>";
	for(var i=0;i<brands.length;i++)
	{
		show_brand += "<option value="+brands[i].id+">"+brands[i].brand_name+"</option>";
	}
	//一级品牌下拉
	$("#all_brand").html(show_brand);
	//联动二级车系下拉
	$("#all_brand").change(function(){
	 	//清除二级下拉列表
	 	$("#all_series").empty();
	 	$("#all_series").append($("<option/>").text("车系").attr("value","-1"));
	 	 //要请求的二级下拉JSON获取页面
	 	var url2="http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_series/?Car_series.brand_id="+$("#all_brand").val();
	 	$.getJSON(url2, function (data) {
                    //对请求返回的JSON格式进行分解加载
            var datas = data.Car_series;
            $(datas).each(function () {
                $("#all_series").append($("<option/>").text(this.series_name).attr("value",this.id));
            });
        });
	});
	//联动三级车型下拉
	$("#all_series").change(function(){
		//清除三级下拉列表
		$("#all_types").empty();
		var url3="http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_type/?Car_type.series_id="+$("#all_series").val();
		var t = "<option value='-1'>车型</option>";
		$.getJSON(url3,function(data){
			var datas = data.Car_type;
			if(datas==null)
            {
            	alert("对不起，当前无法对此类车系下的所有车型进行估价，请重新选择");
            }
			$(datas).each(function(){
				t += "<option value="+this.id+">"+this.type_name+"</option>";
			});
			$("#all_types").html(t);
		});
	});
});
</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<form id="evaluate_form" >
	<div class="assess-wrap clearfix" id="form">
		<div class="ass-tit">
			<h3>车辆估价</h3>
		</div>
		<div class="ass-car">
			<table>
				<tbody>
					<tr>
						<td class="title"><label for="title">选择车型</label>
						</td>
						<td class="msg">
							<div class="clearfix">
								<select name="brand" class="bcar" id="all_brand">
									<option value="0">车牌</option>
									<!-- 显示所有的汽车品牌 -->
								</select>
							</div>
							<div class="clearfix">
								<select name="series" class="bcar" id="all_series">
									<option value="0">车系</option>
								</select>
							</div>
							<div class="clearfix">
								<select name="car_type" class="bcar" id="all_types">
									<option value="0">车型</option>
								</select>
							</div></td>
					</tr>
					<tr>
						<td class="title"><label for="title">查询城市</label>
						</td>
						<td class="msg"><input type="text" class="i-text2 mileage"
							name="city" id="city" readonly="true" value="上海"> 
						</td>
					</tr>
					<tr>
						<td class="title"><label for="title">上牌时间</label>
						</td>
						<td class="msg">
						<input name="date" id="date" class="tcal tcalInput tcalActive" type="text" value="">
						</td>
					</tr>
					<tr>
						<td class="title"><label for="title">行驶里程</label>
						</td>
						<td class="msg"><input type="number" min="1" class="i-text2 mileage"
							name="number" id="number" id="mileage"> <em>万公里</em>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<a href="javascript:void(0);" class="car-query"
			onmouseover="mOver(this)" onmouseout="mOut(this)" onclick="check(this)">立即查询</a>
		<script>
			function mOver(obj) {
				obj.style.backgroundColor = "#07903e";
			}
			function mOut(obj) {
				obj.style.backgroundColor = "#22ac38";
			}
			function check(obj)
			{
				if($("#all_brand").val()==-1)
				{
					alert("请选择车牌");
				}
				else if($("#all_series").val()==-1)
				{
					alert("请选择车系");
				}
				else if($("#all_types").val()==-1)
				{
					alert("请选择车型");
				}
				else if($("#date").val()=="")
				{
					alert("请选择上牌时间");
				}
				
				else if($("#number").val()=="")
				{
					alert("请填写行驶里程");
				}
				else 
				{
					var url="/Car/index/price.jsp?"+$("form").serialize();
					location.href=url;
				}
				
			}
			
		</script>
	</div>
	</form>
</body>
</html>
