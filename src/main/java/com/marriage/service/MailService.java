/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.MailRepository;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Mail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class MailService {

    @Autowired
    MailRepository mailRepository;
    
    public List<Mail> getAllMailHistory() {
    return mailRepository.getAllMailHistory();
    }

    public String sendMail(Mail mail) {
        mail.setSendtime(today());
        mail.setInbox(1);
        return mailRepository.saveMessage(mail);
    }
    
    private Date today() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }

}
