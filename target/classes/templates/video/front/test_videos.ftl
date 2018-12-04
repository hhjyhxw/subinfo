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
		
		<script>
		   window.onload = function(){
		      getVideos(0,"");
		   }
		</script>
		
	</head>

	<body style="background: #eef1f5; overflow: hidden;">
	    <div class="flex">
			<div class="body" style=" width: 100%; height: 100%;">
				<div class="search"><input type="text" id="search_content"  value="${seacrh_content!""}"  placeholder="搜索直播内容"/><div class="sousuo" onclick="search()">搜索</div></div>
				<#if ad??>
				<a href="${ad.addJumpurl}" class="bannerImg">
					<img src="${ad.adImgurl!""}" />
				</a>
				</#if>
				<p class="titleBlock">直播</p>
				<ul class="newsBlock" id="newsBlock">
				
				
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
			
			function getVideos(pageNo,content){
			    $.ajax({
			       url:"${request.contextPath}/frontpage/video/getList",
			       type:"get",
			       data:{"pageNo":pageNo,"content":content},
			       success:function(ret){
			          printHtml();
			       }
			    });
			}
			
			function printHtml(){
			    var html = '<li><a href="http://live.vhall.com/409307014}>';
			    html += '<dl class="newsEntry">';
			    html += '<dt><img src="${pictureVisitUrl}/uploadpath/goodimage//2635e482e3b54753945f3e67cf42eff0.jpg}"/></dt>';
			    html += '<dd><h3>对抗久坐劳损，昂首挺胸，做个“正直”人！</h3><span class="backSee" >回看直播</span>';
			    html += '<span class="playTime">直播时间：2018-08-03 12:12:00</span></dd></dl>';
			    html += '</a></li>';
			    
			    $('#newsBlock').append(html);
			}
			
			//--------------上拉加载更多---------------
			 //获取当前滚动条的位置
			 function getScrollTop(){
			    var scrollTop = 0;
			    if(document.documentElement && document.documentElement.scrollTop){
			       scrollTop = document.documentElement.scrollTop;
			    }else{
			       scrollTop = document.body.scrollTop;
			    }
			    return scrollTop;
			 }
			 
			 //获取当前可视范围的高度
			 function getClientHeight(){
                            
			    var clientHeight = 0;
			    if(document.body.clientHeight && document.documentElement.clientHeight) {
                 clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight);
             } else {
                 clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
             }
                           
			    return clientHeight;
			 }
			 
			 //获取文档的完整高度
			 function getScrollHeight(){
			    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
			 }
			 
			 //滚动事件触发
			 window.onscroll = function(){
			   if(getScrollTop()+getClientHeight() > getScrollHeight()){
			      alert('划到底了');
			   }
			 }
			 
			 //------------- 结束 ----------------------
			
	    </script>
	    
	</body>

</html>