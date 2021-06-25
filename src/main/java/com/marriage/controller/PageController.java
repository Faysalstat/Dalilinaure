/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.controller;

import com.marriage.service.FriendService;
import com.marriage.service.Inboxservice;
import com.marriage.service.NotificationService;
import com.marriage.service.PersonService;
import com.marriage.service.StoriesService;
import com.marriage.service.UserService;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.Friendlist;
import model.Inbox;
import model.Notification;
import model.Person;
import model.SearchModel;
import model.Stories;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

    @Autowired
    PersonService personService;

    @Autowired
    UserService userService;

    @Autowired
    FriendService friendService;

    @Autowired
    Inboxservice inboxservice;

    @Autowired
    NotificationService notificationService;
    @Autowired
    private StoriesService storiesService;

    @GetMapping("home")
    public ModelAndView hompage(Authentication authentication, ModelAndView model, HttpSession httpSession) {
        String name = authentication.getName();
        User user = userService.findbyUsername(name);
        Person person = personService.findbyUserid(user.getId());
        List<Inbox> inboxlist = inboxservice.findinboxbyUserId(person.getId());
        List<Notification> notifications = notificationService.getNotificationListByUserId(person.getId());
        List<Person> latestpersonlist = personService.findlatest(user.getId());
        List<Friendlist> friendrequestlist = friendService.getFriendRequestList(person.getId());
        httpSession.setAttribute("person", person);
        model.addObject("userperson", person);
        model.addObject("inboxlist", inboxlist);
        model.addObject("notifications", notifications);
        model.addObject("latestpersonlist", latestpersonlist);
        model.addObject("friendrequestlist", friendrequestlist);
        model.setViewName("home");
        return model;
    }

    @GetMapping("/chatpage/{id}")
    public ModelAndView gotochat(@PathVariable("id") Integer id, HttpSession httpSession, ModelAndView model) {
        Person person = personService.findbyid(id);
        Person userperson = (Person) httpSession.getAttribute("person");
        Friendlist friendship = friendService.getFriendship(userperson.getId(), person.getId());
        List<Friendlist> friendlist = friendService.getList(userperson.getId());
        model.addObject("friendlist", friendlist);
        model.addObject("friendship", friendship);
        model.setViewName("chatpage");
        return model;
    }

    @GetMapping("/profile")
    public ModelAndView gotoProfile(Authentication authentication, ModelAndView model) {
        String name = authentication.getName();
        User user = userService.findbyUsername(name);
        Person profile = personService.findbyUserid(user.getId());
        List<Friendlist> myfriends = friendService.getList(profile.getId());
        model.addObject("user", user);
        model.addObject("person", profile);
        model.addObject("myfriends", myfriends);
        model.setViewName("profile");
        return model;
    }

    @GetMapping("/admin")
    public ModelAndView gotoAdmin(ModelAndView model) {
        model.setViewName("admin/redirect");
        return model;
    }

    @GetMapping("editprofile/{id}")
    public ModelAndView gotoEditProfile(@PathVariable("id") Integer id, ModelAndView model) {
        Person person = personService.findbyid(id);
        model.addObject("person", person);
        model.setViewName("editprofile");
        return model;
    }

    @GetMapping("/registration")
    public String profileRegistration() {
        return "signup/userregistration";
    }

    @GetMapping("/termsandcondition")
    public String goToTermsandcondition() {
        return "signup/termsandcondition";
    }

    @GetMapping("/successstories")
    public ModelAndView goToSuccessStories(ModelAndView model, HttpSession httpSession) {
        Person userperson = (Person) httpSession.getAttribute("person");
        List<Stories> storylist = storiesService.getAll();
        model.addObject("storylist", storylist);
        model.addObject("person", userperson);
        model.setViewName("successstories");
        return model;
    }

    @GetMapping("/contactus")
    public ModelAndView goToContactus(ModelAndView model, HttpSession httpSession) {
        Person userperson = (Person) httpSession.getAttribute("person");
        model.addObject("person", userperson);
        model.setViewName("contactus");
        return model;
    }

    @PostMapping("findmatch")
    public ModelAndView findmatch(@ModelAttribute("searchModel") SearchModel searchModel, HttpSession httpSession, ModelAndView model) {
        Person userperson = (Person) httpSession.getAttribute("person");
//        Person userperson = (Person) httpSession.getAttribute("person");
        List<Person> matchinglist = personService.findbySexAndModel(userperson.getSex(), searchModel);
        model.addObject("user", userperson);
        model.addObject("matchinglist", matchinglist);
        model.setViewName("findmatch");
        return model;
    }

    @GetMapping("findmatch")
    public ModelAndView goToFindmatch(HttpSession httpSession, ModelAndView model) {
        Person userperson = (Person) httpSession.getAttribute("person");
        List<Person> matchinglist = personService.findbySex(userperson.getSex());
        model.addObject("user", userperson);
        model.addObject("matchinglist", matchinglist);
        model.setViewName("findmatch");
        return model;
    }

    @GetMapping("/view/{id}")
    public String viewProfile(@PathVariable("id") Integer id, HttpSession httpSession, Model model) {
        Person person = personService.findbyid(id);
        Person userperson = (Person) httpSession.getAttribute("person");
        List<Person> latestpersonlist = personService.findlatest(userperson.getUser().getId());
        Friendlist friendlship = friendService.getFriendship(userperson.getId(), person.getId());
        model.addAttribute("latestpersonlist", latestpersonlist);
        model.addAttribute("person", person);
        model.addAttribute("friendlship", friendlship);
        return "viewprofile";
    }

    @GetMapping("/changepassword")
    public ModelAndView changePass(HttpSession httpSession, ModelAndView model) {
        Person userperson = (Person) httpSession.getAttribute("person");
        model.addObject("user", userperson.getUser());
        model.setViewName("changepassword");
        return model;
    }

}
