/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.controller;

import com.marriage.repository.TransactionRepository;
import com.marriage.service.FriendService;
import com.marriage.service.Inboxservice;
import com.marriage.service.MessageService;
import com.marriage.service.NotificationService;
import com.marriage.service.PersonService;
import com.marriage.service.ReportService;
import com.marriage.service.UserService;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.Friendlist;
import model.Inbox;
import model.Message;
import model.Notification;
import model.Person;
import model.Reported;
import model.Transactionlog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class RestApiController {

    @Autowired
    FriendService friendService;
    @Autowired
    UserService userService;
    @Autowired
    PersonService personService;
    @Autowired
    MessageService messageService;
    @Autowired
    Inboxservice inboxservice;
    @Autowired
    TransactionRepository transactionRepository;
    @Autowired
    NotificationService notificationService;
    @Autowired
    ReportService reportService;
    @Autowired
    private ServletContext servletContext;

    @GetMapping("checkuser/{username}")
    @CrossOrigin("*")
    public String checkUser(@PathVariable("username") String username) {
        return userService.checkUsername(username);
    }

    @PostMapping("imageupload/{id}")
    @CrossOrigin(origins = "*")
    public String testingAjax(@PathVariable("id") Integer id, @RequestParam("image") MultipartFile file) {
        Person person = personService.findbyid(id);
        String image = System.currentTimeMillis() + ".jpg";
        try {
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
//            System.out.println(servletContext.getRealPath("/"));tomcat/webapps/dalilinaure.com/ROOT/WEB-INF/img/profiles
            Path path = Paths.get(servletContext.getRealPath("/")+"/WEB-INF/img/profiles/"+ image);
            Files.write(path, bytes);
            person.setImage(image);
            person.setImageapproval("false");
            personService.UpdatePerson(person);

        } catch (IOException e) {
            return "{\"action\":false}";
        }
        return "{\"action\":true,\"image\":\"" + image + "\"}";
    }

    @GetMapping("updatebio/{id}/{bio}")
    @CrossOrigin(origins = "*")
    public String updateBio(@PathVariable("id") Integer id, @PathVariable("bio") String bio) {
        Person person = personService.findbyid(id);
        person.setBio(bio);
        person.setBioapproval("false");
        try {
            personService.UpdatePerson(person);
        } catch (Exception e) {
        }
        return bio;
    }

    @PostMapping("friendrequest/{id}")
    @CrossOrigin(origins = "*")
    public String friendRequest(@PathVariable("id") Integer id, HttpSession httpSession) {
        Person person1 = (Person) httpSession.getAttribute("person");
        Person person2 = personService.findbyid(id);

//        request sent by User
        Friendlist requestedBy = new Friendlist();
        requestedBy.setPersonByFriendId1(person1);
        requestedBy.setPersonByFriendId2(person2);
        requestedBy.setStatus("Pending");
        friendService.requestfriendship(requestedBy);

//        requested person
        Friendlist requestedTo = new Friendlist();
        requestedTo.setPersonByFriendId1(person2);
        requestedTo.setPersonByFriendId2(person1);
        requestedTo.setStatus("requested");
        friendService.requestfriendship(requestedTo);

        return "{\"action\":\"Pending\"}";
    }

    @PostMapping("acceptrequest/{id}")
    @CrossOrigin(origins = "*")
    public String acceptrequest(@PathVariable("id") Integer id, HttpSession httpSession) {
        Person person1 = (Person) httpSession.getAttribute("person");
        Person person2 = personService.findbyid(id);

//        request sent by User
        Friendlist requestedBy = friendService.getFriendship(person1.getId(), person2.getId());
        requestedBy.setStatus("Friend");
        String chatroom = requestedBy.getPersonByFriendId1().getId() + UUID.randomUUID().toString().split("-")[0] + requestedBy.getPersonByFriendId2().getId();
        requestedBy.setChatroom(chatroom);
        friendService.acceptFriendship(requestedBy);
        Inbox inboxforSender = new Inbox();
        inboxforSender.setPersonid(person1.getId());
        inboxforSender.setPerson(person2);
        inboxforSender.setRoomid(chatroom);
        inboxforSender.setInbox(0);
        inboxservice.createInbox(inboxforSender);

//        requested person
        Friendlist requestedTo = friendService.getFriendship(person2.getId(), person1.getId());
        requestedTo.setStatus("Friend");
        requestedTo.setChatroom(chatroom);
        friendService.acceptFriendship(requestedTo);
        Inbox inboxforRecipient = new Inbox();
        inboxforRecipient.setPersonid(person2.getId());
        inboxforRecipient.setPerson(person1);
        inboxforRecipient.setRoomid(chatroom);
        inboxforRecipient.setInbox(0);
        inboxservice.createInbox(inboxforRecipient);

        return "{\"action\":\"request sent\"}";
    }

    @PostMapping("rejectrequest/{id}")
    @CrossOrigin(origins = "*")
    public String rejectrequest(@PathVariable("id") Integer id, HttpSession httpSession) {
        Person person1 = (Person) httpSession.getAttribute("person");
        Person person2 = personService.findbyid(id);

//        request sent by User
        Friendlist requestedBy = friendService.getFriendship(person1.getId(), person2.getId());
        List<Message> messagehistory = messageService.getMessageHistory(requestedBy.getChatroom());
        List<Inbox> bothinbox = inboxservice.findinboxbyroom(requestedBy.getChatroom());
        for (Message message : messagehistory) {
            messageService.deleteMessageRoom(message);
        }

        for (Inbox inbox : bothinbox) {
            inboxservice.deleteInbox(inbox);
        }
        friendService.rejectFriendship(requestedBy);

//        requested person
        Friendlist requestedTo = friendService.getFriendship(person2.getId(), person1.getId());
        friendService.rejectFriendship(requestedTo);

        return "{\"action\":\"request sent\"}";
    }

    @PostMapping("paymentsuccess/{refid}/{type}")
    @CrossOrigin(origins = "*")
    public String paymentsuccess(@PathVariable("refid") String refid, @PathVariable("type") String type,
            HttpSession httpSession) {
        Person person = (Person) httpSession.getAttribute("person");
        Transactionlog transaction = new Transactionlog();
        transaction.setReferenceno(refid);
        transaction.setSubtype(type);
        transaction.setUser(person.getUser());
        person.getUser().setSubtype(type);
        person.getUser().setDos(today());
        try {
            person.setUser(userService.updateUser(person.getUser()));
            transactionRepository.saveTransaction(transaction);
            notificationService.sendpaymentNotification(person, refid);
        } catch (Exception e) {
        }
        return "{\"action\":\"request sent\"}";
    }

    @PostMapping("admin/sendreply")
    @CrossOrigin(origins = "*")
    public String sendReply(@ModelAttribute Notification notification) {
        String content = "<p> " + notification.getContent() + " </p>";
        notification.setContent(content);
        notificationService.saveNotification(notification);
        return "message sent";

    }

    @GetMapping("/markread/{id}")
    public String markAsRead(@PathVariable("id") Integer id) {
        Notification notification = notificationService.findbyid(id);
        notification.setStatus(1);
        try {
            notificationService.UpdateNotification(notification);
        } catch (Exception e) {

            return "message sent failed";
        }
        return "Marked Read";
    }

    @GetMapping("admin/checkedreport/{id}")
    @CrossOrigin
    public String checkedreport(@PathVariable("id") Integer id) {
        Reported reported = reportService.findbyid(id);
        reported.setChecked(1);
        try {
            reportService.UpdateReport(reported);
        } catch (Exception e) {

            return "message sent failed";
        }
        return "Marked Read";
    }

    @PostMapping("/report/{id}")
    @CrossOrigin(origins = "*")
    public String reportid(@PathVariable("id") Integer id, HttpSession httpSession) {
        Person user = (Person) httpSession.getAttribute("person");
        Person reported = personService.findbyid(id);
        Reported report = new Reported();
        report.setPersonByReported(reported);
        report.setPersonByReportedby(user);
        try {
            reportService.saveReport(report);
        } catch (Exception e) {

            return "message sent failed";
        }
        return "reported successfully";
    }

    private Date today() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }

    @PostMapping("addstory")
    @CrossOrigin
    public String addstory(@ModelAttribute Person person) {
        return "ok";
    }

}
