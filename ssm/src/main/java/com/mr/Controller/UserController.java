package com.mr.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mr.pojo.User;
import com.mr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 查询所有数据
     * @return
     */
    @RequestMapping(value = "queryAll")
    @ResponseBody
    public Map<String, Object> queryAll(Integer page,Integer rows){
        PageHelper helper = new PageHelper();
        helper.startPage(page,rows);
        List<User> list=userService.queryAll();
        PageInfo<User> pageInfo = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }

    /**
     * 新增数据
     */
    @RequestMapping(value = "addUser")
    @ResponseBody
    public void addUser(User user){
        userService.addUser(user);
    }

    /**
     * 刪除用戶信息
     */
    @RequestMapping(value = "delectUser")
    @ResponseBody
    public void delUserById(Integer id){
        userService.delUserById(id);
    }

    /**
     * 修改用户数据
     * @param user
     */
    @RequestMapping(value = "updateUser")
    @ResponseBody
    public void updateUser(User user){
        userService.updateUser(user);
    }

}
