/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.List;
import model.Mail;
import model.Message;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Faysal
 */

@Repository
@Transactional
public class MailRepository {
    @Autowired
    private SessionFactory sessionFactory;

    public List<Mail> getAllMailHistory() {
        String sql = "select m from Mail m order by m.id desc";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Mail> list = query.list();
        return list;
    }

    public String saveMessage(Mail mail) {
        sessionFactory.getCurrentSession().save(mail);
        return "message sent";
    }
}
