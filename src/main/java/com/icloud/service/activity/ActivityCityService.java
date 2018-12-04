package com.icloud.service.activity;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.icloud.dao.activity.ActivityCityMapper;
import com.icloud.model.activity.ActivityCity;
import com.icloud.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityCityService implements BaseService<ActivityCity> {

	@Autowired
	private ActivityCityMapper activityCityMapper;

	@Override
	public void save(ActivityCity t) throws Exception {
		// TODO Auto-generated method stub
		activityCityMapper.insert(t);
	}

	@Override
	public void update(ActivityCity t) throws Exception {
		// TODO Auto-generated method stub
		activityCityMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public List<ActivityCity> findList(ActivityCity t) throws Exception {
		// TODO Auto-generated method stub
		return activityCityMapper.findForList(t);
	}

	@Override
	public Integer findCount(ActivityCity t) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) throws Exception {
		// TODO Auto-generated method stub
		activityCityMapper.deleteByPrimaryKey(id);
	}

	@Override
	public ActivityCity findByKey(Long id) throws Exception {
		// TODO Auto-generated method stub
		return activityCityMapper.selectByPrimaryKey(id);
	}

	
	@Override
	public PageInfo<ActivityCity> findByPage(int pageNo, int pageSize,
			ActivityCity t) throws Exception {
		// TODO Auto-generated method stub
		 PageHelper.startPage(pageNo, pageSize);
		 PageInfo<ActivityCity> page = new PageInfo<ActivityCity>(activityCityMapper.findForList(t));
		 return page;
	}
	
	

}
