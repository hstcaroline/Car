<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>提交车辆信息，帮你卖车</title>
<link rel="stylesheet" type="text/css" href="/Car/css/evaluate.css">
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
            	alert("对不起，当前系统无此车型，请重新选择");
            }
			$(datas).each(function(){
				t += "<option value="+this.id+">"+this.type_name+"</option>";
			});
			$("#all_types").html(t);
		});
	});
		$("#sell_button").click(function() {

			if($("#realName").val()==""||$("#realName").val()=="您的中文全名")
			{
				alert("请输入您的姓名");
				return ;
			}
			else if($("#telephone").val()==""||$("#telephone").val()=="请输入手机号")
			{
				alert("请输入您的手机号码"); 
				return;
			}
			
			else if (!$("#telephone").val().match(/^(((13[0-9]{1})|159|153|(18[0-9]{1}))+\d{8})$/))
			{ 
				alert("手机号码格式不正确！"); 
				$("#telephone").focus(); 
				return;
			}
			else if($("#all_types").val()==-1)
			{
				alert("请选择车型");
				return ;
			}
			var car_type_id = $("#all_types").val();
			//post
			var user = {
				telephone : $("#telephone").val(),
			 	type : "1",//卖家
			 	name : $("#realName").val()
			}	
			$.ajax({
				url: "http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/User_info/",
				contentType: "application/json",
				type: "POST",
				data: JSON.stringify(user),
				success: function (data) {
					if(data!=null)
					{
						$("#user_id").html(data.id);
						var car_Info = {
							car_license_adr : $("#address").val(),
							isonline : 0,
							car_type_id : {id : $("#all_types").val()},
							seller_id : {id : data.id}
						}
						$.ajax({
							url: "http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_info/",
							contentType: "application/json",
							type: "POST",
							data: JSON.stringify(car_Info),
							success: function (data) {
								if(data!=null)
								{
									alert("提交成功，您将在近日收到010-10101010的来电，请注意接听");
									location.href = "/Car/";
								}
							}
						});
					}	
				}
			});
	});
});
</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<div class="assess-wrap clearfix">
		<div class="ass-tit">
			<h3>提交车辆信息，帮你卖车</h3>
		</div>
		<div class="ass-car">
			<table>
				<tbody>
					<tr>
						<td id="user_id" style="display:none"></td>
						<td class="title"><label for="title">姓名</label>
						</td>
						<td class="msg"><input type="text" class="i-text2 mileage"
							name="realName" id="realName"  style="color: rgb(191, 191, 191)" onfocus="txtFocus(this)" onblur="txtBlur(this)" value="您的中文全名">
						</td>
					</tr>
					<tr>
						<td class="title"><label for="title">联系方式</label>
						</td>
						<td class="msg"><input type="text" class="i-text2 mileage"
							name="telephone" id="telephone" style="color: rgb(191, 191, 191)" onfocus="txtFocus(this)" onblur="txtBlur(this)" value="请输入手机号">
						</td>
					</tr>
					<tr>
						<td class="title"><label for="title">地址</label>
						</td>
						<td class="msg"><input type="text" class="i-text2 mileage"
							name="address" id="address" style="color: rgb(191, 191, 191)" onfocus="txtFocus(this)" onblur="txtBlur(this)"  value="上海"> 
						</td>
					</tr>
					<tr>
						<td class="title"><label for="title">选择车型</label>
						</td>
						<td class="msg">
							<div class="clearfix">
								<select name="brand" class="bcar" id="all_brand">
									<option value="-1">车牌</option>
									<!-- 显示所有的汽车品牌 -->
								</select>
							</div>
							<div class="clearfix">
								<select name="series" class="bcar" id="all_series">
									<option value="-1">车系</option>
								</select>
							</div>
							<div class="clearfix">
								<select name="car_type" class="bcar" id="all_types">
									<option value="-1">车型</option>
								</select>
							</div></td>
					</tr>
					<!-- <tr>
						<td class="title"><label for="title">随机码</label></td>
						<td class="msg"><input type="text" class="i-text2 mileage"
							name="phone" id="phone" style="color: rgb(191, 191, 191)" onfocus="txtFocus(this)" onblur="txtBlur(this)" value="请输入随机码">
							<input type="button" class="getNum vm" id="need_code_fs" value="获取验证码">
						</td>
					</tr> -->
				</tbody>
			</table>
		</div>
		
		<a href="javascript:void(0)" class="car-query"
			onmouseover="mOver(this)" onmouseout="mOut(this)" id="sell_button">提交信息</a>
		<script>
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
	</div>
</body>
</html>
