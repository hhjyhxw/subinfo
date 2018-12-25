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
		<style type="text/css">
        			/*滚动动画*/

            @keyframes scrollName {
              0% {
                top: height*0.7px;
              }
              100% {
                top: -height - 50px;
              }
            }
        </style>
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
    											<span style="font-size:20px;" id="totalMount">0</span>
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
    								<#-- <marquee  direction="up" scrolldelay="200" loop="infinite" style="overflow: hidden;"> -->
    								<div style="overflow: hidden; position: relative; width: 100%; height: 100%;">
    									<ul class="infoLists">
    									</ul>
    								</div>
    								<#-- </marquee>  -->
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

    	     var infoAddCount = 0;//滚动数据刷新次数
    	     //每2秒重新加载数据
    	     setInterval(function(){
                 refleshData();
    	     },2000);

    	     //页面加载数据
            $(function(){
                   getData();
                   //设置二维码的高度
                   var width = $(".twoCodeBox").width();
                    $(".twoCodeBox").height(width);
                    $(".rightShow").height(width);
             });

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
                                modifyScrollName();
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
                  resultStr+='<div style="overflow: hidden; position: relative; width: 100%; height: 100%;">';
                  resultStr+='<ul class="infoLists" id="infoLists">';
                $.each(data, function(i, n){
                     resultStr+='<li>';
                     resultStr+='<span>'+n.cityName+'</span>';
                     resultStr+='<span>'+n.realName+'</span>';
                     resultStr+='<span>认领<i >'+n.amout+'</i>万元</span>';
                     resultStr+='</li>';

                });
                 resultStr+='</ul>';
                 resultStr+='</div>';
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
                 modifyScrollName();

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
                                //修改滚动窗口高度
                                //modifyScrollName();
                           }
                        },
                       error: function(data){
                           alert('网络异常，请稍后再试')
                        }
                   });
            }

            function modifyScrollName(){
               var height = $(".infoLists").height();
               var cssRule = getRule();//获取@keyframes  

               cssRule.deleteRule("0");
               cssRule.deleteRule("1");
               cssRule.appendRule("0%{top:"+height*0.8+"px; }");
               cssRule.appendRule("100%{top:-"+(height-50)+"px;}")
               //cssRule.appendRule("100%{top:0px;}")
            }
             //获取指定动画名称
             function getRule() {
                  var rule;
                  var ss = document.styleSheets;
                  for (var i = 0; i < ss.length; ++i) {
                      for (var x = 0; x < ss[i].cssRules.length; ++x) {
                          rule = ss[i].cssRules[x];
                          if (rule.name == "scrollName" && rule.type == CSSRule.KEYFRAMES_RULE) {
                             return rule;
                          }
                      }
                  }
              }

    	</script>
</html>