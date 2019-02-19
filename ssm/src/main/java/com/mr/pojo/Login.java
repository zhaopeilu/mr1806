package com.mr.pojo;

public class Login {
    private Integer loginId;
    private String loginName;
    private String loginPaw;
    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPaw() {
        return loginPaw;
    }

    public void setLoginPaw(String loginPaw) {
        this.loginPaw = loginPaw;
    }

    @Override
    public String toString() {
        return "Login{" +
                "loginId=" + loginId +
                ", loginName='" + loginName + '\'' +
                ", loginPaw='" + loginPaw + '\'' +
                '}';
    }
}
