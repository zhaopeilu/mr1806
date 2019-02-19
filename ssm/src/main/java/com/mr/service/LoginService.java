package com.mr.service;

import com.mr.pojo.Login;

import java.util.Map;

/**
 * Created by 小路 on 2019/2/18.
 */
public interface LoginService {
    Map<String, Object> queryLogin(Login login);
}
