package com.mr.mapper;

import com.mr.pojo.User;

import java.util.List;

public interface UserMapper {

    List<User> queryAll();

    void addUser(User user);

    void delUserById(Integer id);

    void updateUser(User user);
}
