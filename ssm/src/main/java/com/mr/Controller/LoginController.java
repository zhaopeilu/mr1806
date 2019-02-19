package com.mr.Controller;

import com.mr.pojo.Login;
import com.mr.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;


@Controller
@RequestMapping(value = "login")
public class LoginController {
    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "queryLogin")
    @ResponseBody
    public Map<String ,Object> queryLogin(Login login, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("login", login.getLoginName());
        login.getLoginName();
        Map<String ,Object> map=loginService.queryLogin(login);
        return map;
    }
}
