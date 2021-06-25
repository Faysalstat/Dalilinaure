/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.controller;

import com.marriage.service.FriendService;
import com.marriage.service.MailService;
import com.marriage.service.PersonService;
import com.marriage.service.UserService;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.Friendlist;
import model.Mail;
import model.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Faysal
 */
@Controller
public class PersonController {

    @Autowired
    PersonService personService;

    @Autowired
    UserService userService;

    @Autowired
    FriendService friendService;

    @Autowired
    MailService mailService;

    @PostMapping("updateprofile")
    @CrossOrigin(origins = "*")
    public ModelAndView addProfile(@ModelAttribute("person") Person person, ModelAndView model) {
        Person previousperson = personService.findbyid(person.getId());
        person.setUser(previousperson.getUser());
        if (person.getDob() != null) {
            int age = personService.calculateAge(person.getDob());
            person.setAge(age);
        }
        Person updatedperson = personService.UpdatePerson(person);
        List<Friendlist> myfriends = friendService.getList(updatedperson.getId());
        model.addObject("user", updatedperson.getUser());
        model.addObject("person", updatedperson);
        model.addObject("myfriends", myfriends);
        model.setViewName("profile");
        return model;
    }

    @PostMapping("sendmail")
    @CrossOrigin(origins = "*")
    public ModelAndView sendMail(@ModelAttribute("mail") Mail mail, ModelAndView model, HttpSession httpSession) {
        Person userperson = (Person) httpSession.getAttribute("person");
        mail.setPerson(userperson);
        mailService.sendMail(mail);
        model.setViewName("contactus");
        return model;
    }

}
