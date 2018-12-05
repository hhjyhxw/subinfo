package com.icloud.service.activity;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.icloud.dao.activity.ActivityCityMapper;
import com.icloud.dao.activity.ActivityOrderMapper;
import com.icloud.model.activity.ActivityCity;
import com.icloud.model.activity.ActivityOrder;
import com.icloud.service.BaseService;
import com.icloud.web.util.OrderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ActivityOrderService implements BaseService<ActivityOrder> {

	@Autowired
	private ActivityOrderMapper activityOrderMapper;
	@Autowired
	private ActivityCityMapper activityCityMapper;

	@Override
	public void save(ActivityOrder t) throws Exception {
		// TODO Auto-generated method stub
		activityOrderMapper.insert(t);
	}

	@Override
	public void update(ActivityOrder t) throws Exception {
		// TODO Auto-generated method stub
		activityOrderMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public List<ActivityOrder> findList(ActivityOrder t) throws Exception {
		// TODO Auto-generated method stub
		return activityOrderMapper.findForList(t);
	}

	@Override
	public Integer findCount(ActivityOrder t) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) throws Exception {
		// TODO Auto-generated method stub
		activityOrderMapper.deleteByPrimaryKey(id);
	}

	@Override
	public ActivityOrder findByKey(Long id) throws Exception {
		// TODO Auto-generated method stub
		return activityOrderMapper.selectByPrimaryKey(id);
	}

	
	@Override
	public PageInfo<ActivityOrder> findByPage(int pageNo, int pageSize,
			ActivityOrder t) throws Exception {
		// TODO Auto-generated method stub
		 PageHelper.startPage(pageNo, pageSize);
		 PageInfo<ActivityOrder> page = new PageInfo<ActivityOrder>(activityOrderMapper.findForList(t));
		 return page;
	}


	@Transactional
	public JSONObject save(String realName, String cityId, String cityName, String amout) {
		JSONObject json = new JSONObject();
		ActivityCity city = activityCityMapper.selectByPrimaryKey(Long.parseLong(cityId));
		if(city==null){
			json.put("status","error");
			json.put("message","cityId="+cityId+"不在指定城市");
			return json;
		}
		if(!city.getName().trim().equals(cityName.trim())){
			json.put("status","error");
			json.put("message",cityName+"不等于"+city.getName());
			return json;
		}
		ActivityOrder order = new ActivityOrder();
		order.setCityName(city.getName());
		order.setCityId(Long.parseLong(cityId));
		order.setRealName(realName);
		List<ActivityOrder> orderList = activityOrderMapper.findForList(order);
		if(orderList!=null && orderList.size()>0){
			json.put("status","error");
			json.put("show","1");
			json.put("message","已提交，不需要再次提交");
			return json;
		}
		order.setAmout(Double.parseDouble(amout));
		synchronized (ActivityOrderService.class){
			String lastNo = activityOrderMapper.getOrderNo();
			order.setOrderNo(OrderUtil.bulidOrderNo(lastNo));
			order.setCreateTime(new Date());
			activityOrderMapper.insert(order);
		}
		json.put("status","success");
		json.put("message","提交成功");
		return json;
	}
}
