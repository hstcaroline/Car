<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>结果估价</title>
<link rel="stylesheet" type="text/css" href="/Car/css/evaluate.css">
<script type="text/javascript" src="/Car/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){	
	var car_type = getUrlParam('car_type');
	var new_car_price = 0;
	var url = "http://202.120.40.73:28080/Entity/U7e7f6d3aa4a91/Car/Car_type/"+car_type;
	
	$.getJSON(url,function(data){
		var car_name = data.series_id.brand_id.brand_name+" "+data.series_id.series_name+" "+data.type_name;
		$("#car_name").html(car_name);
		new_car_price = data.new_car_price;
		var old_car_price = new_car_price*evaluate();
		$("#sell_old_price").html(formatCurrencyNum(old_car_price)+"万");
		$("#buy_old_price").html(formatCurrencyNum(old_car_price*0.9)+"万");
	});
	$("#dateAndnumber").html(getUrlParam('date')+"上牌，目前行驶"+getUrlParam('number')+"万公里");
	
});
  //获取url中的参数
function getUrlParam(name) {
  	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
  	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
  	if (r != null) 
  		return unescape(r[2]);
    return null; //返回参数值
}
//将数值四舍五入(保留1位小数)后格式化成金额形式  
function formatCurrencyNum(num) {    
    num = num.toString().replace(/\$|\,/g,'');    
    if(isNaN(num))    
    num = "0";    
    sign = (num == (num = Math.abs(num)));    
    num = Math.floor(num*10+0.50000000001);    
    cents = num%10;    
    num = Math.floor(num/10).toString();    
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)    
    num = num.substring(0,num.length-(4*i+3))+','+    
    num.substring(num.length-(4*i+3));    
    return (((sign)?'':'-') + num + '.' + cents);    
}    
function evaluate()
{
	//获得上牌时间和现在时间的年份差
	var date = new Date(getUrlParam("date").replace(/-/g,"/"));  
	var mydate = new Date();
	var year = mydate.getYear()-date.getYear();  
	//获得行驶的里程数
	var number = getUrlParam("number")
	var weight_time = 15,weight_num = 15;
	/* 通过“54321法”估计二手车的价格 */
	if(number >= 6)
	{
		weight_num -= 5;
		if(number >= 12)
		{
			weight_num -=4;
			if(number >= 18)
			{	
				weight_num -=3;
				if(number >=24)
				{
					weight_num -=2;
					if(number >=30)
					{
						weight_num -=1;
					}
				}
			}
			
		}
	}
	else
		weight_num -=0.5;
	if(year >= 2)
	{
		weight_time -= 5;
		if(year >= 4)
		{
			weight_time -=4;
			if(year >= 6)
			{	
				weight_time -=3;
				if(year >=8)
				{
					weight_time -=2;
					if(year >= 10)
					{
						weight_time -=1;
					}
				}
			}
			
		}
	}
	else
		weight_time -=0.5;
	var weight = (weight_time*0.6+weight_num*0.4)/15;
	return weight;
}
</script>
	<!-- 顶部导航条 -->
	<jsp:include page="top.jsp" flush="false" />
	<!-- header end-->
	<div class="assess-wrap clearfix">
    <div class="ass-new">
        <img src="/Car/img/car.jpg">
        <div class="txt">
            <h2 id="car_name"></h2>
            <p id="dateAndnumber"></p>
            <ul>
                <li class="br">
                    <span>零售价</span>
                    <b id="sell_old_price">7.60万</b>
                </li>
                <li>
                    <span>收购价</span>
                    <em id="buy_old_price">6.92万</em>
                </li>
            </ul>
            <h4>*此价格仅供参考</h4>
        </div>
    </div>
    <a href="/Car/index/sell.jsp" class="car-query"onmouseover="mOver(this)" onmouseout="mOut(this)">立即卖车</a>
</div>
	<script>
		function mOver(obj) {
			obj.style.backgroundColor = "#07903e";
		}
		function mOut(obj) {
			obj.style.backgroundColor = "#22ac38";
		}
	</script>
</body>
</html>
