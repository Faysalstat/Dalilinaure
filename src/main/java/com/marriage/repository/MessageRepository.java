/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.List;
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
public class MessageRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public List<Message> getMessageHistory(String roomid) {
        String sql = "select m from Message m where m.roomid = :id ";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", roomid);
        List<Message> list = query.list();
        return list;
    }

    public String saveMessage(Message message) {
        sessionFactory.getCurrentSession().save(message);
        return "message sent";
    }

    public String deleteMessageRoom(Message message) {
        sessionFactory.getCurrentSession().delete(message);
        return "deleted";
    }

    public String deleteMessageHistory() {
        return "deleted";
    }
}
