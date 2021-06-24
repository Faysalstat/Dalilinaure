/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.controller;

import com.marriage.service.FriendService;
import com.marriage.service.Inboxservice;
import com.marriage.service.MessageService;
import com.marriage.service.PersonService;
import com.marriage.service.UserService;
import java.util.List;
import model.Inbox;
import model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Faysal
 */
@RestController
public class ChatController {

    @Autowired
    PersonService personService;

    @Autowired
    UserService userService;

    @Autowired
    FriendService friendService;
    
    @Autowired
    Inboxservice inboxservice;

    @Autowired
    MessageService messageService;

    @PostMapping("sendmessage")
    @CrossOrigin(origins = "*")
    public String sendMessage(@ModelAttribute("message") Message message) {
        Inbox inbox = inboxservice.findinvidualInbox(message.getMessageto(), message.getRoomid());
        inbox.setInbox(1);
        messageService.saveMessage(message);
        inboxservice.UpdateMessagefromInbox(inbox);
        System.out.println("here it is");
        return message.getContent();
    }

    @GetMapping("fetchAllUsers/{roomid}/{personid}")
    @CrossOrigin(origins = "*")
    public List<Message> fetchAll(@PathVariable("roomid") String roomid,@PathVariable("personid") Integer pid) {
        Inbox inbox = inboxservice.findinvidualInbox(pid,roomid);
        inbox.setInbox(0);
        inboxservice.UpdateMessagefromInbox(inbox);
        List<Message> list = messageService.getMessageHistory(roomid);
        return list;
    }
}
