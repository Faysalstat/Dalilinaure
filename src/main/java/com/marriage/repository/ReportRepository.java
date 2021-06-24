/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.ArrayList;
import java.util.List;
import model.Notification;
import model.Reported;
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
public class ReportRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public String saveReport(Reported reported) {
        sessionFactory.getCurrentSession().save(reported);
        return "message sent";
    }
    public String UpdateReport(Reported reported) {
        sessionFactory.getCurrentSession().merge(reported);
        return "message read";
    }
    
    public List<Reported> findbyAll() {
        String sql = "Select r from Reported r";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Reported> list = query.list();
        return list;
    }
    public List<Reported> findbyuncheck() {
        String sql = "Select r from Reported r where r.checked=0";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Reported> list = query.list();
        return list;
    }
    public Reported findbyid(Integer id) {
        String sql = "Select r from Reported r where r.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Reported> list = query.list();
        return list.get(0);
    }


}
