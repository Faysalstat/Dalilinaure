/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.controller;

import com.marriage.service.ConfirmationTokenService;
import com.marriage.service.EmailSenderService;
import com.marriage.service.PersonService;
import com.marriage.service.UserService;
import model.Passwordresettoken;
import model.Person;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Faysal
 */
@Controller
public class UserControl {

    @Autowired
    UserService userService;
    @Autowired
    PersonService personService;
    @Autowired
    ConfirmationTokenService confirmationTokenService;
    @Autowired
    EmailSenderService emailSenderService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("adduser")
    public ModelAndView saveUser(@ModelAttribute("user") User user, ModelAndView model) {
        try {
            String encodedpass = passwordEncoder.encode(user.getPassword());
            user.setPassword(encodedpass);
            user = userService.saveUser(user);
            Person person = new Person();
            person.setUser(user);
            person.setBioapproval("false");
            person.setImageapproval("false");
            person = personService.saveAllPerson(person);
            model.addObject("person", person);
            model.setViewName("editprofile");
        } catch (Exception e) {
            model.addObject("warning", "Username Exits, Try another!");
            model.setViewName("signup/userregistration");
        } finally {
            model.addObject("user", user);
        }
        return model;
    }

    @RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
    public ModelAndView displayResetPassword(ModelAndView modelAndView) {
        modelAndView.setViewName("forgotPassword");
        return modelAndView;
    }

    // Receive the address and send an email
    @RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
    public ModelAndView forgotUserPassword(ModelAndView modelAndView,@ModelAttribute("user") User user) {
        User existingUser = userService.findByEmailIdAndUserNameIgnoreCase(user.getEmail(),user.getUsername());
        if (existingUser != null) {
            // Create token
            Passwordresettoken confirmationToken = new Passwordresettoken();
            confirmationToken.setUser(existingUser);
            // Save it
            confirmationTokenService.saveToken(confirmationToken);
            // Create the email
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(existingUser.getEmail());
            mailMessage.setSubject("Complete Password Reset!");
            mailMessage.setFrom("information@dalilinaure.com");

//            Here the URL need to be change while deploying
            mailMessage.setText("To complete the password reset process, please click here: "
                    + "http://dalilinaure.com/confirm-reset?token=" + confirmationToken.getToken());

            // Send the email
            emailSenderService.sendEmail(mailMessage);

            modelAndView.addObject("message", "Request to reset password received. Check your inbox for the reset link.");
            modelAndView.setViewName("successForgotPassword");

        } else {
            modelAndView.addObject("message", "This User and email address does not match!");
            modelAndView.setViewName("forgetpassworderror");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/confirm-reset", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView validateResetToken(ModelAndView modelAndView, @RequestParam("token") String confirmationToken) {
        Passwordresettoken token = confirmationTokenService.findByConfirmationToken(confirmationToken);

        if (token != null) {
            User user = userService.findByEmailIdIgnoreCase(token.getUser().getEmail());
            modelAndView.addObject("user", user);
            modelAndView.addObject("emailId", user.getEmail());
            modelAndView.setViewName("resetPassword");
        } else {
            modelAndView.addObject("message", "The link is invalid or broken!");
            modelAndView.setViewName("error");
        }
        return modelAndView;
    }

    // Endpoint to update a user's password
    @RequestMapping(value = "/reset-password", method = RequestMethod.POST)
    public ModelAndView resetUserPassword(ModelAndView modelAndView, User user) {
        if (user.getUsername() != null) {
            // Use email to find user
            User tokenUser = userService.findbyUsername(user.getUsername());
            String encodedpass = passwordEncoder.encode(user.getPassword());
            tokenUser.setPassword(encodedpass);
//            tokenUser.setPassword(user.getPassword());
            userService.updateUser(tokenUser);
            modelAndView.addObject("message", "Password successfully reset. You can now log in with the new credentials.");
            modelAndView.setViewName("successResetPassword");
        } else {
            modelAndView.addObject("message", "The link is invalid or broken!");
            modelAndView.setViewName("error");
        }
        return modelAndView;
    }
}
