package com.mr.service;

import com.mr.pojo.User;

import java.util.List;

public interface UserService {

    List<User> queryAll();

    void addUser(User user);

    void delUserById(Integer id);

    void updateUser(User user);
}
