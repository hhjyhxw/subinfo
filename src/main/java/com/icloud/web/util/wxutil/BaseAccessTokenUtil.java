package com.icloud.web.util.wxutil;//package com.icloud.common.util.wx;

import com.alibaba.fastjson.JSONObject;
import com.icloud.common.ConfigUtil;
import com.icloud.web.util.HttpUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * 获取基础accessToken
 * @author z
 *
 */
public class BaseAccessTokenUtil {

	private static Logger logger = LoggerFactory.getLogger(BaseAccessTokenUtil.class);

	/**
	 * 用于存放
	 */
	private static final Map<String,BaseAccessToken> acessTokenMap = new HashMap<String,BaseAccessToken>();

	public static synchronized  BaseAccessToken getAccessToken(){
		/*1、先从缓存取*/
		BaseAccessToken accessToken = acessTokenMap.get("baseAccessToken");
		if(accessToken!=null){
			if(accessToken.isValid(System.currentTimeMillis())){
				return accessToken;
			}else{
				//刷新
				String requestUrl = ConfigUtil.get("access_token_url").replace("APPID", ConfigUtil.get("appid")).replace("APPSECRET",ConfigUtil.get("appsecret"));
				JSONObject jsonObject = HttpUtils.httpsRequest(requestUrl, "GET", null);
				// 如果请求成功
				if (null != jsonObject) {
					try {
						accessToken = new BaseAccessToken();
						accessToken.setToken(jsonObject.getString("access_token"));
						accessToken.setExpiresIn(jsonObject.getInteger("expires_in"));
						accessToken.setCreateTime(System.currentTimeMillis());
						acessTokenMap.put("baseAccessToken",accessToken);
						return accessToken;
					} catch (Exception e) {
						accessToken = null;
						//刷新token失败
						logger.error("刷新token失败 errcode:{"+jsonObject.getInteger("errcode")+"} errmsg:{"+jsonObject.getString("errmsg")+"}" );
					}
				}
				return null;
			}
		}else{
			/*2、重新请求*/
			String requestUrl = ConfigUtil.get("access_token_url").replace("APPID", ConfigUtil.get("appid")).replace("APPSECRET",ConfigUtil.get("appsecret"));

			JSONObject jsonObject = HttpUtils.httpsRequest(requestUrl, "GET", null);
			// 如果请求成功
			if (null != jsonObject) {
				try {
					accessToken = new BaseAccessToken();
					accessToken.setToken(jsonObject.getString("access_token"));
					accessToken.setExpiresIn(jsonObject.getInteger("expires_in"));
					accessToken.setCreateTime(System.currentTimeMillis());
					acessTokenMap.put("baseAccessToken",accessToken);
					return accessToken;
				} catch (Exception e) {
					accessToken = null;
					// 获取token失败
					logger.error("获取token失败 errcode:{"+jsonObject.getInteger("errcode")+"} errmsg:{"+jsonObject.getString("errmsg")+"}" );
				}
			}
			return null;
		}
	}

	
}


