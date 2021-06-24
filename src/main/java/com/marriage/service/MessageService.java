/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.MessageRepository;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class MessageService {

    @Autowired
    MessageRepository messageRepository;

    public String saveMessage(Message message) {
        message.setSendtime(today());
        return messageRepository.saveMessage(message);
    }

    public List<Message> getMessageHistory(String roomid) {
        return messageRepository.getMessageHistory(roomid);
    }

    public String deleteMessageRoom(Message message) {
        return messageRepository.deleteMessageRoom(message);
    }

    private Date today() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }
}
