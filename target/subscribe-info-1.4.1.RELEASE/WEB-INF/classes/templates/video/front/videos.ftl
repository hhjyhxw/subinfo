<!DOCTYPE html>
<html>

	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>直播回放</title>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../../css/global.css" media="all">
		<link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../css/table.css" />
		<link rel="stylesheet" href="../../video/css/reset.css">
		<link rel="stylesheet" href="../../video/css/myStyle.css">
		<script type="text/javascript" src="../../js/jquery.min.js"></script>
		<script src="../../video/js/global.js"></script>
		<style>
		@font-face {
		        font-family: 'PingFang';
		        src: url('/images/PingFang Regular.ttf'),
			}
		.findTool{
			overflow:hidden;
			margin:10px 0;
		}
		.findTool li{
			float:left;
			padding：0 10px;
		}
		.findTool input{
			margin: 0 30px 0 10px;
			height:25px;
			line-height:25px;
		}
		.findTool select{
			margin: 0 30px 0 10px;
			padding:3px 20px;
			height:30px;
		}
		.findTool #search{
			padding:3px 20px;
		}
		.findTool #ship{
			padding:3px 30px;
			margin-left:30px;
		}
		.findTool #ship,#search{
		    font-size:18px;
		}
		
		.findTool #downLoad{
			 padding: 5px 30px;
   			 margin-left: 22px;
		}
		</style>
		
		
		
	</head>

	<body style="background: #eef1f5; overflow: hidden;">
	    <div class="flex">
			<div class="body" style=" width: 100%; height: 100%;">
				<div class="search"><input type="text" id="search_content"  value="${seacrh_content!""}"  placeholder="搜索直播内容"/><div class="sousuo" onclick="search()">搜索</div></div>
				<!--广告：先写死先-->
				
				<#if ad??>
				<a href="${ad.addJumpurl}" class="bannerImg">
					<img src="${pictureVisitUrl}${ad.adImgurl!""}" />
				</a>
				</#if>
				
				<p class="titleBlock">直播</p>
				<!--直播视频列表-->
				<ul class="newsBlock">
				<#if videos?? && (videos?size > 0)>
				<#list videos as video>
					<li>
						<a href="${video.videoAddress}">
							<dl class="newsEntry">
								<dt><img src="${pictureVisitUrl}${video.imagesUrl!""}"/></dt>
								<dd>
									<span style="font-size:22px;font-weight:900;">${video.title}</span>
									<span class="backSee" >回看直播</span>
									<span class="playTime">直播时间：${(video.playTime?string("yyyy-MM-dd HH:mm:ss"))!""}</span>
								</dd>
							</dl>
						</a>
					</li>
				</#list>
				<span class="noMore mBottom100">已显示全部内容</span>
				<#else>
				    <span class="noMore mBottom100">没有搜索到相关的视频信息</span>
				</#if>
				
				</ul>
			</div>
		</div>    
		
        <script type="text/javascript" src="../../plugins/layui/layui.js"></script>
		<script>
			layui.config({
				base: '../../plugins/layui/modules/'
			});
			
			
		    
	    </script>
	    <script language="JavaScript" type="text/javascript">
			
			//搜索视频
			function search(){
			    window.location.href = "${request.contextPath}/frontpage/video/videos?search_content="+$('#search_content').val();
			}
			
	    </script>
	    
	</body>

</html>