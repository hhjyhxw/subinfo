package com.icloud.dao.activity;

import com.icloud.model.activity.ActivityUser;

import java.util.List;

public interface ActivityUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ActivityUser record);

    int insertSelective(ActivityUser record);

    ActivityUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ActivityUser record);

    int updateByPrimaryKey(ActivityUser record);

    public List<ActivityUser> findForList(ActivityUser record);
}