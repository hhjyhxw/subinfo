package com.icloud.service.activity;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.icloud.dao.activity.ActivityOrderMapper;
import com.icloud.model.activity.ActivityOrder;
import com.icloud.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityOrderService implements BaseService<ActivityOrder> {

	@Autowired
	private ActivityOrderMapper activityOrderMapper;

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
	
	

}
