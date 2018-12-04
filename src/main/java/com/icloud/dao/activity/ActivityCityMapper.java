package com.icloud.dao.activity;

import com.icloud.model.activity.ActivityCity;

import java.util.List;

public interface ActivityCityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ActivityCity record);

    int insertSelective(ActivityCity record);

    ActivityCity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ActivityCity record);

    int updateByPrimaryKey(ActivityCity record);

    public List<ActivityCity> findForList(ActivityCity record);
}