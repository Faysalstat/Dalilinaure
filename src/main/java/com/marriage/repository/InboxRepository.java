/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.List;
import model.Inbox;
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
public class InboxRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public String createInbox(Inbox inbox) {
        sessionFactory.getCurrentSession().save(inbox);
        return "message sent";
    }

    public String unreadMessageInInbox(Inbox inbox) {
        sessionFactory.getCurrentSession().save(inbox);
        return "message sent";
    }

    public String UpdateMessagefromInbox(Inbox inbox) {
        sessionFactory.getCurrentSession().merge(inbox);
        return "message sent";
    }

    public String deleteInbox(Inbox inbox) {
        sessionFactory.getCurrentSession().delete(inbox);
        return "message sent";
    }

    public List<Inbox> findinboxbyroom(String chatroom) {
       String sql = "select i from Inbox i where i.roomid = :id ";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", chatroom);
        List<Inbox> list = query.list();
        return list;
    }
    
    public List<Inbox> findinboxbyUserId(Integer uid) {
       String sql = "select i from Inbox i where i.personid = :id and i.inbox=1";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", uid);
        List<Inbox> list = query.list();
        return list;
    }
    public Inbox findinvidualInbox(Integer pid, String chatroom) {
       String sql = "select i from Inbox i where i.roomid = :rid and i.personid= :pid ";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("rid", chatroom);
        query.setParameter("pid", pid);
        List<Inbox> list = query.list();
        return list.get(0);
    }
}
