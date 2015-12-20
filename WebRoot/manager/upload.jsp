<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>汽车上架</title>
<link rel="stylesheet" type="text/css" href="/Car/css/evaluate.css">
<script type="text/javascript" src="/Car/js/calendar.js"></script>
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script>
		$(document)
				.ready(
						function() {
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
							//转换为json格式
							var car_info = eval("(" + datas + ")");
							//获得所有的车型
							//var car_info = jsonObject.Car_info;
							$("#brand")
									.val(
											car_info.car_type_id.series_id.brand_id.brand_name
													+ " "
													+ car_info.car_type_id.series_id.series_name
													+ " "
													+ car_info.car_type_id.type_name);
							$("#address").val(car_info.car_license_adr);
							$("#addFile_btn").click(function(){
								alert($("#addFile_btn").val());
							});
							

						});
	</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<form id="evaluate_form">
		<div class="assess-wrap clearfix" id="form">
			<div class="ass-tit">
				<h3>车辆上架</h3>
			</div>
			<div class="ass-car" style="height: 2000px;">
				<table>
					<tbody>
						<tr>
							<td class="title"><label for="title">车型</label>
							</td>
							<td class="msg"><input type="text" name="brand"
								class="i-text2 mileage" id="brand" readonly="true" /></td>
						</tr>
						<tr>
							<td class="title"><label for="title">上牌地点</label></td>
							<td class="msg"><input name="address" id="address"
								class="i-text2 mileage" type="text" value=""></td>
						</tr>
						<tr>
							<td class="title"><label for="title">上牌时间</label></td>
							<td class="msg"><input name="date" id="date"
								class="tcal tcalinput tcalActive" type="text" value="">
							</td>
						</tr>
						<tr>
							<td class="title"><label for="title">行驶里程</label></td>
							<td class="msg"><input type="number" min="1"
								class="i-text2 mileage" name="number" id="number" id="mileage">
								<em>万公里</em></td>
						</tr>
						<tr>
							<td class="title"><label for="title">约定价格</label></td>
							<td class="msg"><input type="number" class="i-text2 mileage"
								name="price" id="price"> <em>万元</em></td>
						</tr>
						<tr>
							<td style="position:absolute">
								<div class="box">
									<a class="btn_addPic" href="javascript:void(0);"><span><EM>+</EM>添加图片</span>
										<input type="file" class="filePrew" title="支持jpg、jpeg、gif、png格式"
										id= "addFile_btn" tabIndex="3" size=3 name="pic">
									</a>
									<!-- <div id="test" class="webuploader-container">
										<div class="webuploader-pick">
										<input type="file" name="file" multiple="multiple"
												accept="image/*" value="点击选择图片"></div>
										<div id="rt_rt_1a6vm6got1t0bbcp1c711md6o3b1"
											style="position: absolute; top: 80px; left: -110px; width: 126px; height: 38px; overflow: hidden; bottom: auto; right: auto;">
											<input type="file" name="file"
												class="webuploader-element-invisible" multiple="multiple"
												accept="image/*"> <label
												style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);">
											</label>
										</div>
									</div> -->
									<div class="parentFileBox" style="width: 180px;">
										<ul class="fileBoxUl">
											<li id="fileBox_WU_FILE_0" class="diyUploadHover">
												<div class="viewThumb">
													<img src="">
												</div>
												<div class="diyCancel"></div></li>
										</ul>
										<div class="diyButton">
											<a class="diyStart" href="javascript:void(0)">开始上传</a> <a
												class="diyCancelAll" href="javascript:void(0)">全部取消</a>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<a href="javascript:void(0);" class="car-query"
				onmouseover="mOver(this)" onmouseout="mOut(this)"
				onclick="check(this)">立即查询</a>
			<script>
				function mOver(obj) {
					obj.style.backgroundColor = "#07903e";
				}
				function mOut(obj) {
					obj.style.backgroundColor = "#22ac38";
				}
				function check(obj) {
					if ($("#all_brand").val() == -1) {
						alert("请选择车牌");
					} else if ($("#all_series").val() == -1) {
						alert("请选择车系");
					} else if ($("#all_types").val() == -1) {
						alert("请选择车型");
					} else if ($("#date").val() == "") {
						alert("请选择上牌时间");
					}

					else if ($("#number").val() == "") {
						alert("请填写行驶里程");
					} else {
						var url = "/Car/index/price.jsp?"
								+ $("form").serialize();
						location.href = url;
					}

				}
			</script>
		</div>
	</form>
</body>
</html>
