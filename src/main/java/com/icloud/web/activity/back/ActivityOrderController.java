package com.icloud.web.activity.back;

/**
 * Created by 512162086@qq.com on 2018/12/4 .
 */

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.icloud.common.DateTools;
import com.icloud.common.FreeMarkerConfig;
import com.icloud.model.activity.ActivityOrder;
import com.icloud.service.activity.ActivityOrderService;
import com.icloud.web.BaseIdLongController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    FreeMarkerConfig freeMarkerConfig;
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



    /**
     * 获取 订单列表
     * @param request
     * @return
     */
    @RequestMapping("/downLoadOrderlist")
    public void downLoadOrderlist(HttpServletRequest request,HttpServletResponse resp, ActivityOrder t)
            throws Exception {
        String message = "";
        String templateName = "orderListExcel.ftl";

        PageInfo<ActivityOrder> pageInfo = activityOrderService.findByPage(1, 1000, t);
        log.warn("查询结果：" + pageInfo.toString());

        List<ActivityOrder> orderList = pageInfo.getList();
        Map<String, Object> dataMap = new HashMap<String, Object>();
        dataMap.put("orderList",orderList);
        dataMap.put("sheetSize", orderList!=null?orderList.size():0);
//
        File file = null;
        InputStream fin = null;
        ServletOutputStream out = null;
        String fileType = "excel";
        String fileName = DateTools.date2Str(new Date(),"yyyy-MM-dd HH:mm:ss")
                + "_orderListExcel";
        try {
            // 调用工具类WordGenerator的createDoc方法生成Word文档
            file = freeMarkerConfig.createDoc(dataMap, fileName,templateName, fileType);
            fin = new FileInputStream(file);
            resp.setCharacterEncoding("utf-8");
            resp.setContentType("application/msexcel");
            // 设置浏览器以下载的方式处理该文件默认名为resume.doc
            resp.addHeader("Content-Disposition", "attachment;filename="+ fileName + ".xls");

            out = resp.getOutputStream();
            byte[] buffer = new byte[512]; // 缓冲区
            int bytesToRead = -1;
            // 通过循环将读入的Word文件的内容输出到浏览器中
            while ((bytesToRead = fin.read(buffer)) != -1) {
                out.write(buffer, 0, bytesToRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "下载失败!";
            out.write(message.getBytes());
        } finally {
            if (fin != null)
                try {
                    fin.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (out != null)
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (file != null)
                file.delete();
        }
    }
}
