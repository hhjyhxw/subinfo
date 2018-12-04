<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>商品详情</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/myStyle.css?v=2">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
			}
			.selectOne{
			   color: #0060bf;
		   	   background: #fff;
			}
			.body{
			
			}
		</style>
	</head>

	<body style="background: #fff; overflow: scroll; -webkit-overflow-scrolling:touch;width: 100%;">
		<div class="flex">
			<div class="body">
				<div class="goodsImg">
					<div class="goodsPic"><img src="${pictureVisitUrl}${(beanGoods.goodImage)!}" alt="" /></div>
					<p>${beanGoods.name}</p>
					<p>兑换价格 乐豆${(beanGoods.score?c)!}</p>
				</div>
				<div class="tools">
					<p>兑换数量：</p>
					<div>
						<!-- <span class="minus"></span> -->
                		<span class="nums">1</span>
                		<!--  <span class="add"></span > -->
					</div>
				</div>
				<div class="tools">
					<p class="address">选择地址配送地址</p>
					<span class="arrow"></span>
					<input type="text" id="addressId" value="" />
				</div>
				<div class="tabsIntro">
					<h2 class="tabTitle">
						<span class="" id="goodsIntro" style="width:100%;">商品详情</span>
						<!--
						<span class="onTabTitle" id="goodsIntro">商品详情</span>
						<span id="parameter">规格参数</span>
						-->
					</h2>
					<!--切换栏   商品详情-->
					<div class="goodsIntro" style="flex-direction: column;font-size: 28px;color: red;align-items:left;">
						${(beanGoods.goodDetail)!}
					</div>
					<!--切换栏   商品详情   END-->
					<!--切换栏   规格参数-->
					<div class="parameter" style="display:none;font-size:22px;">
						${(beanGoods.goodDesc)!}
					</div>
					<!--切换栏   规格参数    END-->
				</div>
			</div>
		</div>
		<div class="goodsBottomMenu" style="background: url(../../ldsc/img/bg_bMenu.jpg) no-repeat 0 0;
                                                background-size: 100% 100%;">
			<ul>
				<li><a href="${request.contextPath}/frontpage/beanGoods/goodsList">首页</a></li>
				<li><a href="${request.contextPath}/frontpage/user/myCenter">个人中心</a></li>
			</ul>
			<div class="openBeansForm"><a href="#">立即兑换</a></div>
		</div>
		
		<!-- 确认兑换——弹窗HTML 需要折扣券才可以兑换-->
		<div class="modal-comfirm cardListForm"  style="display: none">
		  	<div class="content_zhongjiang">
		  		<p class="changeLd totalneed" style="font-size:28px;">商品总额：${(beanGoods.score?c)!0}乐豆</p>
		  		<p class="changeLd realneed" style="font-size:28px;">实际需要支付：${(beanGoods.score?c)!0}乐豆</p>

		  		<!-- 判断是否可以使用折扣券 (一般商品，或者是非京东类商品)可以使用优惠券 -->
		  		<#if (beanGoods.beanGoodsStrategy?? && (beanGoods.beanGoodsStrategy?? && beanGoods.beanGoodsStrategy.secondType=='1'))>
                    <ul class="selectCard" style="height: auto;overflow: auto;">
                        <li>无折扣券可用</li>
                    </ul>
		  		</#if>
		  		<p class="" style="font-size:28px;color:white;">*温馨提示：每个用户每个品类商品仅限兑换一份</p>
		  		<div class="confirmSelectBtn comfirmToExchange">确认兑换</div>
		  		<div class="closeXX" style="position: absolute; width: 60px; height:60px; bottom: -80px;left: 0; right: 0; margin: 0 auto;"><img src="${pictureVisitUrl}/ldsc/img/close.png" alt=""  width="60" style="display: block;"/></div>
		  		
		  	</div>
		</div>
		<!-- 确认兑换——弹窗HTML 需要折扣券才可以兑换 END-->
		
		<!-- 兑换成功——弹窗HTML -->
		<div class="modal-comfirm exchangeSuccessForm"  style="display: none;">
		  	<div class="content_zhongjiang successWinBg">
		  		<p class="changeLd successChange">已兑换成功<span></span></p>
		  		<div class="dragonImg"><img id="exchangeImg" src="${pictureVisitUrl}/ldsc/img/dragon.png" alt="" /></div>
		  		<div class="confirmSelectBtn confirmBtn">确 定</div>
		  	</div>
		</div>
		<!-- 兑换成功——弹窗HTML END-->
	    
	    <input type="hidden" id="goodsId" value="${beanGoods.id?c}"/>
	    <input type="hidden" id="virtlReal" value="${(beanGoods.virtlReal)!''}"/>
	    <input type="hidden" id="goodsScore" value="${beanGoods.score?c}"/>


	     <input type="hidden" id="clientToken" value="${(clientToken)!}"/>
	</body>

<!-- 一般提示框 -->
<div class="modal-alert" style="background-color: rgba(0, 0, 0, 0.6);">
    <div class="content">
      <p></p>
      <a href="javascript:void(0)" class="btn-close" onclick="closeAlert()">我知道了</a>
   </div>
 </div> 
	<#include "/front/public.ftl"/>  
	<script src="${pictureVisitUrl}/ldsc/js/goodsNewDetaill.js?v=15"></script>
</html>
<#include "/front/loading.ftl"/> 