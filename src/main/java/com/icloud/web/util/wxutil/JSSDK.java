package com.icloud.web.util.wxutil;

import com.icloud.common.util.wx.PayUtil;

import java.util.SortedMap;
import java.util.TreeMap;

/**
 * Created by 512162086@qq.com on 2018/12/5 .
 */
public class JSSDK {

    /** 签名 */
    private String sign;
    /** 生成签名必须参数  */
    private String jsTick;
    /** 调起JS目录 用来签名  */
    private String url;

    /** 公众号id*/
    protected String appid;
    /** APPSECRET*/
    protected String appsecret;
    /**时间戳 */
    protected String timeStamp;
    /**随机字符串*/
    protected String nonceStr;
    /** 商户号ID*/
    protected String mch_id;

    public JSSDK(String appid,String appsecret,String url,String jsTick) throws Exception{


        this.appid     = appid;
        this.appsecret = appsecret;
        this.jsTick = jsTick;
        this.url = url;
        this.timeStamp = PayUtil.getTimeStamp();
        this.nonceStr  = PayUtil.getStrReq();
        this.sign      = PayUtil.createSHA1Sign(getJSApiParams(this));
    }


    /**
     *封装扫一扫签名参数
     */
    public static SortedMap<String, String> getJSApiParams(JSSDK jssdk){
        SortedMap<String, String> packageParams = new TreeMap<String, String>();
        packageParams.put("jsapi_ticket", jssdk.getJsTick());
        packageParams.put("noncestr",jssdk.getNonceStr());
        packageParams.put("timestamp",jssdk.getTimeStamp());
        packageParams.put("url", jssdk.getUrl());
        return packageParams;
    }

    public String getSign() {
        return sign;
    }

    public String getJsTick() {
        return jsTick;
    }

    public String getUrl() {
        return url;
    }

    public String getAppid() {
        return appid;
    }

    public String getAppsecret() {
        return appsecret;
    }

    public String getTimeStamp() {
        return timeStamp;
    }

    public String getNonceStr() {
        return nonceStr;
    }

    public String getMch_id() {
        return mch_id;
    }
}
