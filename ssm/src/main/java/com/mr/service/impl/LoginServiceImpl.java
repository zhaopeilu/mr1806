package com.mr.service.impl;

import com.mr.mapper.LoginMapper;
import com.mr.pojo.Login;
import com.mr.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService{
    @Autowired
    private LoginMapper loginMapper;

    @Override
    public Map<String, Object> queryLogin(Login login) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",1);
        map.put("msg","账号不存在");
        //去数据查询用户名是否存在
        Login loginName= loginMapper.queryLogin(login);
        //如果用户不为空，表示用户存在
        if(loginName!=null){
            map.put("code",2);
            map.put("msg","密码错误");
            if(loginName.getLoginPaw().equals(login.getLoginPaw())){
                map.put("code",3);
                map.put("msg","登录成功");
            }
        }
        return map;
    }
}
