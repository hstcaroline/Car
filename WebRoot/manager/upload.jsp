<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>汽车上架</title>
<link rel="stylesheet" type="text/css" href="/Car/css/evaluate.css">
<!-- <link rel="stylesheet" type="text/css" href="/Car/css/buttons.css"> -->
<script type="text/javascript" src="/Car/js/calendar.js"></script>
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script>
	var images = new Array();
		$(document)
				.ready(
						function() {
							var num = location.href.indexOf("=");
							var id = location.href.substr(num + 1);
							var done = false;
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
							var txt = "";
							$("#addFile_btn").change(function() {
								//通过 this.files 取到 FileList 
								viewFile(this.files);
								$("#clear").css('background-color','#FF4351');
								$("#submit").css('background-color','#15ca6a');
							});
							$("#clear").click(function(){
								$("#imgs").empty();
								$("#clear").css('background-color','#B4BEC5');
								images.length = 0;
							});
							$("#submit").click(function(){
								if(images.length==0)
								{
									alert("请先选择图片(只能是jpg格式)");
									return ;
								}
								$.ajax({
								        url : '/Car/servlet/upload',
								        type : 'POST',
								        async : false,
								        data : {image : images.toString(),id : id},
								        dataType:'json',
								        success: function(data){
									        if(data.success){
									      	  alert('上传成功');
									      	  done = true;
									        }
									        else{
									       	 alert('上传失败');
									        }
								        },
								        error:function(xhr, type, exception) {
								        	alert("网络错误");
								        }
								});
							});
							$("#uploadbtn").click(function(){
							 	if ($("#address").val() == "") {
									alert("请填写上牌地点");
									$("#address").focus();
									return ;
								}
								if ($("#date").val() == "") {
									alert("请选择上牌时间");
									$("#date").focus();
									return ;
								}
								if ($("#number").val() == "") {
									alert("请填写行驶里程");
									$("#number").focus();
									return ;
								}
								if($("#price").val()==""){
									alert("请填写约定好的价格");
									$("#price").focus();
									return ;
								}
								if(images.length==0)
								{
									alert("请先选择图片(只能是jpg格式)");
									return ;
								}
								if(done==false)
								{
									alert("请先上传图片");
									return ;
								}
								else {
									var info = {
										car_license_adr : $("#address").val(),
									 	car_license_date : $("#date").val(),
									 	car_metre : parseFloat($("#number").val()),
									 	car_price : parseFloat($("#price").val()),
									 	is_order : 0,
									 	isonline : 1,
									  	car_type_id : {id : car_info.car_type_id.id},
									 	seller_id : {id : car_info.seller_id.id} 
									}
								 	  $.ajax({
										url: "http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_info/"+id,
										contentType: "application/json",
										type: "PUT",
										data: JSON.stringify(info),
										success: function (data) {
											if(data!=null)
												alert("车辆上线成功");
											 location.reload();
										}
									})   
								}
							}); 
						});
		function viewFile(files) {
			var txt = "";
			//通过file.size可以取得图片大小
			for ( var i = 0; i < files.length; i++) {
				var reader = new FileReader();
				reader.readAsDataURL(files[i]);
			
				reader.onload = function(evt) {
				images.push(evt.target.result);
				//alert(evt.target.result);
					txt = "<img width='580' height='400' class='js-lazy-load'"
				+" src="+ evt.target.result
				+" style='visibility: visible; display: inline;'> ";
					$("#imgs").append(txt);
				}
			}
		}
		/**
 * 将以base64的图片url数据转换为Blob
 * @param urlData
 *            用url方式表示的base64图片数据
 */
function convertBase64UrlToBlob(urlData){
    
    var bytes=window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte
    
    //处理异常,将ascii码小于0的转换为大于0
    var ab = new ArrayBuffer(bytes.length);
    var ia = new Uint8Array(ab);
    for (var i = 0; i < bytes.length; i++) {
        ia[i] = bytes.charCodeAt(i);
    }

    return new Blob( [ab] , {type : 'image/png'});
}
	</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<div class="w">
		<form id="evaluate_form">
			<div class="assess-wrap clearfix" id="form">
				<div class="ass-tit">
					<h3>车辆上架</h3>
				</div>
				<div class="ass-car" style="height:inherit;">
					<table>
						<tbody>
							<tr>
								<td class="title"><label for="title">车型</label></td>
								<td class="msg"><input type="text" name="brand"
									class="i-text2 mileage" id="brand" readonly="true" />
								</td>
							</tr>
							<tr>
								<td class="title"><label for="title">上牌地点</label>
								</td>
								<td class="msg"><input name="address" id="address"
									class="i-text2 mileage" type="text" value="">
								</td>
							</tr>
							<tr>
								<td class="title"><label for="title">上牌时间</label>
								</td>
								<td class="msg"><input name="date" id="date"
									class="tcal tcalinput tcalActive" type="text" value="">
								</td>
							</tr>
							<tr>
								<td class="title"><label for="title">行驶里程</label>
								</td>
								<td class="msg"><input type="number" min="1"
									class="i-text2 mileage" name="number" id="number" id="mileage">
									<em>万公里</em>
								</td>
							</tr>
							<tr>
								<td class="title"><label for="title">约定价格</label>
								</td>
								<td class="msg"><input type="number"
									class="i-text2 mileage" name="price" id="price"> <em>万元</em>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modbox" id="picture">
				<a class="btn_addPic" href="javascript:void(0);"onmouseover="mOver(this, '#7bd6e5')" onmouseout="mOut(this,'#B4BEC5')"><span><EM>+</EM>添加图片</span>
					<input type="file" multiple="true" class="filePrew"
					title="支持jpg、jpeg、gif、png格式" id="addFile_btn" tabIndex="3" size=3
					name="fileTrans"> <input type="hidden" name="file" /> </a>
				<a href="javascript:void(0);" class="button button-caution button-primary" id="clear">清空</a>
				<a href="javascript:void(0);" class="button button-caution button-primary" id="submit">全部上传</a>
				<div class="dt-pictype" id="imgs">
					<!-- 显示车的详细图片，一共20张 -->
				</div>
			</div>
			<div class="search">
				<a href="javascript:void(0);" class="car-query" id="uploadbtn"
					onmouseover="mOver(this, '#07903e')" onmouseout="mOut(this,'#22ac38')">立即上架</a>
			</div>
		</form>
		<script>
			function mOver(obj,color) {
				obj.style.backgroundColor = color;
			}
			function mOut(obj,color) {
				obj.style.backgroundColor = color;
			}
		</script>
	</div>
</body>
</html>
