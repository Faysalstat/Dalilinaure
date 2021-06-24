/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.ArrayList;
import java.util.List;
import model.Notification;
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
public class NotificationRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public String saveNotification(Notification notification) {
        sessionFactory.getCurrentSession().save(notification);
        return "message sent";
    }
    public String UpdateNotification(Notification notification) {
        sessionFactory.getCurrentSession().merge(notification);
        return "message read";
    }
    
    public Notification findbyid(Integer id) {
        String sql = "Select n from Notification n where n.id= :id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Notification> list = query.list();
        return list.get(0);
    }

    public List<Notification> getNotificationListByUserId(Integer id) {
        String sql = "select n from Notification n where n.messageto = :id order by n.id desc";
        List<Notification> list = new ArrayList();
        try {
            Query query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setParameter("id", id);
            list = query.list();
        } catch (Exception e) {
        }

        return list;
    }

}
