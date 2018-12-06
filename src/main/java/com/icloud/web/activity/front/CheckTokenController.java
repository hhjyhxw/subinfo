package com.icloud.web.activity.front;

import com.icloud.web.AppBaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 512162086@qq.com on 2018/11/1 .
 * 防表单重提交，token验证
 */
@Controller
@RequestMapping(value = "${frontPath}/checkToken")
public class CheckTokenController extends AppBaseController {

    @RequestMapping("/removeToken")
    public String removeToken(HttpServletRequest request, HttpServletResponse response){
        Map<String, String> jsonMap = new HashMap<String, String>();
        jsonMap.put(STATUS, SUCCESS);
        return pakageJsonp(jsonMap);
    }

}
