package com.icloud.model.bms;

import java.util.Date;

/**
 * Created by 512162086@qq.com on 2018/10/8 .
 */
public class BmsLogs {

    private Long id;
    private String userName;//访问用户
    private Date createTime;//访问时间
    private String visitMethod;//访问方法
    private String visitUri;//访问方法
    private String visitIp;//ip
    private String visitParams;//访问参数


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getVisitMethod() {
        return visitMethod;
    }

    public void setVisitMethod(String visitMethod) {
        this.visitMethod = visitMethod;
    }

    public String getVisitIp() {
        return visitIp;
    }

    public void setVisitIp(String visitIp) {
        this.visitIp = visitIp;
    }

    public String getVisitParams() {
        return visitParams;
    }

    public void setVisitParams(String visitParams) {
        this.visitParams = visitParams;
    }

    public String getVisitUri() {
        return visitUri;
    }

    public void setVisitUri(String visitUri) {
        this.visitUri = visitUri;
    }
}
