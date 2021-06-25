/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.InboxRepository;
import java.util.List;
import model.Inbox;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class Inboxservice {

    @Autowired
    InboxRepository inboxRepository;

    public String createInbox(Inbox inbox) {
        return inboxRepository.createInbox(inbox);
    }

    public String unreadMessageInInbox(Inbox inbox) {
        return inboxRepository.unreadMessageInInbox(inbox);
    }

    public String UpdateMessagefromInbox(Inbox inbox) {

        String resutl = inboxRepository.UpdateMessagefromInbox(inbox);
        return resutl;
    }

    public List<Inbox> findinboxbyUserId(Integer uid) {
        return inboxRepository.findinboxbyUserId(uid);
    }

    public String deleteInbox(Inbox inbox) {
        return inboxRepository.deleteInbox(inbox);
    }

    public List<Inbox> findinboxbyroom(String chatroom) {
        return inboxRepository.findinboxbyroom(chatroom);
    }

    public Inbox findinvidualInbox(Integer pid, String chatroom) {
        return inboxRepository.findinvidualInbox(pid, chatroom);
    }
}
