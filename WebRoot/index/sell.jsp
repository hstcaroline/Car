<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>提交车辆信息，帮你卖车</title>
<link rel="stylesheet" type="text/css" href="/Car/css/evaluate.css">
</head>

<body>
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
						<td class="title"><label for="title">姓名</label>
						</td>
						<td class="msg"><input type="text" class="i-text2 mileage"
							name="name" id="name"  style="color: rgb(191, 191, 191)" onfocus="txtFocus(this)" onblur="txtBlur(this)" value="您的中文全名">
						</td>
					</tr>
					<tr>
						<td class="title"><label for="title">联系方式</label>
						</td>
						<td class="msg"><input type="text" class="i-text2 mileage"
							name="phone" id="phone" style="color: rgb(191, 191, 191)" onfocus="txtFocus(this)" onblur="txtBlur(this)" value="请输入手机号">
						</td>
					</tr>
					<tr>
						<td class="title"><label for="title">选择车型</label>
						</td>
						<td class="msg">
							<div class="clearfix">
								<select name="brand" class="bcar" data-enabled="false"
									id="php_brand">
									<option value="0">品牌</option>
									<option value="5">安驰</option>
									<option value="62">奥迪</option>
									<option value="68">阿斯顿马丁</option>
									<option value="141">AC Schnitzer</option>
									<option value="175">阿尔法罗密欧</option>
									<option value="4">巴博斯</option>
									<option value="6">宝龙</option>
									<option value="22">保时捷</option>
									<option value="34">别克</option>
									<option value="38">宝马</option>
									<option value="47">奔驰</option>
									<option value="58">北汽制造</option>
									<option value="59">本田</option>
									<option value="63">北京汽车</option>
									<option value="93">奔腾</option>
									<option value="121">比亚迪</option>
									<option value="133">宝骏</option>
									<option value="154">宾利</option>
									<option value="158">布加迪</option>
									<option value="174">标致</option>
									<option value="177">北汽幻速</option>
									<option value="27">长丰</option>
									<option value="42">长安</option>
									<option value="115">长城</option>
									<option value="146">昌河</option>
									<option value="7">道奇</option>
									<option value="45">大宇</option>
									<option value="72">大迪</option>
									<option value="80">东南</option>
									<option value="84">大众</option>
									<option value="108">大通</option>
									<option value="134">帝豪</option>
									<option value="150">东风</option>
									<option value="41">菲斯克</option>
									<option value="46">福田</option>
									<option value="60">菲亚特</option>
									<option value="85">福迪</option>
									<option value="89">丰田</option>
									<option value="98">福特</option>
									<option value="123">法拉利</option>
									<option value="30">光冈</option>
									<option value="50">GMC</option>
									<option value="143">广汽</option>
									<option value="176">观致</option>
									<option value="189">GUMPERT</option>
									<option value="226">广汽菲克</option>
									<option value="3">悍马</option>
									<option value="11">华泰</option>
									<option value="28">黑豹</option>
									<option value="33">黄海</option>
									<option value="54">哈飞</option>
									<option value="66">红旗</option>
									<option value="90">华翔</option>
									<option value="91">华北</option>
									<option value="132">海马</option>
									<option value="152">汇众</option>
									<option value="153">华普</option>
									<option value="159">华阳</option>
									<option value="167">恒天</option>
									<option value="179">航天</option>
									<option value="180">海格</option>
									<option value="190">华颂</option>
									<option value="64">金龙</option>
									<option value="76">金程</option>
									<option value="83">吉利</option>
									<option value="87">金杯</option>
									<option value="97">江淮</option>
									<option value="109">吉奥</option>
									<option value="137">江铃</option>
									<option value="139">Jeep</option>
									<option value="149">江南</option>
									<option value="161">九龙</option>
									<option value="173">捷豹</option>
									<option value="14">开瑞</option>
									<option value="61">克莱斯勒</option>
									<option value="65">柯尼赛格</option>
									<option value="86">卡尔森</option>
									<option value="120">凯迪拉克</option>
									<option value="136">凯佰赫</option>
									<option value="181">KTM</option>
									<option value="182">卡威</option>
									<option value="185">凯马汽车</option>
									<option value="188">凯翼</option>
									<option value="220">康迪</option>
									<option value="8">雷诺</option>
									<option value="16">莲花</option>
									<option value="31">雷克萨斯</option>
									<option value="49">路特斯</option>
									<option value="88">林肯</option>
									<option value="94">铃木</option>
									<option value="99">力帆</option>
									<option value="112">路虎</option>
									<option value="117">兰博基尼</option>
									<option value="130">劳斯莱斯</option>
									<option value="164">陆风</option>
									<option value="186">陆地方舟</option>
									<option value="219">罗孚</option>
									<option value="13">摩根</option>
									<option value="26">迷你</option>
									<option value="29">迈巴赫</option>
									<option value="75">迈凯伦</option>
									<option value="104">名爵</option>
									<option value="145">马自达</option>
									<option value="151">玛莎拉蒂</option>
									<option value="165">美亚</option>
									<option value="35">纳智捷</option>
									<option value="170">南汽</option>
									<option value="118">讴歌</option>
									<option value="128">欧宝</option>
									<option value="148">帕加尼</option>
									<option value="21">庆铃</option>
									<option value="129">起亚</option>
									<option value="155">奇瑞</option>
									<option value="15">日产</option>
									<option value="23">荣威</option>
									<option value="56">瑞麒</option>
									<option value="18">陕汽通家</option>
									<option value="74">双环</option>
									<option value="82">双龙</option>
									<option value="92">斯柯达</option>
									<option value="96">赛宝</option>
									<option value="122">Smart</option>
									<option value="125">世爵</option>
									<option value="147">三菱</option>
									<option value="156">斯巴鲁</option>
									<option value="157">萨博</option>
									<option value="12">天马</option>
									<option value="24">通宝</option>
									<option value="44">天津一汽</option>
									<option value="111">通田</option>
									<option value="184">特斯拉</option>
									<option value="32">五十铃</option>
									<option value="51">五菱</option>
									<option value="53">威麟</option>
									<option value="114">威兹曼</option>
									<option value="124">万丰</option>
									<option value="135">沃尔沃</option>
									<option value="37">新凯</option>
									<option value="52">西雅特</option>
									<option value="55">现代</option>
									<option value="71">雪铁龙</option>
									<option value="73">雪佛兰</option>
									<option value="171">新大地</option>
									<option value="178">新龙马</option>
									<option value="43">云豹</option>
									<option value="102">依维柯</option>
									<option value="106">永源</option>
									<option value="110">英格尔</option>
									<option value="119">一汽</option>
									<option value="140">云雀</option>
									<option value="160">英菲尼迪</option>
									<option value="169">英伦</option>
									<option value="172">野马</option>
									<option value="187">英致</option>
									<option value="57">中誉</option>
									<option value="67">中顺</option>
									<option value="70">中兴</option>
									<option value="77">中华</option>
									<option value="100">众泰</option>
									<option value="103">中欧</option>
									<option value="227">知豆</option>
								</select>
							</div>
							<div class="clearfix">
								<select name="series" class="bcar" data-enabled="false"
									id="php_series">
									<option value="0">车系</option>
								</select>
							</div>
							<div class="clearfix">
								<select name="modeid" class="bcar" data-enabled="false"
									id="php_modeid">
									<option value="0">车型</option>
								</select>
							</div></td>
					</tr>
					<tr>
						<td class="title"><label for="title">随机码</label></td>
						<td class="msg"><input type="text" class="i-text2 mileage"
							name="phone" id="phone" style="color: rgb(191, 191, 191)" onfocus="txtFocus(this)" onblur="txtBlur(this)" value="请输入随机码">
							<input type="button" class="getNum vm" id="need_code_fs" value="获取验证码">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<a href="javascript:void(0)" class="car-query"
			onmouseover="mOver(this)" onmouseout="mOut(this)">提交信息</a>
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
