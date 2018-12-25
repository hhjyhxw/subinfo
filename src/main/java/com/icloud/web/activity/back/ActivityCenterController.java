package com.icloud.web.activity.back;

/**
 * Created by 512162086@qq.com on 2018/12/4 .
 */

import com.icloud.model.activity.ActivityCity;
import com.icloud.model.activity.ActivityOrder;
import com.icloud.service.activity.ActivityCityService;
import com.icloud.service.activity.ActivityOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

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
    @Autowired
    private ActivityCityService activityCityService;

    public static List<ActivityCity> cityList = null;

    static {

    }
    /**
     * 活动中心页面
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/activityCenterIndex")
    public String list(HttpServletRequest request)
            throws Exception {
        cityList = activityCityService.findList(new ActivityCity());
        return "activity/back/activity_center_index";
    }

    /**
     * 获取图标数据
     * @return
     */
    @RequestMapping("/getData")
    @ResponseBody
    public Object getData(){
        try {
           List<ActivityOrder> orderList = activityOrderService.findList(new ActivityOrder());
           Map<String,Object> dataMap = getDataMap(orderList);
            return dataMap;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private Map<String,Object> getDataMap(List<ActivityOrder> orderList) {

            Map<String,Object> map = new HashMap<String,Object>();
            //滚动列表数据
            map.put("orderList",orderList);
            //总金额
            double totalMount = 0d;
            //每个城市的总金额
            Map<Long,CityAmountData> cityAmountDataMap = new HashMap<Long,CityAmountData>();

            for (int i = 0; i <cityList.size() ; i++) {
                ActivityCity city = cityList.get(i);

                CityAmountData cityAmountData = new CityAmountData();
                cityAmountData = new CityAmountData();
                cityAmountData.setAmount(0d);
                cityAmountData.setCityId(city.getId());
                cityAmountData.setCityName(city.getName());
                cityAmountDataMap.put(city.getId(),cityAmountData);
            }
        if(orderList!=null && orderList.size()>0) {
            for (int i = 0; i < orderList.size(); i++) {
                ActivityOrder order = orderList.get(i);
                totalMount += order.getAmout().doubleValue();
                CityAmountData cityAmountData = cityAmountDataMap.get(order.getCityId());
                if (cityAmountData == null) {
                    cityAmountData = new CityAmountData();
                    cityAmountData.setAmount(order.getAmout());
                    cityAmountData.setCityId(order.getCityId());
                    cityAmountData.setCityName(order.getCityName());
                } else {
                    cityAmountData.setCityId(order.getCityId());
                    cityAmountData.setAmount(cityAmountData.getAmount().doubleValue() + order.getAmout().doubleValue());
                }
                cityAmountDataMap.put(order.getCityId(), cityAmountData);
            }
        }
            //cityAmountDataMap 转成List
            List<CityAmountData> cityAmountList = new ArrayList<CityAmountData>();
            Iterator it = cityAmountDataMap.keySet().iterator();
            while (it.hasNext()) {
                Long key = new Long(it.next().toString());
                CityAmountData citydata = cityAmountDataMap.get(key);
                citydata.setAmoutHeight(saveTwoPoit(citydata.getAmount()/12));
                if(citydata.getAmoutHeight()>100){
                    citydata.setAmoutHeight(100);
                }
                cityAmountList.add(citydata);
            }


            CityAmountData totalCityAmount = new CityAmountData();
            totalCityAmount.setAmount(totalMount);
            totalCityAmount.setAmoutHeight(saveTwoPoit(totalMount/30));
            totalCityAmount.setAmoutHeight(totalCityAmount.getAmoutHeight()>100?100:totalCityAmount.getAmoutHeight());
            totalCityAmount.setAmoutHeight(saveTwoPoit(totalCityAmount.getAmoutHeight()));
            map.put("totalCityAmount",totalCityAmount);
            map.put("cityAmountList",cityAmountList);
            return map;
    }

    public double saveTwoPoit(double amount) {
      BigDecimal bg = new BigDecimal(amount);
      double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
      return f1;
   }
}
