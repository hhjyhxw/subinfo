package com.icloud.web.activity.back;

/**
 * Created by 512162086@qq.com on 2018/12/5 .
 */
public class CityAmountData {
    private Long cityId;//城市id
    private Double amount;//金额
    private String cityName;//城市名称
    private double amoutHeight;//柱状图高度占比 最大值为1000 万

    public Long getCityId() {
        return cityId;
    }

    public void setCityId(Long cityId) {
        this.cityId = cityId;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public double getAmoutHeight() {
        return amoutHeight;
    }

    public void setAmoutHeight(double amoutHeight) {
        this.amoutHeight = amoutHeight;
    }
}
