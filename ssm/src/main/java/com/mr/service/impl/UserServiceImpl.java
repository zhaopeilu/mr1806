package com.mr.service.impl;

import com.mr.mapper.UserMapper;
import com.mr.pojo.User;
import com.mr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> queryAll() {
        return userMapper.queryAll();
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void delUserById(Integer id) {
        userMapper.delUserById(id);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }


}
