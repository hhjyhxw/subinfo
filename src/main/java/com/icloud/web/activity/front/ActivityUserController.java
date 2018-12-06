package com.icloud.web.activity.front;

/**
 * Created by 512162086@qq.com on 2018/12/4 .
 */

import com.alibaba.fastjson.JSONObject;
import com.icloud.common.ConfigUtil;
import com.icloud.common.util.StringUtil;
import com.icloud.service.activity.ActivityOrderService;
import com.icloud.web.util.wxutil.JsTickUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 类名称: ActivityUserController
 * 类描述: 用户信息录入
 * 创建人: zhangdehai
 * 创建时间:2018年7月9日 上午9:54:17
 */
@Controller
@RequestMapping(value = "${frontPath}/activityUser")
public class ActivityUserController {

    public final static Logger logger = LoggerFactory.getLogger(ActivityUserController.class);
    @Autowired
    private ActivityOrderService activityOrderService;
    /**
     * 扫码进入填写信息的页面
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/userIndex")
    public String list(HttpServletRequest request) {
        try {
            request.setAttribute("clientToken",  request.getSession().getAttribute("payToken"));
            request.setAttribute("jssdk", JsTickUtil.getJSSDK(ConfigUtil.get("appid"),ConfigUtil.get("appsecret"),getRequestURL(request)));
        }catch (Exception e){
            e.printStackTrace();
        }
        return "activity/front/user_index";
    }

    /**
     * 提交订单信息
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/subOrder")
    @ResponseBody
    public JSONObject subOrder(HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        try {
            String realName = request.getParameter("realName");
            String cityId = request.getParameter("cityId");
            String cityName = request.getParameter("cityName");
            String amout = request.getParameter("amout");
            if(!StringUtil.checkObj(realName) || !StringUtil.checkObj(cityId)
                    || !StringUtil.checkObj(cityName) || !StringUtil.checkObj(amout)){
                json.put("status","error");
                json.put("message","请输入正确信息");
                return json;
            }
            if(!isNum(amout)){
                logger.info("amout参数非数字");
                json.put("status","error");
                json.put("message","参数非法");
                return json;
            }
            if(!isNum(cityId)){
                logger.info("cityId参数非数字");
                json.put("status","error");
                json.put("message","参数非法");
                return json;
            }
            json = activityOrderService.save(realName,cityId,cityName,amout);
            logger.info(json.toJSONString());
            return json;
        }catch (Exception e){
            e.printStackTrace();
            logger.info("异常："+e.getMessage());
            json.put("status","error");
            json.put("message","系统异常");
            return json;
        }

    }

    /**
     * 存数字校验
     * @param str
     * @return
     */
    public static boolean isNum(String str) {
        String regex = "^[0-9]*$";
        if(str.matches(regex)){
            return true;
        }
        return false;
    }



    // 获取当前请求的全路径
    public String getRequestURL(HttpServletRequest request){
        StringBuffer sburl = new StringBuffer();
        sburl.append(request.getScheme()+"://");
        sburl.append(request.getHeader("host"));
        sburl.append(request.getRequestURI());
        if(request.getQueryString()!=null) //判断请求参数是否为空
            sburl.append("?"+request.getQueryString());   // 参数
        return sburl.toString();
    }
}


