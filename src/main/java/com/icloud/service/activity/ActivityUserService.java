package com.icloud.service.activity;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.icloud.dao.activity.ActivityUserMapper;
import com.icloud.model.activity.ActivityUser;
import com.icloud.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityUserService implements BaseService<ActivityUser> {

	@Autowired
	private ActivityUserMapper activityOrderMapper;

	@Override
	public void save(ActivityUser t) throws Exception {
		// TODO Auto-generated method stub
		activityOrderMapper.insert(t);
	}

	@Override
	public void update(ActivityUser t) throws Exception {
		// TODO Auto-generated method stub
		activityOrderMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public List<ActivityUser> findList(ActivityUser t) throws Exception {
		// TODO Auto-generated method stub
		return activityOrderMapper.findForList(t);
	}

	@Override
	public Integer findCount(ActivityUser t) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) throws Exception {
		// TODO Auto-generated method stub
		activityOrderMapper.deleteByPrimaryKey(id);
	}

	@Override
	public ActivityUser findByKey(Long id) throws Exception {
		// TODO Auto-generated method stub
		return activityOrderMapper.selectByPrimaryKey(id);
	}

	
	@Override
	public PageInfo<ActivityUser> findByPage(int pageNo, int pageSize,
			ActivityUser t) throws Exception {
		// TODO Auto-generated method stub
		 PageHelper.startPage(pageNo, pageSize);
		 PageInfo<ActivityUser> page = new PageInfo<ActivityUser>(activityOrderMapper.findForList(t));
		 return page;
	}
	
	

}
