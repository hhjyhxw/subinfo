package com.icloud.web.activity.back;

/**
 * Created by 512162086@qq.com on 2018/12/4 .
 */

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.icloud.common.DateTools;
import com.icloud.model.activity.ActivityOrder;
import com.icloud.service.activity.ActivityOrderService;
import com.icloud.web.BaseIdLongController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 类名称: ActivityOrderController
 * 类描述: 订单列表
 * 创建人: zhangdehai
 * 创建时间:2018年7月9日 上午9:54:17
 */
@Controller
@RequestMapping(value = "${backPath}/activityOrder")
public class ActivityOrderController  extends BaseIdLongController<ActivityOrder> {

    @Autowired
    private ActivityOrderService activityOrderService;

    @RequestMapping("/list")
    @Override
    public String list(HttpServletRequest request, ActivityOrder t) throws Exception {
        PageInfo<ActivityOrder> page = activityOrderService.findByPage(1, 10, t);
        request.setAttribute("page", page);
        request.setAttribute("record", t);
        return "activity/back/activity_order_list";
    }


    @RequestMapping("/getList")
    @ResponseBody
    @Override
    public JSONObject getList(HttpServletRequest request, HttpServletResponse response, ActivityOrder t) throws Exception {

        PageInfo<ActivityOrder> page = activityOrderService.findByPage(t.getPageNo(),t.getPageSize(), t);
        List<ActivityOrder> list = page.getList();
        JSONObject json = new JSONObject();
        json.put("pages",page.getPages());
        JSONArray array = new JSONArray();
        for(ActivityOrder s:list){
            JSONObject sub = new JSONObject();
            sub.put("id",s.getId());
            sub.put("orderNo",s.getOrderNo());
            sub.put("openid",s.getOpenid());
            sub.put("cityName", s.getCityName());
            sub.put("amout", s.getAmout());
            sub.put("createTime",DateTools.date2Str(s.getCreateTime(), "yyyy-MM-dd HH:mm:ss"));
            sub.put("realName",s.getRealName());
            array.add(sub);
        }
        json.put("list", array);
        return json;
    }

    @Override
    public String toinput(Long id, HttpServletRequest request) throws Exception {
        return null;
    }

    @Override
    public JSONObject input(HttpServletRequest request, HttpServletResponse response, ActivityOrder activityOrder) throws Exception {
        return null;
    }

    @Override
    public String del(Long id, HttpServletResponse response) throws Exception {
        return null;
    }
}
