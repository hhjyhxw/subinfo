package com.icloud.web.activity.back;

/**
 * Created by 512162086@qq.com on 2018/12/4 .
 */

import com.alibaba.fastjson.JSONObject;
import com.icloud.model.activity.ActivityOrder;
import com.icloud.service.activity.ActivityOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 类名称: ActivityCenterController
 * 类描述: 活动中心
 * 创建人: zhangdehai
 * 创建时间:2018年7月9日 上午9:54:17
 */
@Controller
@RequestMapping(value = "${backPath}/activityCenter")
public class ActivityCenterController {

    @Autowired
    private ActivityOrderService activityOrderService;
    /**
     * 活动中心页面
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/activityCenterIndex")
    public String list(HttpServletRequest request)
            throws Exception {
        return "activity/back/activity_center_index";
    }

    /**
     * 获取图标数据
     * @return
     */
    public JSONObject getData(){
        try {
           List<ActivityOrder> orderList = activityOrderService.findList(new ActivityOrder());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
