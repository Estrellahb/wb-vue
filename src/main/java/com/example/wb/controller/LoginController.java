package com.example.wb.controller;

import com.example.wb.pojo.User;
import com.example.wb.result.Result;
import com.example.wb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @CrossOrigin
    @PostMapping(value = "/api/login")
    @ResponseBody
    public Result login(@RequestBody User requestUser,HttpSession session){
        // 对 html 标签进行转义，防止 XSS 攻击
        // 在这段代码中，防止 XSS 攻击的措施是通过对用户输入的用户名进行 HTML 转义来实现的，使用了 HtmlUtils.htmlEscape() 方法。这个方法会将用户输入的内容中的 HTML 特殊字符进行转义，例如将 < 转义为 &lt;，> 转义为 &gt;，以及其他一些特殊字符的转义，从而防止这些字符被当做 HTML 标签来解析和执行。
        String username = requestUser.getUsername();
        username = HtmlUtils.htmlEscape(username);

        User user = userService.get(username, requestUser.getPassword());
        if (null == user) {
            return new Result(400);
        } else {
            session.setAttribute("user", user);
            return new Result(200);
        }
    }

}
