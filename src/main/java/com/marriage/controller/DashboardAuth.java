/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.controller;

import com.marriage.service.UserService;
import javax.servlet.http.HttpSession;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Faysal
 */
@Controller
@RequestMapping("/admin")
public class DashboardAuth {

    @Autowired
    UserService userService;

//    encoder.matches();
    @PostMapping("/login")
    public ModelAndView authAdmin(@ModelAttribute("user") User user, ModelAndView model, HttpSession httpSession) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        User userauth = userService.findbyUsername(user.getUsername());
        if (encoder.matches(user.getPassword(), userauth.getPassword())) {
            httpSession.setAttribute("admin", userauth);
            model.setViewName("admin/redirect");
        } else {
            model.setViewName("admin/admin-login");
        }

        return model;
    }

    @GetMapping("/login")
    public String loginpage() {
        return "admin/admin-login";
    }
    @GetMapping("/logout")
    public String logoutpage( HttpSession httpSession) {
        httpSession.invalidate();
        return "admin/admin-login";
    }

}
