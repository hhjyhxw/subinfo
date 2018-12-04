<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>真龙话题广场</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/css/common/swiper-3.3.1.min.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/css/common/changeAlert.css">
		
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}


			.loading-after {
				position: relative;
			}

			.loading-after:after {
				content: '';
				display: block;
				width: 3px;
				height: 3px;
				border-radius: 100%;
				box-shadow: 0 -10px 0 1px currentColor, 10px 0px currentColor, 0 10px currentColor, -10px 0 currentColor, -7px -7px 0 0.5px currentColor, 7px -7px 0 1.5px currentColor, 7px 7px currentColor, -7px 7px currentColor;
				/* left-bottom */
			-webkit-animation: spin 1s steps(8) infinite;
				animation: spin 1s steps(8) infinite;
				/*center*/
				margin: 2rem auto 2rem 52%;
			}	
			
			.userCenterEnterBtn{
				position: fixed;
				right: 25px;
				bottom:30px;
				width: 166px;
				height: 166px;
				background: url(${pictureVisitUrl}/htgc/images/userEnter.png) no-repeat 0 0;
				background-size: 166px 166px;
			}
		</style>
		
	</head>
	
	<body style="background: #eef1f5; overflow: hidden;">
		<!-- 当前页码 -->
		<input id="pageNo" type="hidden" value="1">
		<!-- 总页数 活动列表只取一页 -->
		<input id="totalPage" type="hidden" value="">
		<input id="topicType" type="hidden" value="">
		<div class="flex">
			<div class="body" style=" width: 100%; height: 100%;postition:relative;">
				<#--
					<a href="#" class="bannerImg" style="max-height: 307.19px;">
						<img src="${pictureVisitUrl}/htgc/images/banner.png" />
					</a>
				-->
				<!-- BANNER -->
				<div class="bannerImg">
  					<div class="swiper-container">
    					<div class="swiper-wrapper">
     						<#list adList as advertisement> 
      							<div class="swiper-slide"  style="max-height: 307.19px;">
       								<a href="${advertisement.addJumpurl}" class="sybanner">
       								<input type="hidden" value="banner_${advertisement.id}">
       								<img src="${pictureVisitUrl}/${advertisement.adImgurl}" class="swiper-lazy" alt="${advertisement.adName}"></a>
      							</div>
     						</#list>
    					</div>
    					<div class="swiper-pagination"></div>
  					</div>
				</div>
				<!--BANNER end-->
				<div class="mBottom100">
					<div class="indexTab">
						<span id="0" class="indexTabItem onTabDispaly"><i></i>话题</span>
						<span id="1" class="indexTabItem"><i></i>征集</span>
						<span id="2" class="indexTabItem"><i></i>名人堂</span>
					</div>
					<!--切换栏   话题-->
					<ul class="indexTabList">
					</ul>
					<a href="${request.contextPath}/frontpage/center/index" class="userCenterEnterBtn"></a>
					<!--切换栏   话题    END-->
					<span class="allContent" style="display:none;">已显示全部内容</span>
				</div>
			</div>
		</div>
		
			<!-- 一般提示框 -->
			<div class="modal-alert" style="background-color: rgba(0, 0, 0, 0.6);display:none;">
   				<div class="content">
    			 <p></p>
     			 <a href="javascript:void(0)" class="btn-close" onclick="closeAlert()">我知道了</a>
   				</div>
 			</div> 
 			
		
			<!-- 发表成功——没达到上线弹窗HTML -->
		<div class="modal-comfirm" id="contentSuccess" style="display:none;">
		  	<div class="content_zhongjiang noBgImg">
		  		<div class="publicContent">
		  			<div class="zmResult">
			  			<img src="${pictureVisitUrl}/htgc/images/icon_pubulicSeccess.png"/ width="80" height="80">
			  			<p>恭喜您获得奖励，请在乐豆明细中查看!</p>
	  				</div>
	  				<a href="javascript:closeSuccesssWidow();" class="btn_close">关闭</a>
		  		</div>
		  	</div>
		</div>
		<!-- 发表成功——没达到上线弹窗HTML END-->
	</body>
	<#include "/subject/front/subject_public.ftl"/> 
		
	<!-- 图片轮播组件 -->
	<script src="${pictureVisitUrl}/js/common/swiper-3.3.1.min.js"></script>
 	<script src="${pictureVisitUrl}/js/common/dateutil.js"></script>
 	<script src="${pictureVisitUrl}/htgc/js/subjectIndex.js?v=5"></script>
 	
 	<script>
			// 滚动到底部加载更多
			window.canLoad = true;
			window.maxScrollY = $(document).height() - $(window).height()+100;
			$(".body").on('scroll mousewheel', function(event) {
				if(window.scrollY <= maxScrollY && window.canLoad) {
					window.canLoad = false;
					$('.mBottom100 ul').addClass('loading-after');
					var htmlStr = '';
					setTimeout(function() {
						//当前页码
						var pageNo = document.getElementById("pageNo").value;
						//下一页页码
						pageNo = parseInt(pageNo) + 1;
						var totalPage = document.getElementById("totalPage").value;
						if(totalPage==null || totalPage==''){
							$('.mBottom100 ul').removeClass('loading-after');
							$('.allContent').css("display","block");
							return false;
						}
						if (pageNo > parseInt(totalPage)) {
							$('.mBottom100 ul').removeClass('loading-after');
							$('.allContent').css("display","block");
							return false;
						}
						$("#pageNo").val(pageNo);
						var topicType = $("#topicType").val();
							$.ajax({ 
								url : getBasePath()+'/frontpage/subjectIndex/getTopicAndCollectionListJson',
								type: "POST",
								data : {
									"topicType":topicType,"pageNo":pageNo
								},
								dataType: "json", 
								async:false,
								success: function(data){
									var resultString = '';
									resultString = getTopicListStrig(data.list,resultString);
			                       	$('.mBottom100 ul').append(resultString).removeClass('loading-after');
									window.canLoad = true;
									window.maxScrollY = $(document).height() - $(window).height()+10;
								}
		                   });
					}, 2000)
				};
			});
			
				//轮播焦点图
  		  var mySwiper = new Swiper('.swiper-container', {
     		 loop: true,
     		 autoplay: 5000, //自动滑动时间间隔
     		 pagination: '.swiper-pagination',
     		 autoplayDisableOnInteraction: false, //手指滑动后依然能自动切换
     		 lazyLoading : true  //图片延迟加载
   		 });
   		 
   		 
   		 //关闭发表成功弹窗
		function closeSuccesssWidow(){
			$("#contentSuccess").css("display","none");
		}
		</script>
</html>