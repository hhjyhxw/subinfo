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

    /***
     *
     * Description:获取下一个订单序列值
     * @author zhangdehai
     * @return
     * @date 2018年2月9日上午11:42:54
     */
    public String getOrderNo();
}