/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.controller;

import com.marriage.service.MailService;
import com.marriage.service.NotificationService;
import com.marriage.service.PersonService;
import com.marriage.service.ReportService;
import com.marriage.service.StoriesService;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.Mail;
import model.Notification;
import model.Person;
import model.Reported;
import model.Stories;
import model.Story;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class DashboardController {

    @Autowired
    PersonService personService;
    @Autowired
    NotificationService notificationService;
    @Autowired
    MailService mailService;
    @Autowired
    ReportService reportService;
    @Autowired
    private StoriesService storiesService;

    @GetMapping({"/", "/dashboard"})
    public ModelAndView goToContactus(ModelAndView model) {
        List<Person> imageApprovalList = personService.findbyImageapproval();
        List<Person> bioApprovalList = personService.findbyBioapproval();
        List<Reported> reportedlist = reportService.findbyAll();
        int solved = 0;
        int unsolved = 0;
        for (Reported report : reportedlist) {
            if (report.getChecked() == 0) {
                unsolved++;
            } else {
                solved++;
            }
        }

        model.addObject("solved", solved);
        model.addObject("unsolved", unsolved);
        model.addObject("reportedlist", reportedlist);
        model.addObject("imageApprovalList", imageApprovalList);
        model.addObject("bioApprovalList", bioApprovalList);
        model.setViewName("admin/dashboard");
        return model;
    }

    @GetMapping("/approval")
    public ModelAndView goToAprovalpage(ModelAndView model) {
        List<Person> imageApprovalList = personService.findbyImageapproval();
        List<Person> bioApprovalList = personService.findbyBioapproval();
        model.addObject("imageApprovalList", imageApprovalList);
        model.addObject("bioApprovalList", bioApprovalList);
        model.setViewName("admin/approval");
        return model;
    }
    @GetMapping("/profile")
    public ModelAndView goToProfile(ModelAndView model) {
        model.setViewName("admin/template");
        return model;
    }
   

    @GetMapping("/mail")
    public ModelAndView goToMailpage(ModelAndView model, HttpSession httpSession) {
        User admin = (User) httpSession.getAttribute("admin");
        List<Mail> mails = mailService.getAllMailHistory();
        model.addObject("admin", admin);
        model.addObject("mails", mails);
        model.setViewName("admin/mail");
        return model;
    }

    @GetMapping("approveimage/{id}")
    @CrossOrigin(origins = "*")
    public ModelAndView approveImage(@PathVariable("id") Integer id, ModelAndView model) {
        Person person = personService.findbyid(id);
        person.setImageapproval("true");
        person.setReviewed("true");
        String content = "<p>Admin approved your image. Your image now can be viewed by others</p>\n";
        Notification notification = new Notification();
        notification.setMessageto(id);
        notification.setContent(content);
        try {
            personService.UpdatePerson(person);
            notificationService.saveNotification(notification);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Person> imageApprovalList = personService.findbyImageapproval();
        List<Person> bioApprovalList = personService.findbyBioapproval();
        model.addObject("imageApprovalList", imageApprovalList);
        model.addObject("bioApprovalList", bioApprovalList);
        model.setViewName("admin/approval");
        return model;
    }

    @GetMapping("declineimage/{id}")
    @CrossOrigin(origins = "*")
    public ModelAndView declineImage(@PathVariable("id") Integer id, ModelAndView model) {
        Person person = personService.findbyid(id);
        String content
                = "<p>Yor Image Does not approved by Admin.Possible causes for disapproval are:</p>\n"
                + "<ol>\n"
                + "<li>Your pictures is inappropriate.</li>\n"
                + "<li>Is not the right picture(i.e. not human)</li>\n"
                + "</ol>";
        Notification notification = new Notification();
        notification.setMessageto(id);
        notification.setContent(content);
        person.setImageapproval("rejected");
        try {
            notificationService.saveNotification(notification);
            personService.UpdatePerson(person);
            List<Person> imageApprovalList = personService.findbyImageapproval();
            List<Person> bioApprovalList = personService.findbyBioapproval();
            model.addObject("imageApprovalList", imageApprovalList);
            model.addObject("bioApprovalList", bioApprovalList);
            model.setViewName("admin/approval");
        } catch (Exception e) {
            model.setViewName("error");
        }

        return model;
    }

    @GetMapping("declinebio/{id}")
    @CrossOrigin(origins = "*")
    public ModelAndView declinebio(@PathVariable("id") Integer id, ModelAndView model) {
        Person person = personService.findbyid(id);
        String content
                = "<p>Yor Bio Does not approved by Admin.Possible causes for disapproval are:</p>\n"
                + "<ol>\n"
                + "<li>Contains Bad Words.</li>\n"
                + "<li>Empty bio</li>\n"
                + "</ol>";
        Notification notification = new Notification();
        notification.setMessageto(id);
        notification.setContent(content);
        person.setBioapproval("rejected");
        try {
            notificationService.saveNotification(notification);
            personService.UpdatePerson(person);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Person> imageApprovalList = personService.findbyImageapproval();
        List<Person> bioApprovalList = personService.findbyBioapproval();
        model.addObject("imageApprovalList", imageApprovalList);
        model.addObject("bioApprovalList", bioApprovalList);
        model.setViewName("admin/approval");
        return model;
    }

    @GetMapping("approvebio/{id}")
    @CrossOrigin(origins = "*")
    public ModelAndView approveBio(@PathVariable("id") Integer id, ModelAndView model) {
        Person person = personService.findbyid(id);
        person.setBioapproval("true");
        person.setReviewed("true");
        String content
                = "<p>Admin accepted your bio.Your bio will be public now!</p>\n";

        Notification notification = new Notification();
        notification.setMessageto(id);
        notification.setContent(content);
        try {
            notificationService.saveNotification(notification);
            personService.UpdatePerson(person);
        } catch (Exception e) {

        }
        List<Person> imageApprovalList = personService.findbyImageapproval();
        List<Person> bioApprovalList = personService.findbyBioapproval();
        model.addObject("imageApprovalList", imageApprovalList);
        model.addObject("bioApprovalList", bioApprovalList);
        model.setViewName("admin/approval");
        return model;
    }
    
    @GetMapping("addstory")
    public String addstorypage(){


        return "admin/addstory";
    }

    @PostMapping("savestory")
    public ModelAndView StoryUpdate(@ModelAttribute Story story, ModelAndView model) {
        try {
            
            Person person1 = personService.findbyUserName(story.getPerson1());
            Person person2 = personService.findbyUserName(story.getPerson2());
            Stories newstory = new Stories(); 
            newstory.setPersonByPerson1(person1);
            newstory.setPersonByPerson2(person2);
            newstory.setStory(story.getStory());
            newstory.setStoryhead(story.getStoryhead());
            newstory.setImage(story.getImage());
            storiesService.saveStory(newstory);
            model.addObject("story", newstory);
        } catch (Exception e) {
            model.setViewName("error");
            return model;
        }
        model.setViewName("admin/redirect");
        return model;
    }

}
