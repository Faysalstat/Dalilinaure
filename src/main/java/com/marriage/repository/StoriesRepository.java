/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.List;
import model.Message;
import model.Stories;
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
public class StoriesRepository {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public String saveStory(Stories story) {
        sessionFactory.getCurrentSession().save(story);
        return "message sent";
    }
    public String UpdateStory(Stories story) {
        sessionFactory.getCurrentSession().merge(story);
        return "message sent";
    }
    public Stories getStoryById(Integer id) {
        String sql = "select s from Stories s where s.id = :id ";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Stories> list = query.list();
        return list.get(0);
    }
    public List<Stories> getAll() {
        String sql = "select s from Stories s";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Stories> list = query.list();
        return list;
    }
    
}
