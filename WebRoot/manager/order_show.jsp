<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//dtD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/dtD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理中心</title>
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Car/css/bootstrap-combined.min.css">
<link rel="stylesheet" type="text/css" href="/Car/css/buttons.css">
<script type="text/javascript" language="javascript">
function havedone(id)
	{
		htmlobj=$.ajax({
		url:"http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Order_infor/"+id,
		type:"GET",
		async : false,
		dataType : "json",
		});
		var datas = htmlobj.responseText;
		var order=eval("("+datas+")");
		alert(order.buyer_id.name);
		var orderinfo = {
			order_time : order.order_time,
			is_done : 0,
			car_info_id : {id : order.car_info_id.id},
			buyer_id : {id : order.buyer_id.id }
		}
		$.ajax({
				url: "http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Order_infor/"+id,
				contentType: "application/json",
				type: "PUT",
				data: JSON.stringify(orderinfo),
				success: function (data) {
					if(data!=null)
					{
						alert("处理成功");
					}
					 location.reload();
				} 
			})
	}
$(document).ready(function(){
	htmlobj=$.ajax({
	url:"http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Order_infor/?Order_infor.is_done=1",
	type:"GET",
	async : false,
	dataType : "json",
	});
	var datas = htmlobj.responseText;
	var jsonObject=eval("("+datas+")");
	var orders = jsonObject.Order_infor;
	var txt="";
	if(orders!=null)
	{
			for(var i=0;i<orders.length;i++)
		{
			txt +="<tr class='info'><td>"+(i+1)+"</td>"
				+"<td>"+orders[i].buyer_id.name+"</td>"
			    +"<td>"+orders[i].buyer_id.telephone+"</td>"
			    +"<td>"+orders[i].car_info_id.seller_id.name+"</td>"
			    +"<td>"+orders[i].car_info_id.seller_id.telephone+"</td>"
			    +"<td><a href='javascript:void(0);' onclick='havedone("+orders[i].id+")' class='button button-royal button-rounded button-small' id='done'>已处理</a></td></tr>";				
		}
	}
	else
	{
		txt +="<tr class='error'><td colspan='6' type='text-align: center;'>"+"没有未处理订单"+"</td>"
	}

	$("#orders").html(txt);
	
});
	function fsubmit(obj) {
		obj.submit();
	}
	function deleteAlert(id) {
		return confirm("确定要删除吗？");
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
</head>
<body>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<div class = "w" style="width: 1190px; margin: 0 auto;">
	<div class="container-fluid"style="border: 1px solid #e4e4e4;background-color: #ffffff">
	<div class="row-fluid">
		<div class="span12">
			<table class="table"  style="margin-top:20px">
				<thead >
					<tr style="background-color: #dff0d8">
						<th>
							编号
						</th>
						<th>
							买家姓名
						</th>
						<th>
							买家电话
						</th>
						<th>
							卖家姓名
						</th>
						<th>
							卖家电话
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				
				<tbody id="orders">
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>

</body>
</html>
