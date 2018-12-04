<!doctype html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no">
		<title>新增收货地址</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pictureVisitUrl}/css/global.css" media="all">
		<link rel="stylesheet" href="${pictureVisitUrl}/plugins/font-awesome/css/font-awesome.min.css">
		
		
		
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/ldsc/css/myStyle.css">
        
        <link rel="stylesheet" href=".${pictureVisitUrl}/ldsc/weui/lib/weui.min.css">
        <link rel="stylesheet" href="${pictureVisitUrl}/ldsc/weui/css/jquery-weui.css">
		
		<script src="${pictureVisitUrl}/ldsc/js/jquery-2.1.4.js"></script>
		<script src="${pictureVisitUrl}/ldsc/js/global.js"></script>
		<link rel="stylesheet" href="${pictureVisitUrl}/css/table.css" />
		
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('/images/PingFang Regular.ttf'),
			}
            #detailAddress::-webkit-input-placeholder{
                color: black;
                font-size: 28px;
                line-height: 50px;
            }
            #detailAddress,#userName,#userPhone{
                font-size: 28px;
            }
            
		</style>
	    
	    
	</head>
    
	<body ontouchstart style="background: #e4ecff; overflow: hidden; width: 100%;">
		<div class="flex">
			<div class="body">
				<div class="oderHead"><a href="javascript :history.go(-1)"><span></span></a>新增收货地址</div>
				<form action="${request.contextPath}/frontpage/orderAddress/orderAddressSave" style="padding:0 10px" id="formId" method="post">
				    <input type="hidden" name="id" id="addrId" value="${(address.id?c)!}"/>
				    <input type="hidden" name="provinceName" id="provinceName" value="${(address.provinceName)!}" />
				    <input type="hidden" name="cityName" id="cityName" value="${(address.cityName)!}" />
				    <input type="hidden" name="countyName" id="countyName" value="${(address.countyName)!}" />
				    <input type="hidden" name="defaultAddr" id="defaultAddr" value="${(address.defaultAddr)!}" />
					<div class="editItem">
						<span><i>*</i>收货人</span><input type="text" name="name" id="userName" value="${(address.name)!}" />
					</div>
					<div class="editItem">
						<span><i>*</i>联系方式</span><input type="text" name="phone"  id="userPhone" value="${(address.phone)!}" />
					</div>
					<div class="editItem noBorder">
						<div style="overflow: hidden;">
							<span><i>*</i>所在地区</span>
							<select name="provinceId" id="province" class="selectProvince" value="${(address.provinceId?c)!}" onchange="setProvince()">
								<option value="">(请选择省)</option>
							</select>
						</div>
						<div id="areaSelect">
							<select name="cityId" id="city" class="selectCity" value="${(address.cityId?c)!}" onchange="setCity()">
								<option value="">(市)</option>
							</select>
							<select name="countyId" id="county" class="selectXian" value="${(address.countyId?c)!}" onchange="setCounty()">
								<option value="">(区/县)</option>
							</select>
						</div>
						<input type="text" style="font-size:28px;" id="detailAddress" name="detailAddress" value="${(address.detailAddress)!}" class="addressEdit" placeholder="(请填入详细地址)"  />
					</div>
				</form>
				<div class="saveAddressBtn" onclick="save()">保存</div>

			</div>
		</div>
		<div class="toast_div" style="style="width:300px;height:300px;"></div>
		<script src="${pictureVisitUrl}/ldsc/weui/js/jquery-weui.js"></script>
		<script>
	      $(function(){
	          //新增地址，打印省份的下拉选择
	          getAreas("province",1,0000);
	      })
	      
	      
	      
	      //选择省份
	      function setProvince(){
	        var selected = $('#province').find("option:selected");
	        getAreas('city',selected.val());
	        $('#provinceName').attr("value",selected.text());
	      }
	      //选择城市
	      function setCity(){
	        var selected = $('#city').find("option:selected");
	        getAreas('county',selected.val());
	        $('#cityName').attr("value",selected.text());
	      }
	      //选择区/县
	      function setCounty(){
	       var selected = $('#county').find("option:selected");
	       $('#countyName').attr("value",selected.text());
	      }
	      
	      //打印select的方法
	      function getAreas(area,parentId,defaultValue){
	        var optArea = $('#'+area)
	        optArea.empty();
	        optArea.append("<option>请选择</option>");
	        $.ajax({
	          url:"${request.contextPath}/frontpage/address/findArea",
	          type:"GET",
	          async:false,
	          data:{'parentId':parentId},
	          success:function(result){
	            $.each(result.data.areas,function(index,item){
	              if(item.id == defaultValue){
	                optArea.append('<option value='+item.id+' selected>'+item.name+'</option>');
	              }else{
	                optArea.append('<option value='+item.id+'>'+item.name+'</option>');
	              }
	            });
	          }
	        });
	        
	      }
	      
	      //提交表单
	      function save(){
	        
	        if(checkParams()){
	        
	         document.getElementById('formId').submit();
	        }
	      }
	      
	      //校验参数
	      function checkParams(){
	       var userName = $("#userName").val();
	       var userPhone = $("#userPhone").val();
	       var province = $("#province").val();
	       var city = $("#city").val();
	       var county = $("#county").val();
	       var detailAddress = $("#detailAddress").val();
	       var defaultAddr = $("#defaultAddr").val();
	       
	       if(userName == null || userName == ""){
	         $.toast("请填写收货人姓名", "text");
	         
	         //$('.toast_div').toast({
			//	content:'请填写收货人姓名',
				//duration:1000
			//});
	         //alert("请输入您的姓名！");
	         return false;
	       }
	       if(userPhone == null || userPhone == "" || !userPhone.match(/^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1})|(19[8-9]{1})|(166))+\d{8})$/)){
	         $.toast("联系方式为空或填写错误！", "text");
	         return false;
	       }
	       if(province == null || province == "" || province == "请选择"){
	         $.toast("请选择您所在的省份！", "text");
	         return false;
	       }
	       
	       if(city == null || city == "" || city == "请选择"){
	         $.toast("请选择您所在的城市！", "text");
	         return false;
	       }
	       
	       if(county == null || county == "" || county == "请选择"){
	         $.toast("请选择您所在的区/县！", "text");
	         return false;
	       }
	       
	       if(detailAddress == null || detailAddress == ""){
	         $.toast("请输您的详细收货地址！如街道、门牌号等", "text");
	         return false;
	       }
	       
	       if(defaultAddr == null || defaultAddr == ""){
	         $("#defaultAddr").attr("value","0");
	       }
	       
	       return true;
	      }
	      
	    </script>
		
	</body>
</html>