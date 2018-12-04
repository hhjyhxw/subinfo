/**
 * @author
 * @version
 * 2018年7月26日 上午11:04:13
 */
package com.icloud.web.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icloud.common.RandomValidateCodeUtil;
import com.icloud.common.ResponseUtils;

/**
 * 类名称: VeryCodeController
 * 类描述: 
 * 创建人: zhangdehai
 * 创建时间:2018年7月26日 上午11:04:13
 */
@Controller
@RequestMapping(value = "/veryCode")
public class VeryCodeController {
	

    private static final Logger logger = LoggerFactory.getLogger(VeryCodeController.class);
	/**
	 * 生成验证码
	 */
	@RequestMapping(value = "/getVerify")
	public void getVerify(HttpServletRequest request, HttpServletResponse response) {
	    try {
	        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
	        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
	        response.setHeader("Cache-Control", "no-cache");
	        response.setDateHeader("Expire", 0);
	        RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
	        randomValidateCode.getRandcode(request, response);//输出验证码图片方法
	    } catch (Exception e) {
	        logger.error("获取验证码失败>>>>   ", e);
	    }
	}
	
	
	/**
	 * 忘记密码页面校验验证码
	 */
	@RequestMapping(value = "/checkVerify", method = RequestMethod.POST, headers = "Accept=application/json")
	public String checkVerify(@RequestBody Map<String, Object> requestMap, HttpSession session,HttpServletResponse response) {
	    try{
	        //从session中获取随机数
	        String inputStr = requestMap.get("inputStr").toString();
	        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
	        if (random == null) {
	        	ResponseUtils.renderText(response, "0001");
	        }
	        if (random.equals(inputStr)) {
	        	ResponseUtils.renderText(response, "0000");
	        } else {
	        	ResponseUtils.renderText(response, "0001");
	        }
	    }catch (Exception e){
	        logger.error("验证码校验失败", e);
	        ResponseUtils.renderText(response, "0001");
	    }
	    return null;
	}

}
