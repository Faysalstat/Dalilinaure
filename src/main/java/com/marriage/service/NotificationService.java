/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.NotificationRepository;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Notification;
import model.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class NotificationService {

    @Autowired
    NotificationRepository notificationRepository;

    public String saveNotification(Notification notification) {
        notification.setSendtime(today());
        notification.setStatus(0);
        return notificationRepository.saveNotification(notification);
    }

    public String UpdateNotification(Notification notification) {
        return notificationRepository.UpdateNotification(notification);
    }

    public Notification findbyid(Integer id) {
        return notificationRepository.findbyid(id);
    }

    public List<Notification> getNotificationListByUserId(Integer id) {
        return notificationRepository.getNotificationListByUserId(id);
    }

    private Date today() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }
    private Date endDay(Date subdate) {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }

    public void sendpaymentNotification(Person person,String ref) {
        Notification notification = new Notification();
        notification.setSendtime(today());
        System.out.println(today());
        notification.setMessageto(person.getId());
        String interval = "one month";
        if (person.getUser().getSubtype().equals("Standard")) {
            interval="six months";
        }
        if (person.getUser().getSubtype().equals("Premium")) {
            interval="a year";
        }
        String content
                = "<p><span>Congratulations !</span> You have subscribed to our website as a "
                +person.getUser().getSubtype()+" member. Your membership will valid for "+interval+""
                + " and your transaction Reference is <<"+ref+">></p>";
                
        notification.setContent(content);
        notification.setStatus(0);
        notificationRepository.saveNotification(notification);

    }

}
