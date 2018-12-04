package com.icloud.dao.activity;

import com.icloud.model.activity.ActivityOrder;

import java.util.List;

public interface ActivityOrderMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ActivityOrder record);

    int insertSelective(ActivityOrder record);

    ActivityOrder selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ActivityOrder record);

    int updateByPrimaryKey(ActivityOrder record);

    public List<ActivityOrder> findForList(ActivityOrder record);
}