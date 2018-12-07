<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>阳光保险广西分公司</title>
		<link rel="stylesheet" href="${request.contextPath}/subinfo/css/reset.css">
		<link rel="stylesheet" href="${request.contextPath}/subinfo/css/myStyle.css">
		<link rel="stylesheet" href="${request.contextPath}/subinfo/css/gragh.css">
		<script src="${request.contextPath}/subinfo/js/global.js"></script>
	</head>

	<body style="background: #eef1f5; overflow: hidden; width: 100%;">
    		<div class="flex">
    			<div class="body">
    				<div class="showBG">
    					<div  class="barGraph">
    						<div id="bar-chart" class="barGraphSUM">
    							<p class="title"><span></span>分公司目标<span></span></p>
    							<div class="graph">
    								<div class="bars">
    									<div class="bar-group">
    										<div class="bar bar-1 stat-1" id="totalMountheight" style="bottom: 0;height:0%;">
    											<span id="totalMount">0</span>
    										</div>
    									</div>
    								</div>
    							</div>
    						</div>
    						<div id="bar-chart" class="barGraphChild">
    							<p class="title"><span></span>中支目标<span></span></p>
    							<div class="graph" style="width: 100%;">
    								<div class="bars">
    									<div class="bar-group" id="tulist">
    									</div>
    								</div>
    							</div>
    						</div>
    						<div id="bar-chart" class="infoScroll">
    							<p class="title"><span></span>认领信息<span></span></p>
    							<div class="scrollBox">
    								<marquee  direction="up" scrolldelay="200" loop="infinite" style="overflow: hidden;">
    									<ul class="infoLists">
    									</ul>
    								</marquee>
    							</div>
    						</div>
    					</div>
    					<div class="rightShow">
    						<div class="twoCodeBox">
    							<div class="codeImg" style="background: url(${request.contextPath}/subinfo/images/goto.png) no-repeat 0 0;background-size:100% 100%;"></div>
    							<span class="tipBottom">快扫码认领吧</span>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</body>
	<script src="${request.contextPath}/js/jquery-1.7.2.js"></script>
    	<#-- <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script> -->
    	<script type="text/javascript">
    	     //每2秒重新加载数据
    	     setInterval(function(){
                 refleshData();
    	     },2000);

    	     //页面加载数据
            $(function(){
                   getData();
                   //设置二维码的高度
                   var width = $(".twoCodeBox").width();
                    $(".twoCodeBox").height(width+10);
                    $(".rightShow").height(width+10);
             });
             //

            //infoLists 的子元素长度大于600，清除一次，避免内存耗完
             setInterval("scrolls(document.getElementById('infoLists'))",2000);
             function scrolls(obj) {
               if(obj.childNodes.length>600){
                    obj.innerHTML='';
               }
             }

            //首尾相连
            setInterval("scrolls(document.getElementById('infoLists'))",1000);
            function scrolls(obj) {
              var tmp = (obj.scrollTop)++;
              //当滚动条到达右边顶端时
              if(obj.scrollTop==tmp) obj.innerHTML += obj.innerHTML;
              //当滚动条滚动了初始内容的宽度时滚动条回到最左端
              if(obj.scrollTop>=obj.firstChild.offsetHeight) obj.scrollTop=0;

             }


            //获取数据
            function getData(){
                    $.ajax({
                        url: '${request.contextPath}/backpage/activityCenter/getData',
                        type: "POST",
                        data:'',
                        async:false,
                        success: function(data){
                           if(data!=null){
                                $("#totalMountheight").css("height",data.totalCityAmount.amoutHeight+"%");
                                $("#totalMount").text(data.totalCityAmount.amount);
                                getTuList(data.cityAmountList);
                                getInfoLists(data.orderList);
                           }
                        },
                       error: function(data){
                           alert('网络异常，请稍后再试')
                        }
                   });
            }
             //封装柱状图
            function getTuList(data){
                var resultStr = '';
                $.each(data, function(i, n){
                    resultStr+='<div class="barChild bar-1 stat-1" id="height_'+n.cityId+'" style="height:'+n.amoutHeight+'%;">';
                        resultStr+='<span id="amount_'+n.cityId+'">'+n.amount+'<i>'+n.cityName+'</i></span>';
                    resultStr+='</div>';
                });
                $("#tulist").html(resultStr);
            }
             //第一次封装滚动数据
            function getInfoLists(data){
                var resultStr = '';
                  resultStr+='<marquee  direction="up" scrolldelay="200" loop="infinite" style="overflow: hidden;">';
                  resultStr+='<ul class="infoLists" id="infoLists">';
                $.each(data, function(i, n){
                     resultStr+='<li>';
                     resultStr+='<span>'+n.cityName+'</span>';
                     resultStr+='<span>'+n.realName+'</span>';
                     resultStr+='<span>认领<i >'+n.amout+'</i>万元</span>';
                     resultStr+='</li>';

                });
                 resultStr+='</ul>';
                 resultStr+='</marquee>';
                $(".scrollBox").html(resultStr);
            }


            //刷新柱状图数据
            function reflushtTuList(data){
                $.each(data, function(i, n){
                    $("#height_"+n.cityId).css("height",n.amoutHeight+"%");
                    var str = n.amount + "<i>" +n.cityName+"</i>";
                    $("#amount_"+n.cityId).html(str);
                });
            }
             //刷新滚动数据
            function refleshInfoLists(data){
                var resultStr = '';
                $.each(data, function(i, n){
                     resultStr+='<li>';
                     resultStr+='<span>'+n.cityName+'</span>';
                     resultStr+='<span>'+n.realName+'</span>';
                     resultStr+='<span>认领<i >'+n.amout+'</i>万元</span>';
                     resultStr+='</li>';
                });
                $(".infoLists").html(resultStr);
            }
             //刷新数据
            function refleshData(){
                    $.ajax({
                        url: '${request.contextPath}/backpage/activityCenter/getData',
                        type: "POST",
                        data:'',
                        async:false,
                        success: function(data){
                           if(data!=null){
                                $("#totalMountheight").css("height",data.totalCityAmount.amoutHeight+"%");
                                $("#totalMount").text(data.totalCityAmount.amount);
                                reflushtTuList(data.cityAmountList);
                                refleshInfoLists(data.orderList);
                           }
                        },
                       error: function(data){
                           alert('网络异常，请稍后再试')
                        }
                   });
            }
    	</script>
</html>