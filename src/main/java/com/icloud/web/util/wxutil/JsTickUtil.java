package com.icloud.web.util.wxutil;//package com.icloud.common.util.wx;

import com.alibaba.fastjson.JSONObject;
import com.icloud.common.ConfigUtil;
import com.icloud.web.util.HttpUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 获取 JsTickt
 * @author z
 *
 */
public class JsTickUtil {

	private static Logger logger = LoggerFactory.getLogger(JsTickUtil.class);


	public static synchronized  JSSDK getJSSDK(String appId,String appsecret,String url) throws Exception {
		//1、获取根据基础accesstoken 获取 ticket
		BaseAccessToken accessToken = BaseAccessTokenUtil.getAccessToken();
		if(accessToken!=null){
			String requestUrl = ConfigUtil.get("jsapi_ticket_url").replace("ACCESS_TOKEN", accessToken.getToken());
			logger.info("jsapi_ticket_url="+requestUrl);
			JSONObject jsonObject = HttpUtils.httpsRequest(requestUrl, "GET", null);
			logger.info("jsapi_ticket_url_jsonObject==="+jsonObject);
			if(jsonObject!=null && jsonObject.containsKey("ticket")){
				return new JSSDK(appId,appsecret,url,jsonObject.getString("ticket"));
			}
		}
		return null;
	}
}
