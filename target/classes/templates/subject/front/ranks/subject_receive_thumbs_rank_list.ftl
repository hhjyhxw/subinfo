<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>达人榜</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/htgc/css/myStyle.css">
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/htgc/images/PingFang Regular.ttf'),
			}
		
	
		/*加载数据圆点样式*/
	  	.loading-after {
			position: relative;
		}
		.loading-after:after {
			content: '';
			display: block;
			width: 6px;
			height: 6px;
			position: absolute;
			left: 0;
			right: 0;
			bottom: 35px;
			margin:0 auto;
			border-radius: 100%;
			box-shadow: 0 -17px 0 1px #666, 17px 0px #666, 0 17px #666, -17px 0 #666, -12px -12px 0 0.5px #666, 12px -12px 0 1.5px #666, 12px 12px #666, -12px 12px #666;
			animation: mymove 1s steps(8) infinite;
			-webkit-animation: mymove 1s steps(8) infinite;
		}
			@keyframes mymove
			{
				from {-webkit-transform:rotate(0deg);}
				to {-webkit-transform:rotate(360deg);}
			}
  </style>
		
	</head>
	
	<body style="background: #eef1f5; overflow: hidden;">
	     <!-- 排行榜类型 -->
         <input id="ranktype" type="hidden" value="${ranktype}">
		<!-- 当前页码 -->
		<input id="pageNo" type="hidden" value="1">
		<!-- 总页数 活动列表只取一页 -->
		<input id="totalPage" type="hidden" value="">
		<div class="flex">
			<div class="body">

                <div class="indexTab" style="margin-bottom: 15px;">
                    <span id="weeks" <#if ranktype=='weeks'>class="onTabDispaly"</#if> style="width: 49.5%;"><i></i>周榜</span>
                    <span id="moths" <#if ranktype=='moths'>class="onTabDispaly"</#if> style="width: 49%;"><i></i>月榜</span>
                </div>
				<!--达人榜 -->
				<div class="unit overflowH records">
					<div class="rankAllList pLeftRight20">
						<a href="javascript:history.back(-1);"><span></span>返回</a>
						达人榜
					</div>
					<ul class="rankList paddingB">
						<#if receiveThumbsRankList??>
							<#list receiveThumbsRankList as ranks >
								<li>
									<span><#if (ranks_index > 2)>${ranks_index+1}</#if></span>
										<div class="float_l rankUser">
											<img class="userHeadImg" src="${ranks.headimgurl}" alt="" />
											<span>${ranks.nickName}</span>
										</div>
									<span>获得赞${ranks.receivedThumbsCount}</span>
								</li>
							</#list>
						</#if>
					</ul>
					<span class="allContent" style="display:none; margin: -45px 0 10px 0;">已显示全部内容</span>
				</div>
				<!--达人榜   END-->
			</div>
		</div>
		
		<#include "/subject/front/subject_public.ftl"/>
		<script src="${pictureVisitUrl}/htgc/js/receiveThumbsRanks.js"></script>
		<script>
			// 滚动到底部加载更多
			window.canLoad = true;
			window.maxScrollY = $(document).height() - $(window).height()+100;
			$(".body").on('scroll mousewheel', function(event) {
				if(window.scrollY <= maxScrollY && window.canLoad) {
					window.canLoad = false;
					$('.records ul').addClass('loading-after');
					var htmlStr = '';
					setTimeout(function() {
						//当前页码
						var pageNo = document.getElementById("pageNo").value;
						//下一页页码
						pageNo = parseInt(pageNo) + 1;
						var totalPage = document.getElementById("totalPage").value;
						if(totalPage==null || totalPage==''){
							$('.records ul').removeClass('loading-after');
							$('.allContent').css("display","block");
							return false;
						}
						if (pageNo > parseInt(totalPage)) {
							$('.records ul').removeClass('loading-after');
							$('.allContent').css("display","block");
							return false;
						}
						var pretotal = parseInt(pageNo-1)*10;
						$("#pageNo").val(pageNo);
							$.ajax({ 
								url: getBasePath()+'/frontpage/subjectRank/receiveThumbsRankJson',
								type: "POST",
								data:{"ranktype":$("#ranktype").val(),"pageNo":pageNo},
								dataType: "json", 
								async:false,
								success: function(data){
									var htmlStr = '';
									htmlStr=getResultStr(data.list,htmlStr,pretotal);
                                    $('.records ul').append(htmlStr).removeClass('loading-after');
                                    window.canLoad = true;
                                    window.maxScrollY = $(document).height() - $(window).height()+10;
								}
		                   });
					}, 2000)
				};
			});
		</script>
	</body>
</html>